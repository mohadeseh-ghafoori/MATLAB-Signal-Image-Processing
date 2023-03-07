clc;
clear all;
close all; 
T=16; % 16 seconds
Fs=1000;
f0=0;
f1=4000; % start @ 0 Hz, go up to 4000Hz
C = (f1-f0)/T;

n=0.008;
for i=0:100
    t=n*i:0.0005:n*i+0.1;
    y=cos( 2.*pi.*((C./2).*t.^2+f0.*t));
    plot(t,y,'-.');
    grid on;
    drawnow
    pause(0.4);
end




 