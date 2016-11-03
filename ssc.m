%入口参数:fs,f0,f2,f1,fss,f00
clc;
clear; 
fs=4e7;
f0=5e4;
code_length=20;
N=1:code_length;
%rand('seed',0);
x=sign(rand(1,code_length)-0.5);
ff=fs/f0;%单个码元采样点数
for i=1:20
    s((1+(i-1)*ff):i*ff)=x(i);
end 

%产生伪随机码
f1=5e6;

f2=f1/f0;%伪随机码频率/信息码频率
length=f2*code_length;
x_code=sign(mgen(19,8,length)-0.5);
n=ff/f2;%每个伪码元的采样点数
for i=1:length
    w_code((1+(i-1)*n:i*n))=x_code(i);
end
%扩频
k_code=s.*w_code;
%调制
fss=8e9;
f00=4e9;
for i=1:length
    AI=2;
    dt=fss/f00;
    t=0:dt/(n-1):dt;
    cI=AI*cos(2*pi*f00*t/fss);
    signal((1+(i-1)*8):i*8)=k_code((1+(i-1)*8):i*8).*cI;
end

%figure(1);
%plot(signal(1:500));

%figure(2)
%signal=awgn(signal,10);
%signal_fre=abs(fftshift(fft(signal,10240)));
%plot(20*log10(signal_fre));
%set(gca,'yscale','log');
    