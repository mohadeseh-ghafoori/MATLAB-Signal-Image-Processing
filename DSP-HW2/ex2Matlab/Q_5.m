
clc;
clear all;
close all; 
T=16; % The period of simulation
Fs=4000;
f_start=0;
f_final=4000; % signal starts @ 0 Hz, finishes @ 4000Hz
C = (f_final-f_start)/T;
t=0:1/Fs:16;
y=sin(2*pi*(C*(t.^2)/2+f_start*t)); % create chip waveform
N=1000;
for i=1:10:160000
    plot(t(i:i+N),y(i:i+N),'r');
    xlim([t(i) t(i+N)]);
    ylim([-1 1]);
    hold on;
    plot(t(i:i+N),y(i:i+N),'k.');
    xlim([t(i) t(i+N)]);
    ylim([-1 1]);
    title("signal with Fs=4kHz");
    grid on
    drawnow;
    pause(0.001);
end
