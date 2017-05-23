clc;
clear;
Ac=1;
fs=12e9;
N=3000;
t=1:N;

fc=3.354e9;
f1=2e9;
f3=5e9;
step=50;
fstep=(f3-f1)/step;

x=jam_pulse(Ac,fs,fc,N);
%x=sin(2*pi*fc/fs*t);
xr=awgn(x,-5,'measured','db');
figure(1);
subplot(211);plot(t,xr);
subplot(212);hua_fft(xr,fs,1);
% y=filter(bz1,az1,x);
figure(2);
subplot(211);plot(t,xr.^2);
subplot(212);hua_fft(xr.^2,fs,1);

for i=0:step-1
    y=bandp(xr,f1+i*fstep,f1+(i+1)*fstep,f1+(i-0.5)*fstep,f1+(i+1.5)*fstep,0.1,30,fs);
    if i==0
        temp=sum(y.^4,2)/N;
        tempi=0;
    elseif temp<(sum(y.^4,2)/N)
        temp=(sum(y.^4,2)/N);
        tempi=i;
    end 
%     figure(2);
%     subplot(211);plot(t,y);
%     subplot(212);hua_fft(y,fs,1);
end
    f1+tempi*fstep
f1=f1+(tempi-1)*fstep;
f3=f1+2*fstep;
fstep=(f3-f1)/step;

for i=0:step-1
    y=bandp(xr,f1+i*fstep,f1+(i+1)*fstep,f1+(i-0.5)*fstep,f1+(i+1.5)*fstep,0.1,30,fs);
    if i==0
        temp=sum(y.^4,2)/N;
        tempi=0;
    elseif temp<(sum(y.^4,2)/N)
        temp=(sum(y.^4,2)/N);
        tempi=i;
    end 
%     figure(2);
%     subplot(211);plot(t,y);
%     subplot(212);hua_fft(y,fs,1);
end
    f1+(tempi+0.5)*fstep
    