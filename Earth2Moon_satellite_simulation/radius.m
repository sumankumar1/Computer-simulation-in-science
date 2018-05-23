function [RE,RM]=radius()
%global RE,global RM;
GMe=20;%EU^3/h^2;
T=27.322*24;%hour
ratio=81.3;%Me/Mm
GMm=GMe/ratio;
a=((GMe+GMm)/(2*pi/T)^2)^(1/3);%(G(Me+Mm)/(2pi/T)^2)^1/3;
%assuming CM is at (0,0)
RM=2*a*(ratio/(ratio+1));%Me/Me+Mm
RE=2*a*(1/(1+ratio));%Mm/Me+Mm
%out=[RE,RM];
end

