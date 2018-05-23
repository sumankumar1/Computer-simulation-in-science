function out = DCT(fx);

[N1,N2]=size(fx);
res=zeros(N1,N2);
res1=zeros(N1,N2);
for n2=1:N2
    for k1=1:N1
        res(k1,n2)= ((W(k1)/N1)^0.5)*cos(pi*(2*(1:N1)-1)*(k1-1)/(2*N1))  * fx(:,n2);
    end
end
for n1=1:N1
    for k2=1:N2
        res1(n1,k2)=cos(pi*(2*(1:N2)-1)*(k2-1)/(2*N2)) * ((W(k2)/N2)^0.5) * res(n1,:)';
    end
end
out=res1;
end