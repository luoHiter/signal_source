data=xlsread('D:\matlab\bin\signal_source\f_out.xlsx');
k=-5:15;
data_means=zeros(105,15);
line=0.6

for i=1:105
    data_means(i,:)=mean(data(1+(i-1)*100:i*100,:),1);
end

f_1=zeros(1,21);
f_2=zeros(1,21);
f_3=zeros(1,21);
f_4=zeros(1,21);
f_5=zeros(1,21);
f_6=zeros(1,21);
f_7=zeros(1,21);
f_8=zeros(1,21);
f_9=zeros(1,21);
f_10=zeros(1,21);
f_11=zeros(1,21);
f_12=zeros(1,21);
f_13=zeros(1,21);
f_14=zeros(1,21);
f_15=zeros(1,21);

for j=1:5
    for i=1:21
        f_1(i)=data_means(j+5*(i-1),1);
        f_2(i)=data_means(j+5*(i-1),2);
        f_3(i)=data_means(j+5*(i-1),3 );
        f_4(i)=data_means(j+5*(i-1),4 );
        f_5(i)=data_means(j+5*(i-1),5 );
        f_6(i)=data_means(j+5*(i-1),6 );
        f_7(i)=data_means(j+5*(i-1),7 );
        f_8(i)=data_means(j+5*(i-1),8 );
        f_9(i)=data_means(j+5*(i-1),9 );
        f_10(i)=data_means(j+5*(i-1),10);
        f_11(i)=data_means(j+5*(i-1),11 );
        f_12(i)=data_means(j+5*(i-1),12 );
        f_13(i)=data_means(j+5*(i-1),13 );
        f_14(i)=data_means(j+5*(i-1),14 );
        f_15(i)=data_means(j+5*(i-1),15 );
    end
    figure(j);
    plot(k,f_1,'-or','LineWidth',line);
    hold on;
    plot(k,f_2,'-.b','LineWidth',line);
    hold on;
    plot(k,f_3,'-*k','LineWidth',line);
    hold on;
    plot(k,f_4,'-sm','LineWidth',line);
    hold on;
    plot(k,f_5,'-+k','LineWidth',line);
    hold on;
    plot(k,f_6,'-pr','LineWidth',line);
    hold on;
    plot(k,f_7,'-^r','LineWidth',line);
    hold on;
    plot(k,f_8,'-vb','LineWidth',line);
    hold on;
    plot(k,f_9,'-<k','LineWidth',line);
    hold on;
    plot(k,f_10,'->m','LineWidth',line);
    hold on;
    plot(k,f_11,'-dk','LineWidth',line);
    hold on;
    plot(k,f_12,'-hr','LineWidth',line);
    hold on;
    plot(k,f_13,'-xb','LineWidth',line);
    hold on;
    plot(k,f_14,'--sk','LineWidth',line);
    hold on;
    plot(k,f_15,'--ob','LineWidth',line);
    hold on;
    grid on;
    legend('F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12','F13','F14','F15'); 
    xlabel('JNR/dB');
end

    %axis([-5,z15,0.4,1]);

%     figure(2);
%     plot(k,data_means(:,6),':or');
%     hold on;
%     plot(k,data_means(:,7),':dm');
%     hold on;
%     plot(k,data_means(:,8),':hb');
%     hold on;
%     plot(k,data_means(:,9),':.k');
%     hold on;
%     plot(k,data_means(:,10),':*c');
%     hold on;
% 
%     legend('F6','F7','F8','F9','F10'); 
%     xlabel('JNR/dB');
%     %axis([-10,10,0.4,1]);
% 
%     figure(3);
%     plot(k,data_means(:,11),':or');
%     hold on;
%     plot(k,data_means(:,12),':dm');
%     hold on;
%     plot(k,data_means(:,13),':hb');
%     hold on;
%     plot(k,data_means(:,14),':.k');
%     hold on;
%     plot(k,data_means(:,15),':*c');
%     hold on;
% 
%     legend('F11','F12','F13','F14','F15'); 
%     xlabel('JNR/dB');
%     %axis([-10,10,0.4,1]);