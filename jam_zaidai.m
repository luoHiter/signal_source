function [yt]=jam_zaidai(Ac,fs,N)
    n=4096;
   % N=1500;
    %fs=8e9;
    %Ac=1;
    df=fs/(n-1);
    f=(fs/2:df:fs);
    order=6;

    d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',23/50,24/50,25/50,26/50,60,1,60);
    hd=design(d,'equiripple');


    x=wgn(1,n,Ac);
    yt=filter(hd,x);
    yt=yt(1:N);
%     figure(1);
%     plot((0:n-1),yt);
%     axis([0,512,-3,3]);
%     title('同频窄带干扰（时域）');
% 
%     y1=fft(yt);
%     y2=fftshift(y1);
%     y2=y2(1:n/2);
%     yf=20*log10(abs(y2));
%     %yf=yf(1:N/2);
%     figure(2);
%     plot(f,yf);
%     set(gca,'yscale','log');
%     axis([4.5e9,7.5e9,10e-2,10e1]);
%     ylabel('幅度（dB）')
%     xlabel('频率（Hz）')
%     title('同频率窄带干扰（频域）'); 
