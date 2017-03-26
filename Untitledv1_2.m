clc; clear all; close all;
%
vl=1.3;
tfinal=20;
%
i=1;
vf(i)=0;
t(i)=0;
%f=0.55;
wl(i)=-sin(1.1*t(i));
%wl(i)=6;
xl(i)=5;
yl(i)=2;
thtl(i)=pi/2;
xf(i)=0;
yf(i)=0;
thtf(i)=pi/8;
phi=-pi/6;
d=1;
%
h=0.001;
%
wfmax=pi;
K=0.7692;
vlmax=2;
vfmax=4;
%
%
bta(i) = thtl(i)-thtf(i);

    
%
%

while t(i)<tfinal
    if  bta(i)>=-asin(K*d*cos(phi)) && bta(i)<=asin(K*d*cos(phi))
        %Leader
        xl(i+1) = xl(i) + h*vl*cos(thtl(i));
        yl(i+1) = yl(i) + h*vl*sin(thtl(i));
        thtl(i+1) = thtl(i) + h*wl(i);
        %Follower
        vf(i)=(vl*cos(bta(i)-phi))/(cos(phi));
        wf(i)=(vl*sin(bta(i)))/(d*cos(phi));
        xf(i+1) = xf(i) + h*vf(i)*cos(thtf(i));
        yf(i+1) = yf(i) + h*vf(i)*sin(thtf(i));
        thtf(i+1)= thtf(i) + h*wf(i);  
    elseif bta(i)>=0 
        vf(i)=0;
        wf(i)=wfmax;
        xl(i+1) = xl(i) + h*vl*cos(thtl(i));
        yl(i+1) = yl(i) + h*vl*sin(thtl(i));
        thtl(i+1) = thtl(i) + h*wl(i);
        xf(i+1) = xf(i) + h*vf(i)*cos(thtf(i));
        yf(i+1) = yf(i) + h*vf(i)*sin(thtf(i));
        thtf(i+1)= thtf(i) + h*wf(i);
        %bta(i)=thtl(i)-thtf(i);
    else
        vf(i)=0;
        wf(i)=-wfmax;
        xl(i+1) = xl(i) + h*vl*cos(thtl(i));
        yl(i+1) = yl(i) + h*vl*sin(thtl(i));
        thtl(i+1) = thtl(i) + h*wl(i);
        xf(i+1) = xf(i) + h*vf(i)*cos(thtf(i));
        yf(i+1) = yf(i) + h*vf(i)*sin(thtf(i));
        thtf(i+1)= thtf(i) + h*wf(i);
        
    end
    
    
    i=i+1;
    t(i)=t(i-1)+h;
    wl(i)=-sin(1.1*t(i));
    bta(i)=thtl(i)-thtf(i);
    ddd=atan((yl(i)-yf(i))/(xl(i)-xf(i)));
    
end
%
plot(xl,yl,'r',xf,yf); axis equal; grid on;
figure; plot(xl-3,yl,'r',xf,yf); axis equal; grid on;
figure; plot(t, xl-xf, 'b', t, yl-yf, 'r', t, sqrt((xl-xf).^2+(yl-yf).^2),'k'); grid on;
%figure; plot(t,thtf); grid on;
%figure; plot(t,thtl); grid on;
figure; plot(t,rad2deg(ddd-thtf)); grid on;
figure; plot(t, sqrt(xf.^2+yf.^2)); grid on;