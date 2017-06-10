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

legend('音频干扰','同频段窄带干扰','扫频干扰','扩频干扰','脉冲干扰'); 
ylabel('Pd');
xlabel('SNR/dB');
title('干扰分类成功率');
 axis([-15,5,0.5,1]);