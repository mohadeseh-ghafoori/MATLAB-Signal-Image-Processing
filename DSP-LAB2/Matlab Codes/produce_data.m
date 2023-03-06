function data = produce_data(sig,pos,Fs,phi,c)
theta = 90*ones(1,numel(phi));
L = size(sig,1);
N = size(pos,2);
data = zeros(N,L);
x1 = pos(1,:);
y1 = pos(2,:);
z1 = pos(3,:);
for k = 1 : numel(phi)
    delays =(x1*sind(theta(k))*cosd(phi(k))+y1*sind(theta(k))*sind(phi(k))+z1*cosd(theta(k)))/c;
    delays = delays-min(delays);
    tm = round(delays*Fs);
    x_tmp = zeros(N,L);
    for n = 1 : N
        x_tmp(n,1+tm(n):end) = sig(1:L-tm(n),k);
    end
    data = data + x_tmp;
end