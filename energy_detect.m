clc;
clear;
f0=3e9;
fs=8e9;

t=0:100;
signal=0*sin(2*pi*f0*t/fs);
zaosheng=wgn(1,101,10,'linear');
signal=signal+zaosheng;
plot(signal);
pow=sum(signal.^2);
if pow>101*12
    a=1;
else
    a=0;
end
