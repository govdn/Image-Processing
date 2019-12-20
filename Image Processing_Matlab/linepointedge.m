clc;
clear;
close all;
x= imread('Fig(point).tif');
y= imread('Fig(line).tif');
z= imread('Fig(edge).tif');
w1=[ -1 -1 -1 ; -1 8 -1; -1 -1 -1];
wvl= [-1 -1 -1; 2 2 2; -1 -1 -1 ];
we1= [1 0;0 -1];
we2=[0 1;-1 0];
yp= conv2(double(x),w1);
yvl=conv2(double(y),wvl);
ye1= conv2(double(z),we1);
ye=conv2(ye1,we2);
d= max(max(yp));
e= max(max(yvl));
[m,n]= size(yp);
for i=1:m-1
    for j=1:n-1
        if(yp(i,j)>= 0.8*d)
            yp(i,j)=255;
        else yp(i,j)=0;
        end;
    end;
end;
[m,n] = size(yvl);
for i=1:m-1
    for j=1:n-1
        if(yvl(i,j)>= 0.5*d)
            yvl(i,j)=255;
        else yvl(i,j)=0;
        end;
    end;
end;
figure,imshow(yp);
figure,imshow(yvl);
figure,imshow(ye);