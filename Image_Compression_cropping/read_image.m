% read_image.m

% 1) read in the image
Y = double(imread('test_image.tif','TIF'));
dim = size(Y);

% 2) display the image in full resolution
figure('Units', 'pixels','position',[1 1 20+dim(2) 20+dim(1)])
ax=axes('Units', 'pixels', 'position', [10, 10, dim(2), dim(1)],'visible','off');
hold on;
image(Y,'parent',ax);
colormap(gray(256)); % correct mapping: values<->colors
