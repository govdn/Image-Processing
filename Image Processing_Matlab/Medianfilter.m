clc;
clear;
close all;
a = imread('Fig(hpf).tif');
%addition of salt and pepper noise
b = imnoise(a,'salt & pepper',0.1);
%defining the box and median filters
h1 = ones(3,3);
h2= [-1 -1 -1;
    -1 8 -1;
    -1 -1 -1];

c1 = conv2(a,h1,'same');
c2=conv2(a,h2,'same');
c3=medfilt2(b,[5 5]);
subplot(2,2,1), imshow(a), title('original image');
subplot(2,2,2), imshow(c1), title('low pass filtered image');
subplot(2,2,3), imshow(c2), title('high pass filtered image');
subplot(2,2,4), imshow(c3), title('Median filtering');