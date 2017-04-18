fs=8e9;
N=10240;
t=1:N;
ff1=1.9e9;
ff2=3.05e9;
ff3=3.3e9;

f1=2.9e9;
f3=3.1e9;
fs1=2.89e9;
fsh=3.19e9;

x=sin(2*pi*ff2*t/fs);
xr=awgn(x,-5,'measured','db');
figure(1);
subplot(211);plot(t,xr);
subplot(212);hua_fft(xr,fs,1);
% y=filter(bz1,az1,x);

for i=1:20 
    y=bandp(xr,f1+i*1e7,f1+(i+1)*1e7,f1+(i-0.5)*1e7,f1+(i+1.5)*1e7,0.1,30,fs);
    if i==1
        temp=sum(y.^4,2)/N;
    elseif temp<(sum(y.^4,2)/N)
        temp=(sum(y.^4,2)/N);
        tempi=i;
    end 
%     figure(2);
%     subplot(211);plot(t,y);
%     subplot(212);hua_fft(y,fs,1);
    f1+tempi*1e7
end

