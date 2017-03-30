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

xl(i)=5;
yl(i)=2;
thtl(i)=pi/2;
x1f(i)=3.5;
y1f(i)=2.2;
tht1f(i)=pi/6;
x2f(i)=6;
y2f(i)=1.5;
tht2f(i)=2*pi/3;
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
bta(i) = thtl(i)-tht1f(i);
bta2(i)=tht1f(i)-tht2f(i);
x1=0.95;
x2=0.98;
    
%
%

while t(i)<tfinal
    
    if  bta(i)>=-asin(x2*d*cos(phi)) && bta(i)<=asin(x2*d*cos(phi))
        %Follower
        eeta=[(wfmax-K*vl)*d*cos(phi)/abs(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)));...
            (vl*x1-abs(wl(i)))*d*cos(phi)/abs(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)));...
            (vfmax*cos(phi)-vl*cos(bta(i)-phi))/abs((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi));...
            vl*cos(bta(i)-phi)/abs((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi));M];
        eeta=min(eeta);
        vf1(i)=((eeta*((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi)))+(vl*cos(bta(i)-phi)))/(cos(phi));
        wf1(i)=(eeta*(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)))+(vl*sin(bta(i))))/(d*cos(phi));
        
    else 
        vf1(i)=0;
        wf1(i)=sign(bta(i))*wfmax;
                 
    end
    
     if  bta2(i)>=-asin(x2*d*cos(phi)) && bta2(i)<=asin(x2*d*cos(phi))
        %Follower
        eeta1=[(wfmax-K*vf1(i))*d*cos(phi)/abs(-(x1f(i)-x2f(i))*sin(tht2f(i))-d*sin(phi)+(y1f(i)-y2f(i))*cos(tht2f(i)));...
            (vf1(i)*x1f(i)-abs(wf1(i)))*d*cos(phi)/abs(-(x1f(i)-x2f(i))*sin(tht2f(i))-d*sin(phi)+(y1f(i)-y2f(i))*cos(tht2f(i)));...
            (vfmax*cos(phi)-vf1(i)*cos(bta2(i)-phi))/abs((x1f(i)-x2f(i))*cos(tht2f(i)+phi)-d+(y1f(i)-y2f(i))*sin(tht2f(i)+phi));...
            vf1(i)*cos(bta2(i)-phi)/abs((x1f(i)-x2f(i))*cos(tht2f(i)+phi)-d+(y1f(i)-y2f(i))*sin(tht2f(i)+phi));M];
        eeta1=min(eeta1);
        vf2(i)=((eeta1*((x1f(i)-x2f(i))*cos(tht2f(i)+phi)-d+(y1f(i)-y2f(i))*sin(tht2f(i)+phi)))+(vf1(i)*cos(bta2(i)-phi)))/(cos(phi));
        wf2(i)=(eeta1*(-(x1f(i)-x2f(i))*sin(tht2f(i))-d*sin(phi)+(y1f(i)-y2f(i))*cos(tht2f(i)))+(vf1(i)*sin(bta2(i))))/(d*cos(phi));
        
    else 
        vf2(i)=0;
        wf2(i)=sign(bta2(i))*wfmax;
                 
    end
    
        xl(i+1) = xl(i) + h*vl*cos(thtl(i));
        yl(i+1) = yl(i) + h*vl*sin(thtl(i));
        thtl(i+1) = thtl(i) + h*wl(i);
        x1f(i+1) = x1f(i) + h*vf1(i)*cos(tht1f(i));
        y1f(i+1) = y1f(i) + h*vf1(i)*sin(tht1f(i));
        tht1f(i+1)= tht1f(i) + h*wf1(i);
        x2f(i+1)=x2f(i) + h*vf2(i)*cos(tht2f(i));
        y2f(i+1) = y2f(i) + h*vf2(i)*sin(tht2f(i));
        tht2f(i+1)= tht2f(i) + h*wf2(i);
    i=i+1;
    t(i)=t(i-1)+h;
    wl(i)=-sin(1.1*t(i));
    bta(i)=thtl(i)-tht1f(i);
    bta2(i)=tht1f(i)-tht2f(i);
    %ddd=atan((yl(i)-y1f(i))/(xl(i)-x1f(i)));
    
end
%
plot(xl,yl,'r',x1f,y1f,'g',x2f,y2f); axis equal; grid on;