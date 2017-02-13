function [y p q]=euler_function(theta,v,t)
y=v*cos(theta);
p=v*sin(theta);
q=(1/v)*sin(0.1*t);