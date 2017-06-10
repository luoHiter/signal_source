data=xlsread('D:\matlab\bin\signal_source\jieguo.xlsx');
figure(1);
k=-15:5;

plot(k,data(:,1),':or');
hold on;
plot(k,data(:,2),':dm');
hold on;
plot(k,data(:,3),':hb');
hold on;
plot(k,data(:,4),':.k');
hold on;
plot(k,data(:,5),':*c');
hold on;

legend('��Ƶ����','ͬƵ��խ������','ɨƵ����','��Ƶ����','�������'); 
ylabel('Pd');
xlabel('SNR/dB');
title('���ŷ���ɹ���');
 axis([-15,5,0.5,1]);