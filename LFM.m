function [y]=lfm(Ac,fs,N)
    %fs=6e9;
    %T=1e-6;
    begin_fre=3e8;
    end_fre=8e8;
    f0=begin_fre;
    dt=1/fs;
    B=begin_fre-end_fre;
    k=B/dt;
    t=linspace(0,dt,N);
    y=exp(2*pi*f0*t+pi*k*t.^2);
    y=real(y);
%     figure(1);
%     plot(t,y,'LineWidth',1.5);
%     title('ɨƵ�����ź�ʱ����');
%     xlabel('ʱ�䣨s��)')
%     ylabel('���ȣ�V��')
%     axis([0,0.2e-6,-1.2,1.2]);
% 
%     fft_y=fftshift(fft(y));
%     f=linspace(-fs/2,fs/2,N);
%     figure(2);
%     plot(f,abs(fft_y),'LineWidth',1.5);
%     title('ɨƵ�����ź�Ƶ����');
%     xlabel('Ƶ�ʣ�Hz��');
%     ylabel('����');
%     axis([-1e9,4e9,0,140]);