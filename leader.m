function [xl yl thetal]=leader(theta,v,t)
xl=v*cos(theta);
yl=v*sin(theta);
thetal=(1/v)*sin(0.1*t);