clc;
clear;
close all;
r=imread('Fig(edge).tif');
%r=rgb2gray(x);
m1=[-1 -2 -1; 0 0 0; 1 2 1];
rf1=conv2(double(r),double(m1));
figure(1);
subplot(2,2,1);
image(r);
colormap(gray(256));
subplot(2,2,2);
image(rf1);
colormap(gray(256));
m2=[-1 0 1;-2 0 2;-1 0 1];
rf2= conv2(r,m2);
subplot(2,2,3);
image(rf2);
colormap(gray(256));
rf1=abs(rf1);
rf2=abs(rf2);
rf= rf1+rf2;
subplot(2,2,4);
image(rf);
colormap(gray(256));