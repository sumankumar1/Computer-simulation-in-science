% read_sample.m
%
% load 10 hand-written digits from file and use a neural network
% for digit recognition
%
% before the neural network is involved, the digits are normalized and 
% centered

dat = imread('toms_sauklaue4.png');
load('weights.mat'); % load weights for a neural network
net = make_ffnet(3, [784, 800, 10], [true true false]);
net.w = w;

h1 = figure();
h2 = figure();

set{1} = zeros(10,28*28);
for l=1:10
   % map integer colors 0..255 to float colors 1..0
   im = double(255-dat(1:28,(l-1)*29+2:l*29))/256;
   % plot original image;
   figure(h1);
   imagesc(im);
   colormap(1-gray(256));
   drawnow;
   title('original image')
   
   % normalize:
   % coordinates of pixels; 0/0 is in the center                                                                                                                                     
   x = [-13.5:1:13.5];                                                                                                                                                               
   y = [-13.5:1:13.5];                                                                                                                                                               
   [X,Y] = meshgrid(x,y);
   threshold = 0.3*max(max(im));
   im(im<threshold)= 0;
   width  = sum(sum(im,1)~=0);
   height = sum(sum(im,2)~=0);
   %rescale such that the larger dimension has a size of 20 pixels
   s = 20/max(width,height); % scaling factor
   for i=1:28
   for j=1:28
      % coordinates of rescaled image
      Xp(i,j) = X(i,j)*s;
      Yp(i,j) = Y(i,j)*s;
   end
   end
   
   %compute "center of mass"
   cx =0;
   cy =0;
   for i=1:28
   for j=1:28
      cx = cx + im(i,j)*Xp(i,j);
      cy = cy + im(i,j)*Yp(i,j);
   end
   end
   cx = cx/ sum(sum(im));
   cy = cy/ sum(sum(im));
   
   % subtract center of mass
   Xp = Xp - cx;
   Yp = Yp - cy;
       
   %interpolate the transformed picture to old coordinate points
   F = TriScatteredInterp(Xp(:),Yp(:),im(:));
   im = F(X,Y); im(isnan(im)) = 0;
   
   % plot normalized image
   figure(h2);
   imagesc(im);
   colormap(1-gray(256));
   drawnow;
   title('normalized image')
   
   im = im.';
   net = ffnet_eval(net,im(:).');
   out = net.O{end};
   [v d] = max(out);
   fprintf('looks like a %d\n',d-1);
   text(20,25,sprintf('%d',d-1),'Color','r');
   input('weiter?')
end
