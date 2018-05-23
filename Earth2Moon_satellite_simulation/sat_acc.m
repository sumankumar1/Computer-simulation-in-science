function out=sat_acc(t,input)

input=input';
global RE,global RM;
%input is output of ode45
T=27.322*24;
GMe=20;
GMm=20/81.3;

w=2*pi/T;%at t=T,angle covered=w*t=2*pi=orbit revolution completed
theta=w*t;
cord=[cos(theta),sin(theta)];

rmoon=RM*cord;
rearth=-RE*cord;
rs=input(1:2);
vel=input(3:4);
%rs=rse+rearth;%satellite vector

a=-((GMe/(norm(rs-rearth)^3))*(rs-rearth))-((GMm/(norm(rs-rmoon)^3))*(rs-rmoon));
out1=[vel,a]';
out=out1;
end