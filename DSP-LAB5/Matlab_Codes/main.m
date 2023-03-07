clc
clear


for k=1:48
    if(k>21)
        k = k+1; % because our teacher didn't give us 22.wav !!!
    end

%     k = 6;
    close all
    cp = 0.2;
    cn = -0.2;

    string = ['C:\Desktop\AZ6_DSP\exc1 - Copy\' num2str(k),'.wav']; 
    [y,fs] = audioread(string);
    data = y;
    
    figure,plot(y)
    title('Signal');

    y = cutter(y,cp,cn);

    figure,plot(y);
    title('Signal after Cutter');

    % LowPathFilter 

    f_lp = 800*2/fs;
    c = fir1(160,f_lp,'low');
    y_filter = filter(c,1,y);
    % figure; plot(y_filter);

    % Pre-emphasize filter

      y_pre = filter([1 -0.9375],1,y_filter) ;

    % DownSample & LPC Coefficient

    n_window = 64;
    n_downsample = 5;
    y_downsample = y_pre(1:n_downsample:end);
    last_window = floor(length(y_downsample)/n_window);
    y_frame = zeros(last_window,n_window);
%     zerocross = zeros(last_window,1);
    energy = zeros(last_window,1);
    w = hamming(n_window);
    w = w'; % multiply element by element 
    M = 4; %The order of LPC M = fs +(4 or 5) >>>>> Vioced
    a = zeros(last_window,M+1);
    pitch = zeros(last_window,1);

    for i = 7:8
        y_frame = y_downsample(n_window*(i-1)+1:n_window*i).*w;
        energy(i) = norm(y_frame);
%         zerocross(i) = sum(abs(diff(heviside(y_frame))));
        a(i,:) = my_LPC(y_frame,M);
        src = filter(a(i,:),1,y_frame); %source of sound
        
%         figure,plot(20*log10(fftshift(abs(fft(y_frame)))));
%         title('abs-fft frame Per Window');
%         figure,plot(20*log10(fftshift(abs(fft(src)))));
%         title('abs-fft source Per Window');
        
        auto_src = xcorr(src);
        len = length(src);
        [a1,b1] = max(auto_src(len+2:end)); % sometimes 65omin sample is max near after 64
        if(sum(y_frame)==0)
            pitch(i) = 0; 
        else
            pitch(i) = b1+1 %because after 2 point is computed according to above
        end
%         figure;
%         plot(auto_src);
%         title('Auto-Correllation of Source Signal');

    end
    
    max_energy = max(energy);
    index_window = find(energy>0.7*max_energy);
    figure,plot(energy);
    title('Energy Per Window');
    figure,plot(pitch);
    title('Pitch Per Window');
    
    pitch2 = fs./(n_downsample*pitch(index_window));
    pitch2 = sort(pitch2);
    index_part = find(abs(diff(pitch2))>10);
    if (isempty(index_part) == 1) % if data's are near to each other
        index_part = length(pitch2); 
    end
    
        pitch2 = pitch2(1:index_part); %deleting data part
    

    figure,plot(pitch2);
    title('Pitch Per Window after deleting far from average data');
    main_pitch = mean(pitch2);

    if((60<main_pitch) && (main_pitch<180))
        disp('The speech is pronounced by Man');
        sound_lable(k) = {'Man'};
    elseif((180<main_pitch) && (main_pitch<300))
        disp('The speech is pronounced by Woman');
        sound_lable(k) = {'Woman'};
    else
        disp('Sorry... We cant recognize.');
         sound_lable(k) = {'Undetected'};

    end
    
%     sound(data,fs);
%     plot(data)
%     pause(2);

end

