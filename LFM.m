function [y]=lfm(fs,dt)
    %fs=6e9;
    %T=1e-6;
    B=2.5e9;
    k=B/dt;
    n=round(dt*fs);
    t=linspace(0,dt,n);
    y=exp(j*pi*k*t.^2);
    y=real(y);
    figure(1);
    plot(t,y,'LineWidth',1.5);
    title('ɨƵ�����ź�ʱ����');
    xlabel('ʱ�䣨s��)')
    ylabel('���ȣ�V��')
    axis([0,0.2e-6,-1.2,1.2]);

    fft_y=fftshift(fft(y));
    f=linspace(-fs/2,fs/2,n);
    figure(2);
    plot(f,abs(fft_y),'LineWidth',1.5);
    title('ɨƵ�����ź�Ƶ����');
    xlabel('Ƶ�ʣ�Hz��');
    ylabel('����');
    axis([-1e9,4e9,0,140]);