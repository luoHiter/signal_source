%��ڲ���:fs,f0,f2,f1,fss,f00
function [signal_final]=ssc(Ac,fs,fc,N)
%fs=4e7;
%f0=5e4;
Ns=800;
code_length=20;
Nc=1:code_length;
%rand('seed',0);
x=sign(rand(1,code_length)-0.5);
%ff=fs/f0;%������Ԫ��������
%for i=1:code_length
%    s((1+(i-1)*ff):i*ff)=x(i); 
%end 
for i=1:code_length
    s((1+(i-1)*Ns):i*Ns)=x(i);
end 
%����α�����
%f1=5e6;
%f2=f1/f0;%α�����Ƶ��/��Ϣ��Ƶ��
%length=f2*code_length;
Nsi=100;
length=Nsi*code_length;
x_code=sign(mgen(19,8,length)-0.5);
%n=ff/f2;%ÿ��α��Ԫ�Ĳ�������
n=8;
for i=1:length
    w_code((1+(i-1)*n:i*n))=x_code(i);
end
%��Ƶ
k_code=s.*w_code;
%����
% fs=8e9;
% fc=4e9;
for i=1:length
    %Ac=2;
    dt=fs/fc;
    t=0:dt/(n-1):dt;
    cI=Ac*cos(2*pi*fc*t/fs);
    signal((1+(i-1)*8):i*8)=k_code((1+(i-1)*8):i*8).*cI;
end
signal_final=signal(1:N);

% figure(1);
% plot(signal(1:500));
% xlabel('ʱ�䣨s��)')
% ylabel('���ȣ�V��')
% axis([0,500,-1.2,1.2]);
% 
% figure(2)
% signal=awgn(signal,10);
% signal_fre=abs(fftshift(fft(signal,10240)));
% f=linspace(-fs/2,fs/2,10240);
% plot(f,20*log10(signal_fre));
% xlabel('Ƶ�ʣ�Hz��');
% ylabel('����');
% set(gca,'yscale','log'); 