function [y] = cutter(x,cp,cn)
    temp1 = find(x>cp)
    temp2 = find(x<cn)
    y=zeros(1,size(x,2));
    y(temp1)=x(temp1);
    y(temp2)=x(temp2);
end

