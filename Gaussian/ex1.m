A=randn(50);
sol=randn(50,1);
b=A*sol;
error=1:6;
i=1:3;
x=gaussel(A,b);
err=abs(x-sol);plot(err,'+');hold on;
error(1)=max(err);
[z,i(1)]=improve_x(A,b,x);
error(2)=max(abs(z-sol));
if i(1)>1
    x=z;
end
clear err;   
y=gaussel_pivot(A,b);
err=abs(y-sol);plot(err,'o');hold on;
error(3)=max(err);
[z,i(2)]=improve_x(A,b,y);
error(4)=max(abs(z-sol));
if i(2)>1
    y=z;
end
clear err;
matx=A\b;
err=abs(matx-sol);plot(err,'*');hold off;legend('No Pivot','Pivot','Matlab');
error(5)=max(err);
[z,i(3)]=improve_x(A,b,matx);
error(6)=max(abs(z-sol));
if i(3)>1
    matx=z;
end
clear err;