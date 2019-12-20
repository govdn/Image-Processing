clc;
clear;
close all;
img= imread('Fig1.tif');
%for i= 1:256
 %   for j=1:256
  %      img(i,j)=0;
   % end;
%end;

[m,n]= size(img);
figure(1);
subplot(3,1,1);
image(img);
colormap(gray(256));
title('original image');
imgh= [zeros(1,256)];
for i= 1:m
    for j=1:n
        cal = img(i,j);
imgh(1,cal+1) = imgh(1,cal+1)+1;
    end;
end;
%to plot the histogram of image
subplot(3,1,2);
plot(imgh);
title('Histogram without using ');
subplot(3,1,3);
y= imhist(img);
plot(transpose(y))
title('histogram of image');
