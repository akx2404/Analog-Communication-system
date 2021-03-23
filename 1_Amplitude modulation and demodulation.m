%AM modulation
clc
close all
clear all

%message
t = 0:0.001:1;
am = 2;
am2 = 4;
fm = 2;
wm = 2*pi*fm;
x = am*sin(wm*t);

%carrier
t=0:0.001:1;
ac = 4;
ac2 = 4;
fc = 100;
wc = 2*pi*fc;
y = ac*sin(wc*t);
m1 = am/ac;
m2 = am2/ac2;

%modulation

%z = ac*cos(wc*t) + ((am/2)*cos(wc-wm)*t) - ((am/2)*cos(wc+wm)*t);
s = x.*y;

zz=abs(fft(s));

%display
subplot(4,1,1)
plot(t,x)
title('message')
subplot(4,1,2)
plot(t,y)
title('carrier')
subplot(4,1,3)

plot(t,s)
subplot(4,1,4)
plot(zz)
title('modulation')

%demodulation
zd=s./y;
figure
plot(zd)
title('demod')
