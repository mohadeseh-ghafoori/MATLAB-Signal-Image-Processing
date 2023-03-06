clear all
close all
clc


temp = load('data2_2D.mat');
data = temp.data2_2D;


d = 0.042; %distance between mic1 and mic2

x1 = [1 0 1 0 1 0 1 0 3 2 3 2 3 2 3 2]*0.042;
y1 = [0 0 1 1 2 2 3 3 3 3 2 2 1 1 0 0]*0.042;

c = 330; %sound speed
Fs = 48000; %sampling Frequency

n_phi = 359;

for phi=0:1:n_phi
    radian = phi*pi/180; % degree is converted to radian
    relativeTimeDelay = (x1*cos(radian)+y1*sin(radian))/c;   %(n-1)*d*cos(phi)/c - because mic 1 is reference
    relativeSampleDelay = round (relativeTimeDelay * Fs); %time -> Sample
    
    for i=1:16
          y(i,:) = circshift(data(i,:),-relativeSampleDelay(i));  %x[n-n0]
    end
    
    for j=1:9600
        yt(j) = sum(y(:,j));
    end
        power(phi+1) = norm(yt);
end


% to normalize power
minPower = min(power);
power = power-minPower;
maxPower = max(power);
power = power/maxPower;
%plot power
phi = 0:1:n_phi;
plot(phi,power(phi+1));
set(gca,'XLim',[0 360]);
set(gca,'YLim',[0 1]);
x_axis = (0:10:360);
set(gca,'XTick',x_axis);