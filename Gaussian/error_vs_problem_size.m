err0=[];
err1=[];
for i=10:10:100
    A=rand(i);
    b=rand(i,1);
    x=gaussel(A,b);
    y=gaussel_pivot(A,b);
    z=A\b;
    err0=[err0,max(abs(x-z))];
    err1=[err1,max(abs(y-z))];
end
p=10:10:100;
plot(p,err0,'*--');hold on;plot(p,err1,'--o');legend('No Pivot','Pivot');xlabel('Problem Size');ylabel('Error');