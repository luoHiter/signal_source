clc;
clear;
Ac=1;
fs=12e9;
N=1024;

fc=3.354e9;
%f1=2e9;
%f3=5e9;
%step=50;
%fstep=(f3-f1)/step;
for N=1500:1500:6000
%x=jam_zaidai(Ac,fs,N);
t=1:N;
x=LFM(Ac,fs,N);
xr=awgn(x,0,'measured','db');
figure(1);
subplot(211);plot(t,xr);
subplot(212);hua_fft(xr,fs,1);
% y=filter(bz1,az1,x);
f1=2e9;
f3=5e9;
step=50;
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
max_ftemp=f1+tempi*fstep;
max_en=temp;

en=zeros(1,step);
en_f=zeros(1,step);
step2=1;
fstep2=fstep/step2;

for i=1:step   
    for j=0:step2-1    
        y=bandp(xr,f1+j*fstep2,f1+(j+1)*fstep2,f1+(j-0.5)*fstep2,f1+(j+1.5)*fstep2,0.1,30,fs);
        if j==0
            tempj=0;
            temp=sum(y.^4,2)/N;
        elseif temp<(sum(y.^4,2)/N)
            temp=(sum(y.^4,2)/N);
            tempj=j;
        end 
    end
    en(i)=temp;
    en_f(i)=f1+(tempj+0.5)*fstep2;
    f1=f1+fstep;
end
find(en>max(en)/10)
end
    