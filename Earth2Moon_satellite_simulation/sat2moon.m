function out=sat2moon(alpha,v0)%lands at (-50,6.11019)%%(-9,6.1013)%%sat2moon(-60,6.115)%%
%%sat2moon(-70,6.121)%%sat2moon(-80,6.129)%sat2moon(-90,6.141)%%sat2moon(-100,6.162)%
%sat2moon(-110,6.22)%%
alpha=alpha*pi/180;
global RE,global RM;
[RE,RM]=radius();
rsat=1.06;%parking radius in AU
rse=rsat*[cos(alpha),sin(alpha)]-RE*[1,0];
vel=v0*[cos(alpha+(pi/2)),sin(alpha+(pi/2))];
initial_value=[rse,vel];

rel_tol=odeset('RelTol',10^-6);
[t,input]=ode45(@sat_acc,[0,28*24],initial_value,rel_tol);
T=27.322*24;
w=2*pi/T;%at t=T,angle covered=w*t=2*pi=orbit revolution completed
theta=w.*t;  
cord=[cos(theta),sin(theta)];
earth=-RE*cord;
moon=RM*cord;
 figure();hold on;
 axis([-150 150 -150 150]);hold on;
for i=1:length(t)
    %clf
    plot(input(i,1),input(i,2),'r.');hold on;
    plot(earth(i,1),earth(i,2),'b.');hold on;
    plot(moon(i,1),moon(i,2),'g*');hold on;
    pause(0.00001);
    drawnow;hold on;
   % norm(input(i,1:2)-moon(i,:))
    if norm(input(i,1:2)-moon(i,:))<=3500/6400
        msgbox(strcat('Satellite landed on moon,time:',num2str(t(i))))
        out=t(i)/24;
        break;
    end
end
hold off;
end