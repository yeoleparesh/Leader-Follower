function [xf yf thetafinal]=follower(vl,d,phi,thetal,thetaf)
v=(vl*cos(thetal-thetaf-phi))/cos(phi);
xf=v*cos(thetaf);
yf=v*sin(thetaf);
thetafinal=v*sin(thetal-thetaf)/(d*cos(phi));