clc;
clear;
A=sqrt(2);
snr=0.1;
f0=3e9;
fs=8e9;
N=1024;
pf=0.01;
%varn=A/snr;
varn=20;
t=0:N-1;
N1=0;N2=0;
for i=1:10000
    signal=A*sin(2*pi*f0*t/fs);
    zaosheng=wgn(1,N,varn,'linear');
    signal_noi=signal+zaosheng;
    %plot(signal);
    pow=sum(signal_noi.^2)/N;
    lambda=varn*(N+sqrt(2*N)*qfuncinv(pf))/N;
    if pow>lambda
        N1=N1+1;
    else
        N2=N2+1;
    end
    pd=N1/(N1+N2);
end