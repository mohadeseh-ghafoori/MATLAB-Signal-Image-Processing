%mohadeseh ghafoori 9632133
function [hiide]=hw2_hide(im,logo,L)
[m,n]=size(im);
logo=imresize(logo,size(im));
I=dither(logo);
for i=1:m
    for j=1:n
        hiide(i,j)=bitset(im(i,j),L,I(i,j));
    end
end
b=bitget(im,L);
sum=0;
for i=1:m
    for j=1:n
        sum=sum+((im(i,j)-hiide(i,j))^2);
    end
end
MSE=sum/(m*n);
disp("MSE is : ");
disp(MSE);
figure
imshow(im)
title('Original Image');
figure
imshow(hiide)
title('Watermarked Image');
end