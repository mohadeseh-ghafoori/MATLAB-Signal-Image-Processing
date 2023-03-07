clc;
clear all;
close all; 
[y,Fs] = audioread('Linear_Chirp.wav');
sound(y,4000);