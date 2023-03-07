function a = my_LPC(y,M)

    y_corr = [xcorr(y),0];
    rs = y_corr(length(y)+1:length(y)+M)';
    Rs = zeros(M,M);

    for i=1:M
      Rs(:,i) = y_corr(length(y)-(i-1):length(y)+(M-i)); %xcorr is symetric , rs(0)=length(y)
    end
    
    if(det(Rs)==0)
       coe = NaN(1,M); 
    else
    coe = -(pinv(Rs)*rs)';
    end
    
    a = [1,coe];
end


% 
% for i=1:16
%           y(i,:) = circshift(data(i,:),-relativeSampleDelay(i));  %x[n-n0]
%     end
% f = -fs/2:fs/length(y):fs/2-fs/length(y);
% plot(f,fftshift(abs(fft(y))));

