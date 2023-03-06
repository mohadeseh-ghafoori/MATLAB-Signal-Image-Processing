function [power,power2] = LengthEffect_1D(d)

    c = 330; %sound speed
    Fs = 48000; %sampling Frequency
    target_phi = [40 120]; % Source Number
    NT = numel(target_phi); % number of element target_phi
    
    sig = randn(9600,NT); % Generating signal that has all of frequency => White-Gossian-Signal  

    % position microphone 1D
    x1 = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]*d;
    y1 = zeros(1,16);
    z1 = zeros(1,16);
	pos = [x1;y1;z1];
    
    % Call Produce_data function 
    data = produce_data(sig,pos,Fs,target_phi,c);

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


    % to normalize power Minimum Variance
    minPower = min(power);
    power = power-minPower;
    maxPower = max(power);
    power = power/maxPower;

    % to normalize power DAS
    minPower2 = min(power2);
    power2 = power2-minPower2;
    maxPower2 = max(power2);
    power2 = power2/maxPower2;
end
    