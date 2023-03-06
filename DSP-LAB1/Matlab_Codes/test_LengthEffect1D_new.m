clear all
close all
clc

n_phi = 179;
N = 4;
d = 0.042;

for i = 1:N
    figure(1)
    power = LengthEffect1D_new(i);  
    
    % plot power
    phi = 0:1:n_phi;
    plot(phi,power(phi+1));
    set(gca,'XLim',[0 n_phi]);
    x_axis = (0:10:n_phi);
    set(gca,'XTick',x_axis);
    

    
  % centralize figure size when run matlab
    x0=0;         
    y0=0;
    width=1600;
    height=900;
    set(gcf,'position',[x0,y0,width,height])
    
    xlabel('\Phi')
    ylabel('power')
    title(['distance between two near microphones is : ' num2str(i) ' * ' num2str(d)])
    F(i) = getframe(gcf) ; 
    pause(0.01)
end
    
  % create the video writer with 1 fps
  writerObj = VideoWriter('LengthEffect.avi');
  writerObj.FrameRate = 1;  
  % set the seconds per image
  
% open the video writer
open(writerObj);
% write the frames to the video
for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;    
    writeVideo(writerObj, frame);
end
% close the writer object
close(writerObj);