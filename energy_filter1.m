clc;
clear;
Ac=1;
fs=12e9;
N=1500;

fd=12e7;
fc=3e9;
fc1=3e9;
fc2=3e9;
% f1=2e9;
% f3=5e9;
step=50;
snr=0;
Jsr=20;
%fstep=(f3-f1)/step;
%d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',118/240,119/240,121/240,122/240,60,1,60);
%hd=design(d,'equiripple');
for N=1500:1500:6000
    t=1:N;
    %x=jam_pulse(Ac,fs,fc2,N);
    N_code=N/100;
    %x=jam_zaidai(Ac,fs,N,hd);
    x=sin(2*pi*fc1/fs*t);
    Pjar=sum(x.^2)/N;
    As=2*Pjar*10^(-Jsr/20);
    signal=bpsk(N_code,fc,fs,fd,As);
%for snr=-5:5:15
    xr=awgn(x,snr,'measured','db');
    xr=signal+xr;

    figure(1);
    subplot(211);plot(t,xr);grid on;
    xlabel('Ê±¼ä')
    ylabel('·ù¶È')
    subplot(212);hua_fft(xr,fs,1);grid on;
    % y=filter(bz1,az1,x);
    %figure(2);
    %subplot(211);plot(t,xr.^2);
    %subplot(212);hua_fft(xr.^2,fs,1);
    %y1=fft(xr.^4);
    %y2=fftshift(y1);
    %y_f=linspace(-fs/2,fs/2,N);
    %plot(y_f,abs(y2));


    f1=2.950e9;
    f3=3.050e9;
    fstep=(f3-f1)/step;
    for i=0:step-1
        y=bandp(xr,f1+i*fstep,f1+(i+1)*fstep,f1+(i-0.5)*fstep,f1+(i+1.5)*fstep,0.1,30,fs);
        if i==0
            temp=sum(y.^4,2)/N;
            tempi=0;
        elseif temp<(sum(y.^4,2)/N)
            temp=(sum(y.^4,2)/N);
            tempi=i;
        end 
    %     figure(2);
    %     subplot(211);plot(t,y);
    %     subplot(212);hua_fft(y,fs,1);
    end

    f1=f1+(tempi-1)*fstep;
    f3=f1+2*fstep;
    fstep=(f3-f1)/step;

    for i=0:step-1
        y=bandp(xr,f1+i*fstep,f1+(i+1)*fstep,f1+(i-0.5)*fstep,f1+(i+1.5)*fstep,0.1,30,fs);
        if i==0
            temp=sum(y.^4,2)/N;
            tempi=0;
        elseif temp<(sum(y.^4,2)/N)
            temp=(sum(y.^4,2)/N);
            tempi=i;
        end 
    %     figure(2);
    %     subplot(211);plot(t,y);
    %     subplot(212);hua_fft(y,fs,1);
    end
        f1+(tempi+0.5)*fstep
end


    