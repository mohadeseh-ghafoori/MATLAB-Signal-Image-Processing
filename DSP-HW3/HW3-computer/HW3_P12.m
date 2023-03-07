
%initialize
    close all
    clear 
    clc
%Read a part of audio
    t = 6; %seconds of reading audio
    [y,Fs] = audioread('a2.wav');
    filename = 'a2.flac';
    audiowrite(filename,y,Fs);
    samples = [1,t*Fs];
    [y,Fs] = audioread('a2.wav',samples);
%implement Butterworth filter
    w1 = 1/4;
    dw = 1/20;
    [b1,a1] = butter(6, [w1-dw w1+dw],'stop');
%round the numerator and denominator coefficients b1 and a1
    n = 10; %significant numbers
    b2 = round(b1,n,'significant');
    a2 = round(a1,n,'significant');
%filter audio
    s1 = filter(b1,a1,y);
    s2 = filter(b2,a2,y);
%play audio ; first without quantization ; next by n significant numbers
    sound(s1,Fs);
    pause(t);
    sound(s2,Fs);
%Z-plane
    figure(1)
    zplane(b1,a1);
    figure(2)
    zplane(b2,a2);
%frequency response
    figure(3)
    freqz(b1,a1,'whole');
    figure(4)
    freqz(b2,a2,'whole');
%plot input and output
    figure(5)
    plot(y);
    title('input signal');
    figure(6)
    subplot(211)
    plot(s1);
    title('Output without quantization');
    subplot(212)
    plot(s2);
    title('Quantization with 10 significant numbers');
