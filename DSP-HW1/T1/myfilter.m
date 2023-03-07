function output = myfilter(input1,input2,input3)
    %intializing coefficients and input data
    a = input1;
    b = input2;
    x = input3;
    size_h=12000;
    h=zeros(1,size_h);
    %processing Filter
    for i=1:size_h
        if(i<=length(b))
            h(i) = (b(i) - Sigma(a,h,i))/a(1);
        else
             h(i) = - (Sigma(a,h,i)/a(1));
        end
    end
    y = conv(h,x);
    ynew=y(1:length(x));
    %end process
    output = ynew;
end

