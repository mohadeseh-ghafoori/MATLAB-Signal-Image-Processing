clc
close all

n_alph = 8;
y = y';
energy = zeros(n_alph);

for i = 1:n_alph 
    
    energy(i) = norm(y(Fs*3*(i-1)+1:Fs*3*i));  
end

stem(energy);
ylabel('Energy')
xlabel('  f               T              s              S             h             I             @            R   ');