clc; clear all; close all;
%

tfinal=20;
%
i=1;
t(i)=0;
%
xl(i)=5;
yl(i)=2;
thtl(i)=pi/2;
vl=1.2;
wl(i)=0.25;
%
x1f(i)=5;
y1f(i)=0;
tht1f(i)=pi/8;
vf1(i)=0;
wf1(i)=0;
%
x2f(i)=5;
y2f(i)=-2;
tht2f(i)=2*pi/3;
vf2(i)=0;
wf2(i)=0;

% x(4,i)=2;
% y(4,i)=1.5;
% tht(4,i)=pi/3;
% v(4,i)=0;
% w(4,i)=0;
%
phi=pi/3;
d=2;
%
h=0.001;
%
wfmax=pi;
K=0.2083;
vlmax=1.2;
vfmax=2.2592;
M=1;
%
%
bta(i) = thtl(i)-tht1f(i);
bta2(i)=tht1f(i)-tht2f(i);
%bta(3,i)=tht(3,i)-tht(4,i);
x1=0.95;
x2=0.98;
%
%
% num = 1;
while t(i)<tfinal
    
    if  bta(i)>=-asin(x2*d*cos(phi)) && bta(i)<=asin(x2*d*cos(phi))
        %Follower
        eeta=[(wfmax-K*vl)*d*cos(phi)/abs(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)));...
            (vl*xl(i)-abs(wl(i)))*d*cos(phi)/abs(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)));...
            (vfmax*cos(phi)-vl*cos(bta(i)-phi))/abs((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi));...
            vl*cos(bta(i)-phi)/abs((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi));M];
        eeta=min(eeta);
        vf1(i)=((eeta*((xl(i)-x1f(i))*cos(tht1f(i)+phi)-d+(yl(i)-y1f(i))*sin(tht1f(i)+phi)))+(vl*cos(bta(i)-phi)))/(cos(phi));
        wf1(i)=(eeta*(-(xl(i)-x1f(i))*sin(tht1f(i))-d*sin(phi)+(yl(i)-y1f(i))*cos(tht1f(i)))+(vl*sin(bta(i))))/(d*cos(phi));
        
    else 
        vf1(i)=0;
        wf1(i)=sign(bta(i))*wfmax;                 
    end
    
    K11=1/(sqrt(1/(K^2)-(d*cos(phi))^2)+d*sin(phi));
    K12=1/(-sqrt(1/(K^2)-(d*cos(phi))^2)+d*sin(phi));
    if  bta2(i)>=asin(K12*d*cos(phi)) && bta2(i)<=asin(K11*d*cos(phi))
        %Follower
        eeta1=[(wfmax-K11*vf1(i))*d*cos(phi)/abs(-(x1f(i)-x2f(i))*sin(tht2f(i))-d*sin(phi)+(y1f(i)-y2f(i))*cos(tht2f(i)));...
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
    tht1f(i+1) = tht1f(i) + h*wf1(i);
    x2f(i+1) = x2f(i) + h*vf2(i)*cos(tht2f(i));
    y2f(i+1) = y2f(i) + h*vf2(i)*sin(tht2f(i));
    tht2f(i+1) = tht2f(i) + h*wf2(i);
   
%     for g=1:num
%         q=q+1;
%         K(q,1)=1/(sqrt(1/(K(q-1,1)^2)-(d*cos(phi))^2)+d*sin(phi));
%         K(q,2)=1/(-sqrt(1/(K(q-1,1)^2)-(d*cos(phi))^2)+d*sin(phi));
%         if  bta(g,i)>=asin(K(q-1,2)*d*cos(phi)) && bta(g,i)<=asin(K(q-1,1)*d*cos(phi))
%             %Follower
% %             eeta=[(wfmax-K(q-1,1)*v(g,i))*d*cos(phi)/abs(-(x(g,i)-x(g+1,i))*sin(tht(g+1,i))-d*sin(phi)+(y(g,i)-y(g+1,i))*cos(tht(g+1,i)));...
% %                 (v(g,i)*x(g,i)-abs(w(g,i)))*d*cos(phi)/abs(-(x(g,i)-x(g+1,i))*sin(tht(g+1,i))-d*sin(phi)+(y(g,i)-y(g+1,i))*cos(tht(g+1,i)));...
% %                 (vfmax*cos(phi)-v(g,i)*cos(bta(g,i)-phi))/abs((x(g,i)-x(g+1,i))*cos(tht(g+1,i)+phi)-d+(y(g,i)-y(g+1,i))*sin(tht(g+1,i)+phi));...
% %                 v(g,i)*cos(bta(g,i)-phi)/abs((x(g,i)-x(g+1,i))*cos(tht(g+1,i)+phi)-d+(y(g,i)-y(g+1,i))*sin(tht(g+1,i)+phi));M];
% %             eeta=min(eeta);
%             v(g+1,i)=(v(g,i)*cos(bta(g,i)-phi))/(cos(phi));
%             w(g+1,i)=(v(g,i)*sin(bta(g,i)))/(d*cos(phi));
% 
%         else 
%             v(g+1,i)=0;
%             w(g+1,i)=sign(bta(g,i))*wfmax;
%                  
%         end
%        
%         x(g+1,i+1) = x(g+1,i) + h*v(g+1,i)*cos(tht(g+1,i));
%         y(g+1,i+1) = y(g+1,i) + h*v(g+1,i)*sin(tht(g+1,i));
%         tht(g+1,i+1)= tht(g+1,i) + h*w(g+1,i);       
%        % bta(g,i)=tht(g,i)-tht(g+1,i);
%     end
     
     
        
        
        
    i=i+1;
    t(i)=t(i-1)+h;
    wl(i)=0.6;
    %vl(i)=1.2;
    bta(i) = thtl(i)-tht1f(i);
    bta2(i)=tht1f(i)-tht2f(i);
    %bta(3,i)=tht(3,i)-tht(4,i);
%     %ddd=atan((yl(i)-y1f(i))/(xl(i)-x1f(i)));
    
end
%
% figure; plot(t,K*d,'r',t,1,'g');title('Condition I');xlabel('Time');ylabel('K*d');grid on;
% figure; plot(t,K*vlmax,'r',t,wfmax,'g');title('Condition II');xlabel('Time');ylabel('K*Vlmax'); grid on;
% figure; plot(t,vlmax*cos(min(0,(phi-asin(K*d*cos(phi))))),'r',t,vfmax*cos(phi),'g');title('Condition III');xlabel('Time');ylabel('Vlmax*cos(a)');grid on;
%
figure; plot(xl,yl,'r',x1f,y1f,'g');title('Trajectory of leader-follower');xlabel('x-coordinate');ylabel('y-coordinate');axis equal; grid on;
%figure; plot(t,w(1,:)./v(1,:),'r',t,K(1,2),'k',t,K(2,1),'y',t,K(2,2),'y');axis equal;title('Trajectory of leader-follower');xlabel('x-coordinate');ylabel('y-coordinate');axis equal; grid on;
%
% figure; plot(t,w(1,:)./v(1,:),'r',t,K,'k',t,-K);title('Leaders-curvature');xlabel('Time');ylabel('K-Leader'); grid on;
% figure; plot(t,bta(1,:),'b',t,asin(K*d*cos(phi)),'k',t,-asin(K*d*cos(phi)),'k');title('Angle Beta');xlabel('Time');ylabel('Beta');grid on;
% figure; plot(t,w(2,:),'b',t,v(2,:),'r');title('Follower controls');xlabel('Time'); ylabel('wf/vf'); grid on;
%

%figure; plot(t,((((x(1,:)-x(1+1,:)).*cos(tht(1+1,:)+phi)-d+(y(1,:)-y(1+1,:)).*sin(tht(1+1,:)+phi)))),'r');title('Error');xlabel('Time');ylabel('error');axis equal; grid on;
%