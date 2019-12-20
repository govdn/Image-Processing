clc;
clear;
close all;
x= imread('Fig0107.tif');
subplot(2,2,1);
image(x);
colormap(gray(256));
title('original image');
%To display the histogram
subplot(2,2,3);
imhist(x);
colormap(gray(256));
title('Histogram of the image');
subplot(2,2,2);
histeq(x);
title('equalized image');
y= histeq(x);
subplot(2,2,4);
imhist(y);

colormap(gray(256));
title('histogram of the equalize image');


