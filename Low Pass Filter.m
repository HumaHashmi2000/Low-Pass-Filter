% LOWPASS FILTER   
clc;
close all;
clear all;
Ap=input('enter the pass band ripple= '); 
As=input('enter the stop band ripple= ');
freqpass=input('enter the pass band frequency= ');
freqstop=input('enter the stop band frequency= ');
sampfreq=input('enter the sampling frequency= ');
fc = input ('Enter the value of cutoff frequency:');
beta=input (' Enter beta value:');
%Normalizing Frequencies
wp=2*freqpass/sampfreq;  
ws=2*freqstop/sampfreq;
% to find order
num=-20*log10(sqrt(Ap*As))-13;
den=14.6*(freqstop-freqpass)/sampfreq;
N=ceil(num/den); % round off order
if(rem(N,2)~=0)
n=N;
n=N-1;
else
n=N+1;
end
% Rectangular Window
y=rectwin(n);
b=fir1(N,wp,y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);
mag=20*log10(abs(h));   %magnitude response
an=angle(h);
subplot(3,4,1);
plot(om/pi,mag);
xlabel('normalized frequency');
ylabel('gain in db');
grid on
title('magnitude response using rectangular window');
subplot(3,4,2);
plot(om/pi,an);
xlabel('normalized frequency');
ylabel('phase in rad');
grid on
title('phase response using rectangular window');
%Hanning Window
y=hanning(n);
b=fir1(N,wp,y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);
mag=20*log10(abs(h));   %magnitude response
an=angle(h);
subplot(3,4,5);
plot(om/pi,mag);
xlabel('normalized frequency');
ylabel('gain in db');
grid on
title('magnitude response using hanning window');
subplot(3,4,6);
plot(om/pi,an);
xlabel('normalized frequency');
ylabel('phase in rad');
grid on
title('phase response using hanning window');
%Hamming Window
y=hamming(n);
b=fir1(N,wp,y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);
mag=20*log10(abs(h)); %magnitude response
an=angle(h);
subplot(3,4,7);
plot(om/pi,mag);
xlabel('normalized frequency');
ylabel('gain in db');
grid on
title('magnitude response using hamming window');
subplot(3,4,8);
plot(om/pi,an);
xlabel('normalized frequency');
ylabel('phase in rad');
grid on
title('phase response using hamming window');
%Blackman Window
y=blackman(n);
b=fir1(N,wp,y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);
mag=20*log10(abs(h));  %magnitude response
an=angle(h);
subplot(3,4,9);
plot(om/pi,mag);
xlabel('normalized frequency');
ylabel('gain in db');
grid on
title('magnitude response using blackman window');
subplot(3,4,10);
plot(om/pi,an);
xlabel('normalized frequency');
ylabel('phase in rad');
grid on
title('phase response using blackman window');
%Kaiser Window
y=kaiser(N,beta);
b = fir1(N-1, wp, 'low', y);

w=0:0.01:pi;
[h,om]=freqz(b,1,w);
m=20*log10(abs(h));  % magnitude response of kaiser Window
an=angle(h);
subplot(3,4,11);
plot(om/pi,m);
xlabel('normalized frequency');
ylabel('gain in db');
grid;
title('magnitude response using kaiser window');
subplot(3,4,12);
plot(om/pi,an); % Phase response of Kaiser Window 
xlabel('normalized frequency');
ylabel('phase in rad');
grid;
title('phase response using kaiser window');
