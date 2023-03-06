function [power] = NumberEffect1D(x)

    n_mic = x;
    temp = load('data2_linear.mat');
    data1 = temp.data2_linear;
    data = data1(1:n_mic,:);
    
    d = 0.042; %distance between each two near mic.
   
    x1 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]*d;


    c = 330; %sound speed
    Fs = 48000; %sampling Frequency

    n_phi = 179;
    
    for phi=0:1:n_phi
        radian = phi*pi/180; % degree is converted to radian
        relativeTimeDelay = (x1*cos(radian))/c;   %(n-1)*d*cos(phi)/c - because mic 1 is reference
        relativeSampleDelay = round (relativeTimeDelay * Fs); %time -> Sample

        for i=1:x
              y(i,:) = circshift(data(i,:),-relativeSampleDelay(i));  %x[n-n0]
        end

        for j=1:9600
            yt(j)=sum(y(:,j));
        end
            power(phi+1) = norm(yt);
    end


    % normalize power
    minPower=min(power);
    power=power-minPower;
    maxPower = max(power);
    power = power/maxPower;
   

end

