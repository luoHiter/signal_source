clc;
clear;
tic;
fc=3e9;
fs=12e9;
fd=12e7;
N=1500;
pf=0.01;
%varn=A/snr;
varn=1;
t=0:N-1;
N1=0;N2=0;
N_sample=1000;
N_code=15;
begin_N=1500;
end_N=6000;
dN=1500;
begin_snr=-18;
end_snr=15;
jsr=20;

pdd=zeros(1,end_snr-begin_snr+1);
k=begin_snr:end_snr;
for N=begin_N:dN:end_N
    signal_noi_1= zeros(N_sample,N);
    signal_noi_2= zeros(N_sample,N);
    N_code=N/100;
    for snr = begin_snr:end_snr 
        N1=0;
        for i=1:N_sample
            A=sqrt(2)*varn*10^(snr/20);
            As=A*10^(-jsr/20);
         
            %signal=A*sin(2*pi*f0*t/fs);
            jar=LFM(A,fs,N);
            signal=bpsk(N_code,fc,fs,fd,As);
            zaosheng=wgn(1,N,varn,'linear');
            varns=sum(signal.^2,2)/N;
            
            signal_noi_1(i,:)=jar+zaosheng+signal;

            signal_noi_2(i,:)=wgn(1,N,varn,'linear')+signal; 
        end

        pow_1=sum(signal_noi_1.^2,2)/N;
        pow_2=sum(signal_noi_2.^2,2)/N; 
        lambda=(varn+varns)*(N+sqrt(2*N)*qfuncinv(pf))/N;
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
    if N==1500
        plot(k,pdd,':or');
        hold on;
    elseif N==3000
        plot(k,pdd,':dm');
        hold on;
    elseif N==4500
        plot(k,pdd,':hb');
        hold on;
    elseif N==6000
        plot(k,pdd,':.k');
        hold on;
    end         
end
legend('N=1500','N=3000','N=4500','N=6000'); 
ylabel('Pd');
xlabel('SNR/dB');
title('能量检测算法不同情况下检测概率');
toc;