
%initialization
    close all
    clear 
    clc
%Reading audio
    t = 7.5; %seconds of reading audio
    [y,Fs] = audioread('a2.wav');
    filename = 'a2.flac';
    audiowrite(filename,y,Fs);
    samples = [1.5*t*Fs,2*t*Fs];
    [y,Fs] = audioread('a2.wav',samples);
%implemention of ButterWorth filter
    w1 = 1/4;
    dw = 1/20;
    [b1,a1] = butter(6, [w1-dw w1+dw],'stop');
%zeros/poles of system
    n = 2; %significant numbers
    b1_casecade = roots(b1);
    a1_casecade = roots(a1);       
%casecade systerm 1
    b1_filter_1 = poly(b1_casecade(1:2));
    a1_filter_1 = poly(a1_casecade(1:2));
    b2_filter_1 = round(b1_filter_1,n,'significant');
    a2_filter_1 = round(a1_filter_1,n,'significant');
    s1 = filter(b2_filter_1,a2_filter_1,y);
%casecade system 2
    b1_filter_2 = poly(b1_casecade(3:4));
    a1_filter_2 = poly(a1_casecade(3:4));
    b2_filter_2 = round(b1_filter_2,n,'significant');
    a2_filter_2 = round(a1_filter_2,n,'significant');
    s2 = filter(b2_filter_2,a2_filter_2,s1);
%casecade system 3
    b1_filter_3 = poly(b1_casecade(5:6));
    a1_filter_3 = poly(a1_casecade(5:6));
    b2_filter_3 = round(b1_filter_3,n,'significant');
    a2_filter_3 = round(a1_filter_3,n,'significant');
    s3 = filter(b2_filter_3,a2_filter_3,s2); 
%casecade system 4
    b1_filter_4 = poly(b1_casecade(7:8));
    a1_filter_4 = poly(a1_casecade(7:8));
    b2_filter_4 = round(b1_filter_4,n,'significant');
    a2_filter_4 = round(a1_filter_4,n,'significant');
    s4 = filter(b2_filter_4,a2_filter_4,s3);
%casecade system 5
    b1_filter_5 = poly(b1_casecade(9:10));
    a1_filter_5 = poly(a1_casecade(9:10));
    b2_filter_5 = round(b1_filter_5,n,'significant');
    a2_filter_5 = round(a1_filter_5,n,'significant');
    s5 = filter(b2_filter_5,a2_filter_5,s4);
%casecade system 6
    b1_filter_6 = poly(b1_casecade(11:12));
    a1_filter_6 = poly(a1_casecade(11:12));
    b2_filter_6 = round(b1_filter_6,n,'significant');
    a2_filter_6 = round(a1_filter_6,n,'significant');
    output = filter(b2_filter_6,a2_filter_6,s5);
    output_round = round(output,n,'significant');
%playing audio
    sound(output_round,Fs);
%z-plane
    b2_final = conv(b1_filter_6,conv(b1_filter_5,conv(b1_filter_4,conv(b1_filter_3,(conv(b1_filter_1,b1_filter_2))))));
    a2_final = conv(a1_filter_6,conv(a1_filter_5,conv(a1_filter_4,conv(a1_filter_3,(conv(a1_filter_1,a1_filter_2))))));
    figure
    zplane(b2_final,a2_final);
%frequency response
    

 



