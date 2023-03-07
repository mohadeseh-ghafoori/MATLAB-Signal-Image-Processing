clc
clear 
close all

sample_number = 512;

[y,Fs] = audioread('C:\Users\JAVAD\Desktop\AZ4_DSP\exc1 - Copy\39.wav');
  y = y(4001:4000+sample_number);

%% plot time waveform
figure
plot(y);

%% plot spectrum
figure
Y = fftshift(fft(y));
f = -Fs/2:Fs/length(Y):Fs/2-Fs/length(Y); % nyquist
plot(f,abs(Y));
xlabel('Frequency');
sound(y,Fs);
