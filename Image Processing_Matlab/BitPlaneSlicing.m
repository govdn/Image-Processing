clc;
clear;
close all;
%for i=1:256;
 %   for j=1:256;
  %      x(i,j)=0.2*i+3*j;
   % end;
%end;
%to use image comment above loops and uncomment below line size is found by
%size eof operator
x= imread('Fig(bitplane).tif');

x1= fix(x);

[m,n]= size(x1);
for i=1:m
    for j=1:n
        y1(i,j)=x1(i,j)/2;
        r1(i,j)= rem(x1(i,j),2)*255;
        y1(i,j)= fix(y1(i,j));
         y2(i,j)=y1(i,j)/2;
        r2(i,j)= rem(y1(i,j),2)*255;
        y2(i,j)= fix(y2(i,j));
         y3(i,j)=y2(i,j)/2;
        r3(i,j)= rem(y2(i,j),2)*255;
        y3(i,j)= fix(y3(i,j));
         y4(i,j)=y3(i,j)/2;
        r4(i,j)= rem(y3(i,j),2)*255;
        y4(i,j)= fix(y4(i,j));
         y5(i,j)=y4(i,j)/2;
        r5(i,j)= rem(y4(i,j),2)*255;
        y5(i,j)= fix(y5(i,j));
         y6(i,j)=y5(i,j)/2;
        r6(i,j)= rem(y5(i,j),2)*255;
        y6(i,j)= fix(y6(i,j));
        y7(i,j)=y6(i,j)/2;
        r7(i,j)= rem(y6(i,j),2)*255;
        y7(i,j)= fix(y7(i,j));
    end;
end;
figure(1);
subplot(2,4,1);
image(x1);
colormap(gray(256));
subplot(2,4,2);
image(r1);
colormap(gray(256));
subplot(2,4,3);
image(r2);
colormap(gray(256));
subplot(2,4,4);
image(r3);
colormap(gray(256));
subplot(2,4,5);
image(r4);
colormap(gray(256));
subplot(2,4,6);
image(r5);
colormap(gray(256));
subplot(2,4,7);
image(r6);
colormap(gray(256));
subplot(2,4,8);
image(r7);
colormap(gray(256));

