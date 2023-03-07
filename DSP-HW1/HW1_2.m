clc;
clear;
close all;

b = [2,3,1,7 ];
a = [1,0.2 ];

x = randn(1000,1 );
y = filter(b,a,x );
y1 = filterbax(b,a,x );

subplot(3,1,1);
plot(y,'b');
title('input signal');

subplot(3,1,2);
plot(y,'r');
title('with filter function()');

subplot(3,1,3);
plot(y1,'g');
title('without filter function()');



function y = filterbax(b,a,x )
% The function expects inputs to be column vectors

M = length(b );
N = length(a );
xbuffer = [];
ybuffer = [];

for i = 1:1:length(x)
    xbuffer = [x(i)];
    if length(xbuffer) < M
    index = length(xbuffer );
    else
    index = M ;
    end

    if length(ybuffer) < N-1
    yindex = length(ybuffer);
    else
    yindex = N-1 ;
    end

    y(i) = (1/a(1)).*(sum(b(1:index).*xbuffer(1:index)) - sum(a(2:yindex+1).*ybuffer(1:yindex)));
    ybuffer = [y(i);ybuffer ];
end

y = y(:); % Return as column vector
end






