data=xlsread('D:\matlab\bin\signal_source\419����.xlsx');
k=-10:10;

figure(1);
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
 axis([-10,10,0.4,1]);
 
figure(2);
plot(k,data(:,6),':or');
hold on;
plot(k,data(:,7),':dm');
hold on;
plot(k,data(:,8),':hb');
hold on;
plot(k,data(:,9),':.k');
hold on;
plot(k,data(:,10),':*c');
hold on;

legend('��Ƶխ���������','��ƵɨƵ�������','��Ƶ��Ƶ�������','��Ƶ����������','ɨƵխ���������'); 
ylabel('Pd');
xlabel('SNR/dB');
title('���ŷ���ɹ���');
 axis([-10,10,0.4,1]);
 
figure(3);
plot(k,data(:,11),':or');
hold on;
plot(k,data(:,12),':dm');
hold on;
plot(k,data(:,13),':hb');
hold on;
plot(k,data(:,14),':.k');
hold on;
plot(k,data(:,15),':*c');
hold on;

legend('��Ƶխ���������','����խ���������','ɨƵ��Ƶ�������','ɨƵ����������','��Ƶ����������'); 
ylabel('Pd');
xlabel('SNR/dB');
title('���ŷ���ɹ���');
 axis([-10,10,0.4,1]);