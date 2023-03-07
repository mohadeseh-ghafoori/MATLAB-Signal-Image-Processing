clear all
close all
clc



[x Fs] = audioread("m01iy.wav");
x=x';



N_Samples = 1000;
N=256;
eta=N/2;
lastFrame = floor(size(x,2)/N_Samples);
window = zeros(lastFrame,N);
h=ones(N,1);
h=h';
for i=1:lastFrame
    window(i,:)=x(i*N_Samples-(N-1):i*N_Samples).*h;
end

new_window = zeros(lastFrame,N+eta);
temp1 = zeros(1,N);
for i=1:lastFrame
    temp1(:) = window(i,:);
    lastSize = size(temp1,2); % lastSize = N;
    new_window(i,1:lastSize) = temp1(1:lastSize);
end
autoCo = zeros(lastFrame,eta);
AMDF = zeros(lastFrame,eta);
Cnew_window = zeros(lastFrame,N+eta);
for i=1:lastFrame
    Cnew_window(i,:) = new_window(i,:);
    for j=0:1:eta-1
        autoCo(i,j+1) = ((1)/(N-j))*sum(new_window(i,:) .* (circshift(Cnew_window(i,:),j)));
        AMDF(i,j+1) = ((1)/(N-j))*sum(abs(new_window(i,:) - circshift(Cnew_window(i,:),j)));
    end
end
subplot(2,2,1)
plot(AMDF(7,:))
title('7th AMDF of x[n]')

subplot(2,2,2)
plot(AMDF(1,:))
title('1th AMDF of x[n]')

subplot(2,2,3)
plot(autoCo(7,:))
title('7th AutoCorr of x[n]')

subplot(2,2,4)
plot(autoCo(1,:))
title('1th AutoCorr of x[n]')








