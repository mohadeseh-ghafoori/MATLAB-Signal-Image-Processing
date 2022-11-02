%mohadeseh ghafoori 9632133
function [im_eq]=hw2_histeq(im)
[m,n]=size(im);
img=uint8(im);
h=zeros(1,256);
for i=1:m
    for j=1:n
      h(1,img(i,j)+1)=h(1,img(i,j)+1)+1; 
    end
end
h_prob=h/(m*n);   %matrix probability of image for each lighting level
for j=1:256
    if (j==1) im_cdf(1,1)=h_prob(1,1);
    else im_cdf(1,j)=im_cdf(1,j-1)+h_prob(1,j);
    end
end
eq=255*im_cdf;
for i=1:m
    for j=1:n
      im_eq(i,j)=eq(1,img(i,j)+1);  
    end
end
im_eq=uint8(im_eq);
imshow(im_eq)
title('new equlized image');
end