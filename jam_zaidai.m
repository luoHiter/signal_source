function [yt]=jam_zaidai(Ac,fs,N,hd)
    n=4096;
   % N=1500;
    %fs=8e9;
    %Ac=1;
    f=linspace(-fs/2,fs/2,n);
    order=6;
    length(f)
% 
    d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',118/240,119/240,121/240,122/240,60,1,60);
    hd=design(d,'equiripple');
    Ac=Ac*sqrt(120);

    x=wgn(1,n,Ac);
    yt=filter(hd,x);
    yt=yt(1:N);
%     figure(1);
%     plot((0:N-1),yt);
%     axis([0,512,-3,3]);
%     title('同频窄带干扰（时域）');
% 
%     y1=fft(yt,n);
%     y2=fftshift(y1);
%     yf=20*log10(abs(y2));
%     %yf=yf(1:N/2);
%     figure(2);
%     length(yf)
%     plot(f(1:n/2),yf(1:n/2));
%     set(gca,'yscale','log');
%     %axis([2.5e9,7.5e9]);
%     ylabel('幅度（dB）')
%     xlabel('频率（Hz）')
%     title('同频率窄带干扰（频域）'); 
subplot(211);plot(yt);grid on;xlabel('时间');ylabel('幅度');
%axis([1,600,-1.5,1.5]);
subplot(212);hua_fft(yt,fs,1);grid on;
end