
clc;
clear;
close all;
x= imread('Fig(edge).tif');
subplot(2,2,1);
image(x);
colormap(gray(256));
title('original image');
w1=[1 0
    0 -1];
y1= conv2(double(x),w1);
subplot(2,2,2);
image(y1);
colormap(gray(256));
title('diagonal edged image');
w2=[0 1;
    -1 0];
y2= conv2(double(x),w2);
y3=conv2(y1,w2);
subplot(2,2,3);
image(y2);
title('diagonal edged image');
subplot(2,2,4);
image(y3);
title('Edged image using robert method');
