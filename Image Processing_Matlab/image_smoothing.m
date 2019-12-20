clc;
clear;
close all;
F=double(imread('Fig(hpf).tif'));
H=F;
I=F;
[rows cols]=size(F);
A=[1,1,1,1,1,;1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;1,1,1,1,1];
B=[1,3,1,3,1;2,6,2,6,2;1,3,1,3,1;2,6,2,6,2;1,3,1,3,1];
G1=zeros(5,5);
G2=zeros(5,5);
for i = 2:rows-1
    for j = 2:cols-1
        
        for k=-1:1
            for l=-1:1
                G1(k+2,l+2)=F(i+k,j+l).*A(k+2,l+2);
                G2(k+2,l+2)=F(i+k,j+l).*B(k+2,l+2);
            end
        end
        sumG1=sum(sum(G1));
        H(i,j)=sumG1./sum(sum(A));
        sumG2=sum(sum(G2));
        I(i,j)=sumG2./sum(sum(B));
    end
end
H = uint8(round(H - 1));
I = uint8(round(I - 1));
figure;

imshow(uint8(F));

title('Input Image for Smoothing Filters');
figure;
imshow(H);
title('Smoothened Image for non-weighted kernel A');
figure;
imshow(I);
title('Smoothened Image for weighted kernel B');