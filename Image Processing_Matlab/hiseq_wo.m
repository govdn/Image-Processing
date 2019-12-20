clc;
close all;
I=imread('Fig(hist).tif');
figure,imshow(I);
title('original image');
%Read a grayscale Image or a matrix mxn
%use this for jpg image and avoid for tif and gray images
A=rgb2gray(I);
subplot(2,2,1),
imshow(A); title('Gray Image');
%Specify the bin range[0 255]
bin=255;
%Find the histogram of the image.
Val=reshape(A,[],1);
Val=double(Val);
I=hist(Val,0:bin);
%Divide the result by number of pixels
Output=I/numel(A);
%Calculate the Cumlative sum
CSum=cumsum(Output);
%Perform the transformation S=T(R) where S and R in the range [ 0 1]
HIm=CSum(A+1);
%Convert the image into uint8
HIm=uint8(HIm*bin);
subplot(2,2,2),
imshow(HIm);
title('Equilised Image')
subplot(2,2,3),imhist(A);
title('Original Histogram');
subplot(2,2,4),
imhist(HIm);
title('Equilized Histogram');