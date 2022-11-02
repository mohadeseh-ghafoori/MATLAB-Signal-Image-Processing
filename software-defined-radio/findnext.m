clc 
close all
clear all
f_min=88e6;
f_max=108e6;
l=2^18;
fs=3000000;
f_final=fs/2;
i_end=(f_max-f_min)/f_final;
f1=input('input CenterFreq: ');
for i=1:(fix(i_end)+1)
    fc=f_min+(i-1)*f_final;
    if fc > f_max
        break;
    end
   
sdr=comm.SDRRTLReceiver(...
    'CenterFrequency',fc,...
    'EnableTunerAGC',true,...
    'SampleRate',fs,...
    'SamplesPerFrame',l,...
    'OutputDataType','double');

data=step(sdr);
y=fft(data);
T=1/fs;
p2=abs(y/l).^2;
p1=p2(1:l/2+1);
f=fs*(0:(l/2))/l+fc;
[m,n]=size(p1);
main_mat(1:m,i)=p1;
f_mat(1:m,i)=f';
end

[max_of_den,m_max]=max(main_mat);
[max_of_energy,m_mmax]=max(max(main_mat));
[min_of_energy,m_mmin]=min(max(main_mat));
teresh=.99*max_of_den;
i=0.5e6;
while 1
    f1=f1+i;
    sdr = comm.SDRRTLReceiver(...
    'CenterFrequency', fc, ...
    'SampleRate',      fs, ...
    'SamplesPerFrame', 2^18, ...
    'OutputDataType',  'double');
    s=step(sdr);
    y=fft(s);
    y=(abs(y)).^2;
    if(y>teresh)
      f2=f1;
      break;
    end
    if(f1>108e6)
       f2=108e6;
       break
    end
       
end