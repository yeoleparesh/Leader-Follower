clc; clear all; close all;
%
vl=1.3;
tfinal=30;
%
i=1;
vf(i)=0;
t(i)=0;
%f=0.55;
wl(i)=-sin(1.1*t(i));

xl(i)=3;
yl(i)=10;
thtl(i)=pi/2;
xf(i)=1.5;
yf(i)=8.2;
thtf(i)=pi/6;
phi=-pi/3;
d=1.2;
%
h=0.001;
%
wf(i)=0;
wfmax=pi;
K=0.7692;
vlmax=2;
vfmax=4;
M=1;
%
%
bta(i) = thtl(i)-thtf(i);
x1=0.95;
x2=0.98;
    
%
%

while t(i)<tfinal
    
    if  bta(i)>=-asin(x2*d*cos(phi)) && bta(i)<=asin(x2*d*cos(phi))
        %Follower
        eeta=[(wfmax-K*vl)*d*cos(phi)/abs(-(xl(i)-xf(i))*sin(thtf(i))-d*sin(phi)+(yl(i)-yf(i))*cos(thtf(i)));...
            (vl*x1-abs(wl(i)))*d*cos(phi)/abs(-(xl(i)-xf(i))*sin(thtf(i))-d*sin(phi)+(yl(i)-yf(i))*cos(thtf(i)));...
            (vfmax*cos(phi)-vl*cos(bta(i)-phi))/abs((xl(i)-xf(i))*cos(thtf(i)+phi)-d+(yl(i)-yf(i))*sin(thtf(i)+phi));...
            vl*cos(bta(i)-phi)/abs((xl(i)-xf(i))*cos(thtf(i)+phi)-d+(yl(i)-yf(i))*sin(thtf(i)+phi));M];
        eeta=min(eeta);
        vf(i)=((eeta*((xl(i)-xf(i))*cos(thtf(i)+phi)-d+(yl(i)-yf(i))*sin(thtf(i)+phi)))+(vl*cos(bta(i)-phi)))/(cos(phi));
        wf(i)=(eeta*(-(xl(i)-xf(i))*sin(thtf(i))-d*sin(phi)+(yl(i)-yf(i))*cos(thtf(i)))+(vl*sin(bta(i))))/(d*cos(phi));
        
    else 
        vf(i)=0;
        wf(i)=sign(bta(i))*wfmax;
                 
    end
        xl(i+1) = xl(i) + h*vl*cos(thtl(i));
        yl(i+1) = yl(i) + h*vl*sin(thtl(i));
        thtl(i+1) = thtl(i) + h*wl(i);
        xf(i+1) = xf(i) + h*vf(i)*cos(thtf(i));
        yf(i+1) = yf(i) + h*vf(i)*sin(thtf(i));
        thtf(i+1)= thtf(i) + h*wf(i);
    i=i+1;
    t(i)=t(i-1)+h;
    wl(i)=-sin(1.1*t(i));
    bta(i)=thtl(i)-thtf(i);
    %ddd=atan((yl(i)-yf(i))/(xl(i)-xf(i)));
    
end
%
plot(xl,yl,'r',xf,yf); axis equal; grid on;
% figure; plot(xl-3,yl,'r',xf,yf); axis equal; grid on;
% figure; plot(t, xl-xf, 'b', t, yl-yf, 'r', t, sqrt((xl-xf).^2+(yl-yf).^2),'k'); grid on;
% %figure; plot(t,thtf); grid on;
% %figure; plot(t,thtl); grid on;
% figure; plot(t,rad2deg(ddd-thtf)); grid on;
% figure; plot(t, sqrt(xf.^2+yf.^2)); grid on;