data=[-50,6.11019;-60,6.115;-70,6.121;-80,6.129;-90,6.141;-100,6.162;-110,6.22];
for i=1:length(data)
    time(i)=sat2moon(data(i,1),data(i,2));
end
a=plot3(data(:,1),data(:,2),time,'--*');grid on;xlabel('Angle of launch');ylabel('Speed of launch');zlabel('Time taken to reach moon');