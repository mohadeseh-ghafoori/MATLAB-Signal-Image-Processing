clear all
close all
clc
a=0.95;
teta=pi/4;
h=[1,-2*a*cos(teta),a^2];
Ak1=[1,0,0];
N=3;

x=audioread("C:\Users\Desktop\a2.wav");
x=x';
u=zeros(1,10);
u(1)=1;
[Bk2,r]=deconv(u,h);

z1=output(x,Ak1,h,N,size(x,2));
y1=output(z1,Ak1,Bk2,N,size(z1,2));
e1=y1-x;

sound(y1,1e4)

plot(x,'r');
hold on
plot(y1,'b');
plot(e1,'g');

%////////////////////////////////////////////

z2=output(x,Ak1,Bk2,N,size(x,2));
y2=output(z2,Ak1,h,N,size(z2,2));
e2=y2-x;

figure
plot(x,'r');
hold on
plot(y2,'b');
plot(e2,'g');

%///////////////////////////////////////////
function y = output(x,Ak,Bk,N,M)
y=zeros(1,M);
for n=1:1:M
    sum=0;
    for m=0:1:M-1
        if((n-m)<=0 || (n-m)>size(x,2))
            continue;
        elseif((m+1)>size(Bk,2))
                break;
        else
        sum=sum+Bk(m+1)*x(n-m);
        end
    end
    for i=1:1:N-1
        if((n-i)<=0 || (i+1)>size(Ak,2))
            continue;
        else
        sum=sum-Ak(i+1)*y(n-i);
        end
    end
    y(n)=sum/Ak(1);
end
end

