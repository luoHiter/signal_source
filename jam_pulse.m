clc;
clear;
Ac=1;
fs=3e9;
fc=2e8;
fp=2e7;
dt=1/fs;
t=0:1500;
b=randi(2,1,15)-1
% ur=Ac*sin(2*pi*fc*t/fs).*square(2*pi*fp*t,5);
ur=square(2*pi*t,5);
plot(ur); 
 