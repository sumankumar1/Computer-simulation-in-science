function ex1(file)
clc
fx = double(imread(file));%reading image into matrix
[N1,N2]=size(fx);

%a)
res=DCT(fx);%writing dct of image
res1=IDCT(res);
maxError=max(max(abs(fx-res1)))
imwrite(res,gray(256),'test_image_DCT.tif');
imwrite(res1,flipud(gray(256)),'test_image_IDCT.tif');
%b)
imwrite(crop(fx,0.3),flipud(gray(256)),'test_image_cropped.tif');
%c)
crop1=crop(res,0.1);
imwrite(IDCT(crop1),flipud(gray(256)),'IDCT_crop1.tif');
crop2=crop(res,0.3);
imwrite(IDCT(crop2),flipud(gray(256)),'IDCT_crop2.tif');
crop3=crop(res,0.5);
imwrite(IDCT(crop3),flipud(gray(256)),'IDCT_crop3.tif');
compression_rate=[nnz(crop1),nnz(crop2),nnz(crop3)]./(N1*N2)
%plot([0.1,0.3,0.5],compression_rate,'--*');
%d)

mat1=0:8:N1;
mat2=0:10:N2;
mat1(1)=1;
mat2(1)=1;
fx1=zeros(N1,N2);
count=0;
for i=1:length(mat1)-1
    for j=1:length(mat2)-1
        m=mat1(i);n=mat1(i+1);
        p=mat2(j);q=mat2(j+1);
        block=fx(m:n,p:q);
        dct_block=DCT(block);
        dct_cropped=crop(dct_block,0.3);
        idct_block=IDCT(dct_cropped);
        fx1(m:n,p:q)=idct_block;
        count=count+nnz(dct_cropped);
    end
end
imwrite(fx1,flipud(gray(256)),'idct8.tif');
compression_rate_dct8=count/(N1*N2);
plot([0.1,0.3,0.5],compression_rate,'--*',0.3,compression_rate_dct8,'*');
end
