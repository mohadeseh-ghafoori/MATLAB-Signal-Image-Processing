clear
clc
close all

[audio,Fs] = audioread('a2.wav');
w1=1/4;
dw=1/20;
[b1,a1]=butter(6, [w1-dw w1+dw ],'stop');

%////////////////////////part 1
%section a
figure('Name','Zero-Pole plot of unquantized filter','NumberTitle','off');
zplane(b1,a1)

%section b
figure('Name','Frequency response of unquantized filter','NumberTitle','off');
[h1,w] = freqz(b1,a1,100);
plot(w/pi,abs(h1))

%section c
audio_denoised = filter(b1,a1,audio);
%sound(audio_denoised,Fs)

%section d
figure('Name','Plot of audio','NumberTitle','off');
subplot(2,2,1);
plot(audio(10000:10100));
xlim([1 100]);
title("Noisy Audio");

subplot(2,2,2);
[pxx,f] = pwelch(audio,Fs);
plot(f/pi,10*log10(pxx))
title("Noisy Audio PSD");

subplot(2,2,3);
plot(audio_denoised(10000:10100));
xlim([1 100]);
title("Denoised Audio");

subplot(2,2,4);
[pyy,f] = pwelch(audio_denoised,Fs);
plot(f/pi,10*log10(pyy))
title("Denoised Audio PSD");

%////////////////////////part 2
a2 = round(a1,5);
b2 = round(b1,5);

%section a
figure('Name','Zero-Pole plot of quantized filter','NumberTitle','off');
zplane(b2,a2)

%section b
figure('Name','Frequency response of quantized filter','NumberTitle','off');
[h2,w] = freqz(b2,a2,100);
plot(w/pi,abs(h2))

%section c
audio_denoised_quantized = filter(b2,a2,audio);
%sound(audio_denoised_quantized,Fs)

%////////////////////////part 3
pole = roots(a1);
zero = roots(b1);
h3 = ones(100,1);
a=zeros(6,3);
b=zeros(6,3);
for i=1:6
    a(i,:) = poly(pole(2*i-1:2*i));
    b(i,:) = poly(zero(2*i-1:2*i));
    a(i,:) = round(a(i,:),2);
    b(i,:) = round(b(i,:),2);
    [h(:,1),w] = freqz(b(i,:),a(i,:),100);
    h3 = h3.*abs(h(:,1));
end

figure('Name','Frequency response of cascade implemented filter','NumberTitle','off');
plot(w/pi,h3)

%passing audio through systems
audio_t=audio;
for i=1:6
    audio_t = filter(b(i,:),a(i,:),audio_t);
end
sound(audio_t,Fs)

%calculating of total system function
a_t=a(1,:);
b_t=b(1,:);
for i=2:6
    a_t=conv(a_t,a(i,:));
    b_t=conv(b_t,b(i,:));
end
figure('Name','Zero-Pole plot of cascade implemented filter','NumberTitle','off');
zplane(b_t,a_t)