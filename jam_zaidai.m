function [yt]=jam_zaidai(Ac,fs,N)
    %N=10240;
    %fs=8e9;
    df=fs/(N-1);
    f=(0:df:fs/2);
    order=6;

    d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',1/4,3/8,5/8,7/8,60,1,60);
    hd=design(d,'equiripple');


    x=wgn(1,N,Ac);
    yt=filter(hd,x);
%     figure(1);
%     plot((0:N-1),yt);
%     axis([0,512,-3,3]);
%     title('同频窄带干扰（时域）');
% 
%     y1=fft(yt);
%     y2=fftshift(y1);
%     y2=y2(1:N/2);
%     yf=20*log10(abs(y2));
%     %yf=yf(1:N/2);
%     figure(2);
%     plot(f,yf);
%     set(gca,'yscale','log');
%     %axis([0.5e9,3.5e9,10e-2,10e1]);
%     ylabel('幅度（dB）')
%     xlabel('频率（Hz）')
%     title('同频率窄带干扰（频域）'); 
