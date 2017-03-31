clc; clear all; close all;
%

tfinal=10;
%
i=1;
t(i)=0;
%
x(1,i)=5;
y(1,i)=2;
tht(1,i)=pi/2;
v(1,i)=1.3;
w(1,i)=-sin(1.1*t(i));
%
x(2,i)=3.5;
y(2,i)=2.2;
tht(2,i)=pi/6;
v(2,i)=0;
w(2,i)=0;
%
x(3,i)=8;
y(3,i)=1.5;
tht(3,i)=pi/3;
v(3,i)=0;
w(3,i)=0;
%
phi=-pi/3;
d=1.2;
%
h=0.001;
%
wfmax=pi;
K=0.7692;
vlmax=2;
vfmax=4;
M=1;
%
%
bta(1,i) = tht(1,i)-tht(2,i);
bta(2,i)=tht(2,i)-tht(3,i);
x1=0.95;
x2=0.98;
%
%
num = 2;
while t(i)<tfinal
    
%     if  bta(i)>=-asin(x2*d*cos(phi)) && bta(i)<=asin(x2*d*cos(phi))
%         %Follower
%         eeta=[(wfmax-K*vl)*d*cos(phi)/abs(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)));...
%             (vl*x1-abs(wl(i)))*d*cos(phi)/abs(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)));...
%             (vfmax*cos(phi)-vl*cos(bta(i)-phi))/abs((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi));...
%             vl*cos(bta(i)-phi)/abs((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi));M];
%         eeta=min(eeta);
%         vf1(i)=((eeta*((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi)))+(vl*cos(bta(i)-phi)))/(cos(phi));
%         wf1(i)=(eeta*(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)))+(vl*sin(bta(i))))/(d*cos(phi));
%         
%     else 
%         vf1(i)=0;
%         wf1(i)=sign(bta(i))*wfmax;
%                  
%     end
%     
%      if  bta2(i)>=-asin(x2*d*cos(phi)) && bta2(i)<=asin(x2*d*cos(phi))
%         %Follower
%         eeta1=[(wfmax-K*vf1(i))*d*cos(phi)/abs(-(x1f(i)-x2f(i))*sin(tht2f(i))-d*sin(phi)+(y1f(i)-y2f(i))*cos(tht2f(i)));...
%             (vf1(i)*x1f(i)-abs(wf1(i)))*d*cos(phi)/abs(-(x1f(i)-x2f(i))*sin(tht2f(i))-d*sin(phi)+(y1f(i)-y2f(i))*cos(tht2f(i)));...
%             (vfmax*cos(phi)-vf1(i)*cos(bta2(i)-phi))/abs((x1f(i)-x2f(i))*cos(tht2f(i)+phi)-d+(y1f(i)-y2f(i))*sin(tht2f(i)+phi));...
%             vf1(i)*cos(bta2(i)-phi)/abs((x1f(i)-x2f(i))*cos(tht2f(i)+phi)-d+(y1f(i)-y2f(i))*sin(tht2f(i)+phi));M];
%         eeta1=min(eeta1);
%         vf2(i)=((eeta1*((x1f(i)-x2f(i))*cos(tht2f(i)+phi)-d+(y1f(i)-y2f(i))*sin(tht2f(i)+phi)))+(vf1(i)*cos(bta2(i)-phi)))/(cos(phi));
%         wf2(i)=(eeta1*(-(x1f(i)-x2f(i))*sin(tht2f(i))-d*sin(phi)+(y1f(i)-y2f(i))*cos(tht2f(i)))+(vf1(i)*sin(bta2(i))))/(d*cos(phi));
%         
%     else 
%         vf2(i)=0;
%         wf2(i)=sign(bta2(i))*wfmax;
%                  
%      end
    v(1,i)=1.3;
    x(1,i+1) = x(1,i) + h*v(1,i)*cos(tht(1,i));
    y(1,i+1) = y(1,i) + h*v(1,i)*sin(tht(1,i));
    tht(1,i+1) = tht(1,i) + h*w(1,i);
   p=1;
    for g=1:num
        if  bta(g,i)>=-asin(x2*d*cos(phi)) && bta(g,i)<=asin(x2*d*cos(phi))
            %Follower
            eeta=[(wfmax-K*v(g,i))*d*cos(phi)/abs(-(x(g,i)-x(g+1,i))*sin(tht(g+1,i))-d*sin(phi)+(y(g,i)-y(g+1,i))*cos(tht(g+1,i)));...
                (v(g,i)*x1-abs(w(g,i)))*d*cos(phi)/abs(-(x(g,i)-x(g+1,i))*sin(tht(g+1,i))-d*sin(phi)+(y(g,i)-y(g+1,i))*cos(tht(g+1,i)));...
                (vfmax*cos(phi)-v(g,i)*cos(bta(g,i)-phi))/abs((x(g,i)-x(g+1,i))*cos(tht(g+1,i)+phi)-d+(y(g,i)-y(g+1,i))*sin(tht(g+1,i)+phi));...
                v(g,i)*cos(bta(g,i)-phi)/abs((x(g,i)-x(g+1,i))*cos(tht(g+1,i)+phi)-d+(y(g,i)-y(g+1,i))*sin(tht(g+1,i)+phi));M];
            eeta=min(eeta);
            v(g+1,i)=((eeta*((x(g,i)-x(g+1,i))*cos(tht(g+1,i)+phi)-d+(y(g,i)-y(g+1,i))*sin(tht(g+1,i)+phi)))+(v(g,i)*cos(bta(g,i)-phi)))/(cos(phi));
            w(g+1,i)=(eeta*(-(x(g,i)-x(g+1,i))*sin(tht(g+1,i))-d*sin(phi)+(y(g,i)-y(g+1,i))*cos(tht(g+1,i)))+(v(g,i)*sin(bta(g,i))))/(d*cos(phi));

        else 
            v(g+1,i)=0;
            w(g+1,i)=sign(bta(g,i))*wfmax;
                 
        end
       
        x(g+1,i+1) = x(g+1,i) + h*v(g+1,i)*cos(tht(g+1,i));
        y(g+1,i+1) = y(g+1,i) + h*v(g+1,i)*sin(tht(g+1,i));
        tht(g+1,i+1)= tht(g+1,i) + h*w(g+1,i);       
       % bta(g,i)=tht(g,i)-tht(g+1,i);
    end
     
     
        
        
        
    i=i+1;
    t(i)=t(i-1)+h;
    w(1,i)=-sin(1.1*t(i));
    bta(1,i) = tht(1,i)-tht(2,i);
    bta(2,i)=tht(2,i)-tht(3,i);
%     %ddd=atan((yl(i)-y1f(i))/(xl(i)-x1f(i)));
    
end
%
plot(x(1,:),y(1,:),'r',x(2,:),y(2,:),'g',x(3,:),y(3,:)); axis equal; grid on;