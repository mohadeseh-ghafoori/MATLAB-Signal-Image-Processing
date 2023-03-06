clear all
close all
clc

%temp = load('data1_linear.mat');
temp = load('data2_linear.mat');
data = temp.data2_linear;


d = 0.042; %distance between mic1 and mic2
x1 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]*d;


c = 330; %sound speed
Fs = 48000; %sampling Frequency

n_phi = 179;

for phi=0:1:n_phi
    radian = phi*pi/180; % degree is converted to radian
    relativeTimeDelay = (x1*cos(radian))/c;   %(n-1)*d*cos(phi)/c - because mic 1 is reference
    relativeSampleDelay = round (relativeTimeDelay * Fs); %time -> Sample
    
    for i=1:16
          y(i,:) = circshift(data(i,:),-relativeSampleDelay(i));%x[n-n0]
    end
    
    % Implemention of MinVariance pattern
    R = y*y'; % Spatial Covarriance Matrix
    R_inv = inv(R);
    power(phi+1) = abs(1/sum(sum(R_inv))); % Power of formula P = 1/at*inv(R)*a by the sum of all element inv(R)
    
    
    % Implementation of DAS pattern
    for j=1:9600
        yt(j) = sum(y(:,j));
    end
    power2(phi+1) = norm(yt);
    
end


% to normalize power minimum variance
minPower = min(power);
power = power-minPower;
maxPower = max(power);
power = power/maxPower;

% to normalize power DAS
minPower2 = min(power2);
power2 = power2-minPower2;
maxPower2 = max(power2);
power2 = power2/maxPower2;


%plot power
phi = 0:1:n_phi;
hold on
plot(phi,power(phi+1),'linewidth',1.5);
plot(phi,power2(phi+1),'r','linewidth',1.5);
hold off
legend('MVDR','DAS');
xlabel('angle(degree)');
ylabel('Power(normalized [0,1])')
set(gca,'XLim',[0 n_phi+1]);
x_axis = (0:10:n_phi+1);
set(gca,'XTick',x_axis);

