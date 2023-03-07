clear
close all

Fs = 44100 ; % Sampling Freq. (Hz)
nBits = 16;  % Number of bits of ADC of sound card of system
nChannels = 1; % Number of channels of recording device

Length = 8;    % Length of recording (sec)

t=(1:Length*Fs)/Fs;  

rec = audiorecorder(Fs,nBits,nChannels);  % Defining the recording object
disp('Start speaking.')  
record(rec, Length);

pause(Length+1)
disp('End of Recording.');
play(rec);   %if you want to hear what has been recorded

y = getaudiodata(rec);

figure
plot(t,y)   % plotting the time domain of signal you have recorded
