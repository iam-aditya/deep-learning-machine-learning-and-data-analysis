for j=1:100
if strlength(num2str(j)) ==1
path=strcat('D:/S/S00',num2str(j),'.txt')
end
if strlength(num2str(j)) ==2
path=strcat('D:/S/S0',num2str(j),'.txt')
end
if strlength(num2str(j)) ==3
path=strcat('D:/S/S',num2str(j),'.txt')
end

    
wo = 60/(164/2);  bw = wo/35;
[b,a] = iirnotch(wo,bw);
%vtool(b,a); 


m=csvread(path);
n= filter(b,a,m)
t = (0:length(m)-1)/164
plot(t,m,t,n)
title('fig1')
help figure
fs=164
%delta bandpass filter
deltaf=designfilt('bandpassiir','FilterOrder',20, ...
         'HalfPowerFrequency1',0.3,'HalfPowerFrequency2',4, ...
         'SampleRate',fs);
delta=filter(deltaf,n)
plot(t,m,t,n,t,delta)
title('fig2')
help figure

%theta waves 
thetaf=designfilt('bandpassiir','FilterOrder',20, ...
         'HalfPowerFrequency1',4,'HalfPowerFrequency2',8, ...
         'SampleRate',fs);

theta=filter(thetaf,n)
plot(t,m,t,n,t,theta)

%alphafilter
alphaf=designfilt('bandpassiir','FilterOrder',20, ...
         'HalfPowerFrequency1',8,'HalfPowerFrequency2',12, ...
         'SampleRate',fs);
alpha=filter(alphaf,n)
plot(t,n,t,alpha)
%beta filter
betaf=designfilt('bandpassiir','FilterOrder',20, ...
         'HalfPowerFrequency1',12,'HalfPowerFrequency2',30, ...
         'SampleRate',fs);
beta=filter(betaf,n)
plot(t,n,t,beta)
%gamma filter
gammaf=designfilt('bandpassiir','FilterOrder',20, ...
         'HalfPowerFrequency1',30,'HalfPowerFrequency2',81, ...
         'SampleRate',fs);
gamma=filter(gammaf,n)
plot(n,t,t,gamma)
plot(t,n,t,delta,t,theta,t,alpha,t,beta,t,gamma)
legend('original','delta','theta','alpha','beta','gamma')
M=[delta,theta,alpha,beta,gamma];

if strlength(num2str(j)) ==1
path=strcat('D:/Sf/S00',num2str(j),'.txt')
end
if strlength(num2str(j)) ==2
path=strcat('D:/Sf/S0',num2str(j),'.txt')
end
if strlength(num2str(j)) ==3
path=strcat('D:/f/S',num2str(j),'.txt')
end
dlmwrite(path,M)
type(path)
end