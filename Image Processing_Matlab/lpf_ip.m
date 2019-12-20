clear;
close all;
x= imread('Fig(hpf).tif');
%if input takes three dimension convert to 2D
%rgb2gray

subplot(1,2,1);
image(x);
colormap(gray(256));
title('original image');
%to implement lpf
w= [1 1 1;
    1 1 1;
    1 1 1];
y= conv2(x,w);
subplot(1,2,2);
image(y);
colormap(gray(256));
title('low pass filtered image');
