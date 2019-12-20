%Input Image
A=imread('Fig(line).tif');
%A=rgb2gray(I);
figure(1);
subplot(2,1,1),imshow(A);title('original Image');
%Preallocate the matrices with zeros
I1=A;
I=zeros(size(A));
I2=zeros(size(A));
%Filter Masks
F1=[0 1 0;1 -4 1; 0 1 0];
F2=[1 1 1;1 -8 1; 1 1 1];
%Padarray with zeros
A=padarray(A,[1,1]);
A=double(A);
%Implementation of the equation in Fig.D
for i=1:size(A,1)-2
for j=1:size(A,2)-2
I(i,j)=sum(sum(F2.*A(i:i+2,j:j+2)));
end
end
I=uint8(I);
subplot(2,1,2),imshow(I);title('Edge Detected');

% line detection

fplap_H = [-1 -1 -1; 2 2 2; -1 -1 -1] %Horizontal line
fplap_V = [-1 2 -1; -1 2 -1; -1 2 -1] %Vertical line
fplap_pos45deg = [-1 -1 2 ; -1 2 -1; 2 -1 -1] %+45deg
fplap_neg45deg = [2 -1 -1; -1 2 -1; -1 -1 2 ] %-45deg
filtim_H = imfilter(A,fplap_H,'symmetric', 'conv');
filtim_V = imfilter(A,fplap_V,'symmetric', 'conv');
filtim_pos45deg = imfilter(A,fplap_pos45deg,'symmetric', 'conv');
filtim_neg45deg = imfilter(A,fplap_neg45deg,'symmetric', 'conv');

figure(2);
subplot(2,2,1)
imshow(filtim_H);
title('Horiontal line');
subplot(2,2,2)
imshow(filtim_V);
title('Vertical line');
subplot(2,2,3)
imshow(filtim_pos45deg);
title('+45deg');
subplot(2,2,4)
imshow(filtim_neg45deg);
title('-45deg');

% Point detection

fplap = [-1 -1 -1; -1 8 -1; -1 -1 -1] %Laplacian at a point
% fplap = [0 1 0; 1 -4 1; 0 1 0] %Laplacian at a point
filtim = imfilter(A,fplap,'symmetric', 'conv');
figure(3);
subplot(2,1,1)
imshow(filtim);
title('Laplacian Point Filtered');
subplot(2,1,2)
imshow(A-filtim);
title('Difference Image');