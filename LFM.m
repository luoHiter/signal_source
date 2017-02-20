function [y]=LFM(Ac,fs,N)
%     Ac=1;
%     fs=10e9;
%     N=1500;
    
    begin_fre=(randi([3,5],1,1)+rand(1,1))*1e9;
    end_fre=begin_fre+0.5e9;
    f0=begin_fre;
    dt=1/fs;
    B=end_fre-begin_fre;
    T=N*dt;
    k=B/T;
    t=linspace(0,T,N);
    y=Ac*exp(1i*(2*pi*f0*t+2*pi*k*t.^2));
    y=real(y);
%     
%     figure(1);
%     plot(t,y);
%     title('扫频干扰信号时域波形');
%     xlabel('时间)')
%     ylabel('幅度（V）')
%     axis([0,T/2,-1.2,1.2]);
% 
%     fft_y=fftshift(fft(y));
%     f=linspace(-fs/2,fs/2,N);
%     figure(2);
%     plot(f,abs(fft_y),'LineWidth',1.5);
%     title('扫频干扰信号频域波形');
%     xlabel('频率（Hz）');
%     ylabel('幅度');
%     axis([2e9,6e9,0,100]);