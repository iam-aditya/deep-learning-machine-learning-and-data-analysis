Fs = 164;
m=csvread('F:/F001.txt')
t = (0:length(m)-1)/Fs;




d = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',59,'HalfPowerFrequency2',61, ...
               'DesignMethod','butter','SampleRate',Fs);

buttLoop = filtfilt(d,m);

plot(t,m,t,buttLoop)
ylabel('Voltage (V)')
xlabel('Time (s)')
title('Open-Loop Voltage')
legend('Unfiltered','Filtered')
grid