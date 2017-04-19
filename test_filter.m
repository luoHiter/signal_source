Ac=1;
fs=9e9;
N=1500;
t=1:N;

fc=3.354e9;
f1=3.2e9;
f3=3.4e9;
step=20;
fstep=(f3-f1)/step;

%x=jam_zaidai(Ac,fs,N);
x=sin(2*pi*fc/fs*t);
xr=awgn(x,-5,'measured','db');
figure(1);
subplot(211);plot(t,xr);
subplot(212);hua_fft(xr,fs,1);
% y=filter(bz1,az1,x);

for i=1:step
    y=bandp(xr,f1+i*fstep,f1+(i+1)*fstep,f1+(i-0.5)*fstep,f1+(i+1.5)*fstep,0.1,30,fs);
    if i==1
        temp=sum(y.^4,2)/N;
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

en=zeros(1,step);
for i=1:step
    y=bandp(xr,f1+i*fstep,f1+(i+1)*fstep,f1+(i-0.5)*fstep,f1+(i+1.5)*fstep,0.1,30,fs);
    if i==1
        temp=sum(y.^4,2)/N;
    elseif temp<(sum(y.^4,2)/N)
        temp=(sum(y.^4,2)/N);
        tempi=i;
    end 
    en(i)=temp;
%     figure(2);
%     subplot(211);plot(t,y);
%     subplot(212);hua_fft(y,fs,1);
end
    f1+(tempi+0.5)*fstep
    
    