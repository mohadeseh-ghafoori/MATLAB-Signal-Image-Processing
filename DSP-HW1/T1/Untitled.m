%initalizing MATLAB
    clear all
    close all
    clc
%intializing Coefficients and Input Datas
    [x Fs]=audioread('abc.wav');
    x=x';
    alpha = 1.1;
    %************************
    filter = 0 ;%if filter = 1 => filter in MATLAB , if filter = 0 => myfilter 
    system = 1 ;%if system = 0 => h(z)=(1-alpha*e^j(tetta)*z^-1)*(1-alpha*e^-j(tetta)*z^-1)
    theta=pi/4 ;%if system = 1 => h(z)=1/((1-alpha*e^j(tetta)*z^-1)*(1-alpha*e^-j(tetta)*z^-1))
    %************************
    a = [1];
    b = [1 -2*(alpha)*cos(theta) (alpha^2)];
%Processing 1
    if(filter == 0 )
        if(system == 0)
             z=myfilter(a,b,x);
             y=myfilter(b,a,z);
        else
            z=myfilter(b,a,x);
            y=myfilter(a,b,z);
        end
    else
        if(system == 0)
             z=filter(b,a,x);
             y=filter(a,b,z);
        else
            z=filter(a,b,x);
            y=filter(b,a,z);
        end
    end

     %sound(y,Fs);
 %plotting
    string_title1="\alpha = "+alpha;
    string_title2="\theta = "+theta;
    if(system == 0)
        string_title3="H(z)=(1-\alphae^{+j\theta}z^{-1}).(1-\alphae^{-j\theta}z^{-1})";
    else
        string_title3="H(z)=1/(1-\alphae^{+j\theta}z^{-1}).(1-\alphae^{-j\theta}z^{-1})";
    end
    if(filter == 1 )
        string_title4 = "filter MATLAB";
    else
        string_title4 = "myfilter";
    end;
    
    suptitle({'','',char(string_title1),char(string_title2),char(string_title3),char(string_title4)})
    subplot(3,2,3);
    n = 5000:14999;
    plot(n,x(5000:14999));
    title('x[n]')
    
    subplot(3,2,4);
    plot(n,z(5000:14999));
    title('z[n]')
    
    subplot(3,2,5);
    plot(n,y(5000:14999));
    title('y[n]')
    
    subplot(3,2,6);
    e=y-x;
    plot(n,e(5000:14999));
    title('e[n]')
    


%     ynew = filter(b,a,x);







