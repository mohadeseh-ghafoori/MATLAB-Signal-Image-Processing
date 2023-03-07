function g = Q4_partC(P,K)

if(P>K)
    disp('P must be lower than K');
else
    for n= 1:128
        if(0<=n && n<=P)
        g(n) = 0.5*(1-cos(pi*n/P)); 
        else if(P<=n && n<=K)
        g(n) = cos([pi*(n-P)]/[2*(K-P)]);
        else
        g(n) = 0;
        end
    
    end

end




end