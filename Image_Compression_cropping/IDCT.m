function out = IDCT(fx);

[N1,N2]=size(fx);
res=zeros(N1,N2);
res1=zeros(N1,N2);

for k1=1:N2
    for n2=1:N1
        res(n2,k1)= (([W(1),W(2)*ones(1,N1-1)]./N1).^0.5).*cos(pi*(2*n2-1)*((1:N1)-1)/(2*N1))  * fx(:,k1);
    end
end
for k2=1:N1
    for n1=1:N2
        res1(k2,n1)=cos(pi*(2*n1-1)*((1:N2)-1)/(2*N2)) .* (([W(1),W(2)*ones(1,N2-1)]./N2).^0.5) * res(k2,:)';
    end
end
out=res1;
end