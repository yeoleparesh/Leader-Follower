function y=LF(n,t0,t1,xl0,yl0,thetal0,xf0,yf0,thetaf0)
v=1.5;
h=(t1-t0)/n;
t(1)=t0;
xl(1)=xl0;
xf(1)=xf0;
yl(1)=yl0;
yf(1)=yf0;
thetal(1)=thetal0;
thetaf(1)=thetaf0;
for i=1:n
    t(i+1)=t(i)+h;
    %theta(i+1)=theta(i)+(180/pi);
    [l m o]=leader(thetal(i),v,t(i));
    thetal(i+1)=thetal(i)+h*o;
    xl(i+1)=xl(i)+h*l;
    yl(i+1)=yl(i)+h*m;
    phi(i)=atan((yl(i)-yf(i))/((xl(i)-xf(i))))-thetaf(i);
    d(i)=sqrt((yl(i)-yf(i))^2+((xl(i)-xf(i)))^2);
    [ch ee nu]=follower(v,d(i),phi(i),thetal(i),thetaf(i));
    thetaf(i+1)=thetaf(i)+h*nu;
    xf(i+1)=xf(i)+h*ch;
    yf(i+1)=yf(i)+h*ee;
end;
%V=[t',y',p']
y=phi;
figure; plot(xl,yl,'r',xf,yf)
figure; plot(t,d); grid on;
figure; plot(t,phi); grid on;
