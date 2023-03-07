close all
clear all

F_final = 4000;
F_start = 0;
T = 16;
c = (F_final - F_start)/T;

t3=linspace(0,16,16*3e4);
y3=sin(2*pi*(c*(t3.^2)/2+F_start*t3));

t42=linspace(0,16,16*2e4);
y42=sin(2*pi*(c*(t42.^2)/2+F_start*t42));

t43=linspace(0,16,16*1e4);
y43=sin(2*pi*(c*(t43.^2)/2+F_start*t43));

t44=linspace(0,16,16*8e3);
y44=sin(2*pi*(c*(t44.^2)/2+F_start*t44));

t45=linspace(0,16,16*4e3);
y45=sin(2*pi*(c*(t45.^2)/2+F_start*t45));

t46=linspace(0,16,16*2e3);
y46=sin(2*pi*(c*(t46.^2)/2+F_start*t46));

for i=1:6:127000
    plot(t44(i:i+500),y44(i:i+500),'r');
    xlim([t44(i) t44(i+500)]);
    ylim([-1 1]);
    title("plot of signal with Fs=4kHz");
    grid on
    drawnow;
    pause(0.001);
end