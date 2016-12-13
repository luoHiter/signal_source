function [y]=audio(Ac,fs,N)
    t=0:N-1;
    f0=2.3e9;
    f1=2.5e9;
    f2=2e9;

    y=Ac*(sin(2*pi*f2*t/fs)+sin(2*pi*f1*t/fs)+sin(2*pi*f0*t/fs));
%     figure(1)
%     plot(t,y,'LineWidth',1.5)
%     axis([0,0.00000001,-3,3]);
%     ylabel('����')
%     xlabel('ʱ�䣨�룩')
% 
%     N=length(t);
%     df=fs/N;
%     f=-fs/2:df:fs/2-df;
%     Pxx=20*log10(abs(fftshift(fft(y))).^2/N);
%     figure(2)
%     plot(f,Pxx,'LineWidth',1.5)
%     axis([-0.3e10,0.3e10,-10,80])
%     ylabel('���ȣ�dB��')
%     xlabel('Ƶ�ʣ�Hz��')
