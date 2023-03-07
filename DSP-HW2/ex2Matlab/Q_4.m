
clc;
clear all;
close all; 
Td=16; % The period of simulation
f_start=0;
f_final=4000; % signal starts @ 0 Hz, finishes @ 4000Hz
C = (f_final-f_start)/Td;
Fs_1=30000;
t_1=0:1/Fs_1:16;
y_1=sin(2*pi*(C*(t_1.^2)/2+f_start*t_1));% create chip waveform
Fs_2=20000;
t_2=0:1/Fs_2:16;
y_2=sin(2*pi*(C*(t_2.^2)/2+f_start*t_2));% create chip waveform
Fs_3=10000;
t_3=0:1/Fs_3:16;
y_3=sin(2*pi*(C*(t_3.^2)/2+f_start*t_3));% create chip waveform
Fs_4=8000;
t_4=0:1/Fs_4:16;
y_4=sin(2*pi*(C*(t_4.^2)/2+f_start*t_4));% create chip waveform
Fs_5=4000;
t_5=0:1/Fs_5:16;
y_5=sin(2*pi*(C*(t_5.^2)/2+f_start*t_5));% create chip waveform
Fs_6=2000;
t_6=0:1/Fs_6:16;
y_6=sin(2*pi*(C*(t_6.^2)/2+f_start*t_6));% create chip waveform
sound(y_1,Fs_1);
pause(16);
sound(y_2,Fs_2);
pause(16);
sound(y_3,Fs_3);
pause(16);
sound(y_4,Fs_4);
pause(16);
sound(y_5,Fs_5);
pause(16);
sound(y_6,Fs_6);
pause(16);

