Ac=1;
fs=6e9;
fc=4e9;
N=1500;
    n=15;
    b=randi(2,1,n)-1;
    N=N/n;
    ur=zeros(1,N);
    % ur=Ac*sin(2*pi*fc*t/fs).*square(2*pi*fp*t,5);
    for t=1:n
        T=(t-1)*N+1:t*N;
        if b(t)==1
            ur(T)=Ac*sin(2*pi*fc*T/fs);
        else
            ur(T)=0;
        end
    end
    figure(1);
    plot(ur);
    axis([0,800,-1.2,1.2]);
    xlabel('时间（s）)');
    ylabel('幅度（V）');
    
    figure(2);
    ur_fre=abs(fftshift(fft(ur,10240)));
    f=linspace(-fs/2,fs/2,10240);
    plot(f,20*log10(ur_fre));
    set(gca,'yscale','log'); 
    xlabel('频率（Hz）');
    ylabel('幅度');