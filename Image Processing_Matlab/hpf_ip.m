clc;
clear;
close all;
x= imread('Fig(hpf).tif');
subplot(1,2,1);
image(x);
colormap(gray(256));
title('original image');
%to implement hpf
w= [-1 -1 -1;
    -1 8 -1;
    -1 -1 -1];
y= conv2(x,w);
subplot(1,2,2);
image(y);
colormap(gray(256));
title('high pass filter');
