function output = Sigma(input1,input2,input3)
    %intializing coefficients and input data
    a = input1;
    h = input2;
    N = input3;
    sum = 0;
    %Processing Sigma
    if(N>1)
        for k=2:(N);
            if(k<=length(a))
                sum = sum + (a(k)*h(N-k+1));
            end

        end
    else
        sum=0;
    end
    output=sum;
end

