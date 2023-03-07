clear all
close all
clc

d = 0.042; %distance between mic1 and mic2
x1 = [1 0 1 0 1 0 1 0 3 2 3 2 3 2 3 2]*d;
y1 = [0 0 1 1 2 2 3 3 3 3 2 2 1 1 0 0]*d;
C = 343; %sound speed
fs = 48000; %sampling Frequency
n_phi = 359;
N_window = 100; 

[temp,Fs] = audioread('recorded_data2_2K.wav');
temp = temp';

for i=1:N_window
   data = temp(:,(9600*(i-1)+1:9600*i));
   [power_MVDR,power_DAS] = my_pow(data,C,n_phi,fs,x1,y1);
   power_MVDR_tot(i,:) = power_MVDR;
   power_DAS_tot(i,:) = power_DAS; 
end


X = 1:360;
Y = 1:100;

figure(1);

waterfall(X,Y,power_DAS_tot);
colormap('jet');
view(2);
title('DAS pattern')
xlim([0 360]);
ylim([1 size(power_DAS_tot,1)]);
xlabel('phi');
ylabel('window number');

figure(2);

waterfall(X,Y,power_MVDR_tot);
colormap('jet');
view(2);
title('MVDR pattern');
xlim([0 360]);
ylim([1 size(power_MVDR_tot,1)]);
xlabel('phi');
ylabel('window number');




