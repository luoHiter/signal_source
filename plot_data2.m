data=xlsread('D:\matlab\bin\signal_source\419数据.xlsx');
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

legend('音频干扰','同频段窄带干扰','扫频干扰','扩频干扰','脉冲干扰'); 
ylabel('Pd');
xlabel('SNR/dB');
title('干扰分类成功率');
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

legend('音频窄带混叠干扰','音频扫频混叠干扰','音频扩频混叠干扰','音频脉冲混叠干扰','扫频窄带混叠干扰'); 
ylabel('Pd');
xlabel('SNR/dB');
title('干扰分类成功率');
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

legend('扩频窄带混叠干扰','脉冲窄带混叠干扰','扫频扩频混叠干扰','扫频脉冲混叠干扰','扩频脉冲混叠干扰'); 
ylabel('Pd');
xlabel('SNR/dB');
title('干扰分类成功率');
 axis([-10,10,0.4,1]);