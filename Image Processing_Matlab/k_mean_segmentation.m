clc; clear;
I2= imread('Fig0312.tif');
%I2=rgb2gray(I2);

I=im2double(I2);
subplot(1,2,1);

imshow(I);
title('Original  image');
%subplot(1,3,2)
%imshow(I2);

g=kmeans(I(:),4);
J = reshape(g,size(I));
subplot(1,2,2);
imshow(J,[]);
title('Fuzzy K-means Segmented image');