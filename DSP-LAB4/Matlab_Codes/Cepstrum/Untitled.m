clear all
close all
clc

cutoff_frequncy=50;
[temp Fs] = audioread("n13oo.wav");
x=temp';
x=x(3000:3500);

%N= Fs/cutoff_frequncy;
N=10;
cn = real_cepstrum(x);%Cn = Cs + Ce;
liftering_window=zeros(1,size(cn,2));
liftering_window(1:N) = ones(1,N);
cs = cn.*liftering_window;%ce is removed by liftering window
ce = cn - cs;


DFDT_cs = fft(cs);
magnitude_DFDT_cs = exp(real(DFDT_cs));
magnitude_DFDT_cs = magnitude_DFDT_cs + eps;
Ln_magnitude_DFDT_cs = log10(magnitude_DFDT_cs);

auto_correlation = xcorr(cn);

figure,plot(x);
figure,plot(log10(abs(fft(x))));
figure,plot(auto_correlation);
figure,plot(cn);
figure,plot(cs);
figure,plot(abs(fft(cn)));
figure,plot(Ln_magnitude_DFDT_cs);

figure,plot(x);
hold on,plot(cn);

