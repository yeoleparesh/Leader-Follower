clc; clear all; close all;
%
vl=1;
tfinal=200;
f=1;
%
i=1;
vf(i)=1;

t(i)=0;
xl(i)=0;
yl(i)=0;
thtl(i)=0;
xf(i)=2;
yf(i)=2;
thtf(i)=0;
a(i)=sin(f*t(i));
%
phi(i)=atan((yl(i)-yf(i))/((xl(i)-xf(i))))-thtf(i);
d(i)=sqrt((yl(i)-yf(i))^2+((xl(i)-xf(i)))^2);
%
h=0.01;
%
while t(i)<tfinal
    %Leader
    xl(i+1) = xl(i) + h*vl*cos(thtl(i));
    yl(i+1) = yl(i) + h*vl*sin(thtl(i));
    thtl(i+1) = thtl(i) + h*a(i)/vl;
    %Follower
    xf(i+1) = xf(i) + h*vf(i)*cos(thtf(i));
    yf(i+1) = yf(i) + h*vf(i)*sin(thtf(i));
    thtf(i+1)= thtf(i) + ((h*vf(i)*sin(thtl(i)-thtf(i)))/((d(i)*cos(phi(i)))));  
    %
    i=i+1;
    t(i)=t(i-1)+h;
    %
    phi(i)=atan((yl(i)-yf(i))/((xl(i)-xf(i))))-thtf(i);
    d(i)=sqrt((yl(i)-yf(i))^2+((xl(i)-xf(i)))^2);
    vf(i)=(vl*cos(thtl(i)-thtf(i)-phi(i))/cos(phi(i)));
    %
    a(i)=sin(f*t(i));
end
%
plot(xl,yl,'r',xf,yf); axis equal; grid on;
%figure; plot(t, a); grid on;
%figure; plot(t, tht); grid on;
%
%tht_d(1)=0;
%for j=2: length(tht)
%   tht_d(j)=(tht(j)-tht(j-1))/h;
%end
%figure(2); hold on;  plot(t, tht_d, 'r');