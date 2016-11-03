clc;
clear; 
code_length=20;
N=1:code_length;
%rand('seed',0);
x=sign(rand(1,code_length)-0.5);
for i=1:20
    s((1+(i-1)*800):i*800)=x(i);
end 
%����α�����
length=100*20; %α���Ƶ��5MHz��ÿ����Ϣ���ں���5MHz/50KHz=100
x_code=sign(mgen(19,8,length)-0.5);
for i=1:2000
    w_code((1+(i-1)*8:i*8))=x_code(i);
end
%��Ƶ
k_code=s.*w_code;
%����
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
    