clc; clear all; close all;
%
v=1;
tf=10;
f=1;
%
i=1;
t(i)=0;
x(i)=0;
y(i)=0;
tht(i)=0;
a(i)=sin(f*t(i));
%
h=0.01;
%
while t(i)<tf
    x(i+1)=x(i) + h*v*cos(tht(i));
    y(i+1)=y(i) + h*v*sin(tht(i));
    tht(i+1) = tht(i) + h*a(i)/v;
    %
    i=i+1;
    t(i)=t(i-1)+h;
    a(i)=sin(f*t(i));
end
%
plot(x,y); axis equal; grid on;
figure; plot(t, a); grid on;
figure; plot(t, tht); grid on;
%
tht_d(1)=0;
for j=2: length(tht)
    tht_d(j)=(tht(j)-tht(j-1))/h;
end
figure(2); hold on;  plot(t, tht_d, 'r');