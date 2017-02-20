function [y]=audio(Ac,fs,N)
%     Ac=1;fs=8e9;N=1500;
    t=0:N-1;
    f0=(randi([3,8],1,1)+rand(1,1));

    y=Ac*cos(2*pi*f0*t/fs*1e9);
%     figure(1)
%     plot(t,y,'LineWidth',1.5)
%     axis([0,100,-1.2,1.2]);
%     ylabel('幅度')
%     xlabel('时间')
% 
%     N=length(t);
%     df=fs/N;
%     f=-fs/2:df:fs/2-df;
%     Pxx=20*log10(abs(fftshift(fft(y))).^2/N);
%     figure(2)
%     plot(f,Pxx,'LineWidth',1.5)
%     axis([-8e9,8e9,-10,80])
%     ylabel('幅度')
%     xlabel('频率（Hz）')
