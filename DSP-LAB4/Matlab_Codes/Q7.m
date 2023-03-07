clear all
close all
clc
string='d11oo';
[x Fs] = audioread("d11oo.wav");
x=x';

N=512;
L=20;
lastFrame = floor((size(x,2)-N));

h=hamming(N);
h=h';
j=1;
for i=1:L:lastFrame
    s=x(i:i+N-1).*h;
    stDTFT(j,:)=abs(fft(s));
    SS(j,:) = stDTFT(j,1:N/2);
    j=j+1;
end
figure,surf([1:size(SS,2)]*8/size(SS,2),[1:size(SS,1)]*20/16000,20*log10(abs(SS)),'edgecolor','none');
view(2);
title(string);
xlabel('Frequency(KHz):');
ylabel('Time(s):');
axis tight;
shading interp;
colorbar;
