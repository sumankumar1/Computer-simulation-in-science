function [x,i] = improve_x(A,b,x)

err0=100;
err1=99;
i=0;
while(abs(err0)>abs(err1))
    err0=err1;
    b1=A*x;
    db=b1-b;
    error=A\db;
    err1=max(error);
    if abs(err0)<abs(err1)
            break;
    end
    x=x-error;
    i=i+1;
end
if i==1
    fprintf('No Significant Inmprovement possible\n');
end
end