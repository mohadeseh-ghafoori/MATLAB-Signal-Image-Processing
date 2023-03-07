%initialization
    close all
    clear 
    clc
%Reading part of audio
    t = 8; %seconds of reading audio
    [y,Fs] = audioread('a2.wav');
    filename = 'a2.flac';
    audiowrite(filename,y,Fs);
    samples = [1,t*Fs];
    [y,Fs] = audioread('a2.wav',samples);
%implemention of ButterWorth filter
    w1 = 1/4;
    dw = 1/20;
    [b1,a1] = butter(6, [w1-dw w1+dw],'stop');
%rounding the numerator and denominator coefficients b1 and a1
    n = 10; %significant numbers
    b2 = round(b1,n,'significant');
    a2 = round(a1,n,'significant');
    figure(1)
    zplane(b1,a1);
    figure(2)
    zplane(b2,a2);
%filtering audio
    s1 = filter(b1,a1,y);
    s2 = filter(b2,a2,y);
%frequency response
    figure
    freqz(b1,a1,'whole');
    figure
    freqz(b2,a2,'whole');
%plot input and output
    figure
    plot(y);
    figure
    subplot(211)
    plot(s1);
    title('Without quantization');
    subplot(212)
    plot(s2);
    title('Quantization with 10 significant numbers');
