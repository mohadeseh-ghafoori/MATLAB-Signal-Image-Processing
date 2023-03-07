clc
clear
close all

FFT_Length = 128;  %Length of FFT

P = 0.95;
K = 0.3;
g = Q4_partA(P,K);

figure
subplot(3,1,1)
stem(g);
title(['P = ' num2str(P),  '  ,  K = ' num2str(K), ],'color','r');

%% DFT 128 points
f = -pi:2*pi/FFT_Length:pi-pi/FFT_Length;
G = fftshift(fft(g,FFT_Length)); 
subplot(3,1,2)
plot(f,abs(G));
title('abs (G)','color','r');

subplot(3,1,3)
plot(f,angle(G));
title('angle (G)','color','r');








% figure
% subplot(2,3,1)
% stem(Q4_partA(0.95,0.94));
% title(['alpha = ' num2str(0.3), '    ,    beta = ' num2str(0.15)],'color','r');
% subplot(2,3,2)
% stem(Q4_partA(0.95,0.5));
% title(['alpha = ' num2str(0.3), '    ,    beta = ' num2str(0.2)],'color','r');
% subplot(2,3,3)
% stem(Q4_partA(0.95,0));
% title(['alpha = ' num2str(0.3), '    ,    beta = ' num2str(0.2)],'color','r');
% subplot(2,3,4)
% stem(Q4_partA(0.2,0.05));
% title(['alpha = ' num2str(0.2), '    ,    beta = ' num2str(0.05)],'color','r');
% subplot(2,3,5)
% stem(Q4_partA(0.2,0.1));
% title(['alpha = ' num2str(0.2), '    ,    beta = ' num2str(0.1)],'color','r');
% subplot(2,3,6)
% stem(Q4_partA(0.2,0.15));
% title(['alpha = ' num2str(0.2), '    ,    beta = ' num2str(0.15)],'color','r');
% 


% P = 20;
% K = 50;
% 
% figure
% subplot(2,3,1)
% stem(Q4_partC(P-10,K));
% title(['P = ' num2str(P-10),  '  ,  K = ' num2str(K), ],'color','r');
% subplot(2,3,2)
% stem(Q4_partC(P,K));
% title([ 'P = ' num2str(P), '  ,  K = ' num2str(K), ],'color','r');
% subplot(2,3,3)
% stem(Q4_partC(P+10,K));
% title([ 'P = ' num2str(P+10), '  ,  K = ' num2str(K), ],'color','r');
% subplot(2,3,4)
% stem(Q4_partC(P,K-10));
% title(['P = ' num2str(P),  '  ,  K = ' num2str(K-10), ],'color','r');
% subplot(2,3,5)
% stem(Q4_partC(P,K+10));
% title([ 'P = ' num2str(P), '  ,  K = ' num2str(K+10), ],'color','r');
% subplot(2,3,6)
% stem(Q4_partC(P,K+20));
% title([ 'P = ' num2str(P), '  ,  K = ' num2str(K+20), ],'color','r');

