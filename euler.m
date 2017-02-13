function y=euler(n,t0,t1,x0,y0,theta0)
v=10;
h=(t1-t0)/n;
t(1)=t0;
x(1)=x0;
theta(1)=theta0;
y(1)=y0;
for i=1:n
    t(i+1)=t(i)+h;
    [l m o]=euler_function(theta(i),v,t(i));
    theta(i+1)=theta(i)+h*o;
    x(i+1)=x(i)+h*l;
    y(i+1)=y(i)+h*m;    
end;
%V=[t',y',p']
plot(x,y)
