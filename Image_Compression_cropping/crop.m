function out = crop(image,rho);

[N1,N2]=size(image);
num=(rho^2)*(N1^2+N2^2);

for n1=1:N1
    for n2=1:N2
        if n1^2+n2^2>num
            image(n1,n2)=0;
        end
    end
end
out=image;
end
