function [ y ] = heviside( x )
len = length(x);
y = zeros(1,len);

for i=1:len
    if(x(i)>0)
        y(i) = 1;
    else
        y(i) = 0; 
    end
end
    
        


end

