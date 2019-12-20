clc;
clear;
close all;
x= imread('img1.jpg');
y=rgb2gray(x);
[m,n,t]=size(y);
max=0;
for i=1:m
    for j=1:n
        if(max < x(i,j))
            max=x(i,j);
        end
    end;
end

        