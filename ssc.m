clc;
clear; 
code_length=20;
N=1:code_length;
%rand('seed',0);
x=sign(rand(1,code_length)-0.5);
for i=1:20
    s((1+(i-1)*800):i*800)=x(i);
end 
%产生伪随机码
length=100*20; %伪随机频率5MHz，每个信息码内含有5MHz/50KHz=100
x_code=sign(mgen(19,8,length)-0.5);
for i=1:2000
    w_code((1+(i-1)*8:i*8))=x_code(i);
end
%扩频
k_code=s.*w_code;
%调制
fs=7e9;
f0=4e9;
for i=1:2000
    AI=2;
    dt=fs/f0;
    n=0:dt/7:dt;
    cI=AI*cos(2*pi*f0*n/fs);
    signal((1+(i-1)*8):i*8)=k_code((1+(i-1)*8):i*8).*cI;
end
signal=awgn(signal,10);
signal_fre=abs(fftshift(fft(signal,10240)));
plot(20*log10(signal_fre));
set(gca,'yscale','log');
    