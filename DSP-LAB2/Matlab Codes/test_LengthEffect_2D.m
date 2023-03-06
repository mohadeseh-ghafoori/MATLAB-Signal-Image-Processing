clear all
close all
clc

n_phi = 179;
N = 10;
d = 0.005;

for i = 1:N
    figure(1)
    [power,power2] = LengthEffect_2D(i*(i+1)*d); % => d=0.01,0.03,0.06,...,0.55
    
    % plot power
    phi = 0:1:n_phi;
    plot(phi,power(phi+1),'linewidth',1.5);
    hold on
    plot(phi,power2(phi+1),'r','linewidth',1.5);
    hold off
    legend('MVDR','DAS');
    xlabel('angle(degree)');
    ylabel('Power(normalized [0,1])')
    set(gca,'XLim',[0 n_phi+1]);
    x_axis = (0:10:n_phi+1);
    set(gca,'XTick',x_axis);

    
    % centralize figure size when run matlab
    x0=0;         
    y0=0;
    width=1600;
    height=900;
    set(gcf,'position',[x0,y0,width,height])
    
    Number = i*(i+1)*d; % the value you want to put on the title
    title(['Distance between two near microphone is : ' num2str(Number)  ])
    F(i) = getframe(gcf) ; 
    pause(0.01)
end
  

  % create the video writer with 1 fps
  writerObj = VideoWriter('LengthEffect_2D.avi');
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