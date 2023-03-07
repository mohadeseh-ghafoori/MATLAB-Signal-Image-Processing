clc;
clear all;
close all; 
[y,Fs] = audioread('Linear_Chirp.wav');

sound(y,30000);
pause(2.5);
sound(y,20000);
pause(2.5);
sound(y,10000);
pause(2.5);
sound(y,8000);
pause(4);
sound(y,4000);
pause(5);
sound(y,2000);
pause(10);