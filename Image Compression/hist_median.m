%mohadeseh ghafoori 9632133
function [new_im]=hist_median(im)
[m,n]=size(im);
new_im=zeros(m,n);
h=zeros(1,256);
flag1=0;
flag2=0;
flag3=0;
for i=1:m
    for j=1:n
      h(1,im(i,j)+1)=h(1,im(i,j)+1)+1; 
    end
end
figure;
plot(h);
title('h : histogram of image');
sum=0;
for i=1:256
    sum=sum+h(1,i);
    if ( flag1 ==0 ) 
    if(sum > floor(0.25*m*n)) 
        t01=i-1;
        flag1=1;
        continue
    end
    end
    if ( flag2==0 )
    if(sum > floor(0.5*m*n)) 
        t0=i-1;
        flag2=1;
        continue
    end
    end
    if ( flag3==0 ) 
    if(sum > floor(0.75*m*n)) 
        t02=i-1;
        flag3=1;
        continue
    end
    end
end
for i=1:m
    for j=1:n
     if( im(i,j) < t01 ) 
         new_im(i,j)=0;
     elseif ( im(i,j) >= t01 && im(i,j) < t0 )
         new_im(i,j)=1;
     elseif ( im(i,j) >= t0 && im(i,j) < t02 )
         new_im(i,j)=2;
     else new_im(i,j)=3;
     end
    end
end
figure
imshow(new_im,[]);
title('new image with median cut method');
end