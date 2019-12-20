clc;
clear;
close all;
x= imread('Fig(line).tif');
y = imread('Fig(point).tif');
z= imread('Fig(edge).tif');

wp =[-1 -1 -1; -1 8  -1; -1 -1 -1];
 wvl = [-1 -1 -1;2 2 2;1 -1 -1];
 we1=[1 0;0 -1];
we2=[0 1;-1 0];
 yp= conv2(double(y),wp);
 yvl= conv2(double(x),wvl);
 ye1= conv2(double(z),we2);
 ye2=conv2(ye1,we1);
 e = max(max(yvl));
 d = max(max(yp));
 [m,n] = size(yvl);
 for i=1:m
     for j= 1:n
         
if(yvl(i,j)>= 0.8*e)
     yvl(i,j)=255;
 else yvl(i,j) = 0;   
end;end;end
 [m,n] = size(yp);
 for i=1:m
    for j= 1:n
if(yp(i,j) >= 0.4*d)
    yp(i,j)=255;
else yp(i,j) = 0;
end
    end
end
 figure, imshow(yp);
 figure, imshow(yvl);
figure, imshow(ye2);