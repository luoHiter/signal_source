clc;
clear;
tic;
f0=3e9;
fs=8e9;
N=1500;
pf=0.01;
%varn=A/snr;
varn=1;
t=0:N-1;
N1=0;N2=0;
N_sample=900;

begin_N=1024;
end_N=4096;
dN=1024;
begin_snr=-18;
end_snr=0;


pdd=zeros(1,end_snr-begin_snr+1);
k=begin_snr:end_snr;
for N=begin_N:dN:end_N
    signal_noi_1= zeros(N_sample,N);
    signal_noi_2= zeros(N_sample,N);
    for snr = begin_snr:end_snr 
        N1=0;
        for i=1:N_sample
            A=sqrt(2)*varn*10^(snr/20);

            %signal=A*sin(2*pi*f0*t/fs);
            signal=LFM(A,fs,N);
            zaosheng=wgn(1,N,varn,'linear');
            signal_noi_1(i,:)=signal+zaosheng;

            signal_noi_2(i,:)=wgn(1,N,varn,'linear'); 
        end

        pow_1=sum(signal_noi_1.^2,2)/N;
        pow_2=sum(signal_noi_2.^2,2)/N; 
        lambda=varn*(N+sqrt(2*N)*qfuncinv(pf))/N;
        for i=1:N_sample
            if(pow_1(i)>lambda)
                N1=N1+1;
            end
            if(pow_2(i)<lambda)
                N1=N1+1;
            end
        end
        pd=N1/(2*N_sample);

        pdd(snr-begin_snr+1)=pd;
        fprintf('current snr=%d\n',snr);
        fprintf('   accuracy=%f\n',pd);
    end
    if N==1024
        plot(k,pdd,':or');
        hold on;
    elseif N==2048
        plot(k,pdd,':dm');
        hold on;
    elseif N==3072
        plot(k,pdd,':hb');
        hold on;
    elseif N==4096
        plot(k,pdd,':.k');
        hold on;
    end         
end
legend('N=1024','N=2048','N=3072','N=4096'); 
ylabel('Pd');
xlabel('SNR/dB');
title('能量检测算法不同情况下检测概率');
toc;