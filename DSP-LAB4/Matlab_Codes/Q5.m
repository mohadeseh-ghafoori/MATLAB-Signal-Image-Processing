%in the name of god
clear all
close all
clc

[x Fs] = audioread("y05oo.wav");
x=x';


N=512;
eta=256;
lastFrame = floor(size(x,2)/N);
window = zeros(lastFrame,N);

myhamming = hamming(N);
myhamming=myhamming';
for i=1:lastFrame
    window(i,:)=x(N*(i-1)+1:N*i).*myhamming;
    %window(i,:)=x(N*(i-1)+1:N*i);
end

%my autocorrelation
autoCorr = zeros(1,eta);
for i=1:lastFrame
    temp = xcorr(window(i,:));
    autoCorr(i,:) = temp(N:N+eta-1);
    %AMDF(i,:) = sum(abs(temp(N:N+eta-1)-autoCorr(i,:))); //Naghdi
end


plot(x)
figure 
plot(autoCorr(1,:))
figure 
plot(autoCorr(5,:))






stDFT = zeros(lastFrame,N);
for i=1:lastFrame
    stDFT(i,:) = (1/N)*abs(fftshift(fft(window(i,:),N)));
end
f = -Fs/2 :Fs/N:(Fs/2) - Fs/N;
figure
plot(f,stDFT(1,:));
figure
plot(f,stDFT(5,:));





