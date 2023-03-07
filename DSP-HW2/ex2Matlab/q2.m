clear all;
close all; 
T=16; % 16 seconds
Fs=1000;
t=0:1/Fs:T;
f0=0;
f1=4000; % start @ 0 Hz, go up to 4000Hz
C = (f1-f0)/T; 
y=cos(2.*pi.*((C./2).*t.^2+f0.*t)); % create chirp waveform
plot(t,y);
sound(y,1000);
audiowrite('Linear_Chirp.wav',y,Fs);
