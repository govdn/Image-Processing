%Input Image
A=imread('Fig(smooth).tif');
figure;
subplot(1,3,1);
image(A);title('Input image');
%Preallocate the matrices with zeros
I1=A;
I=zeros(size(A));
%I2=zeros(size(A));

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
subplot(1,3,2),image(I),colormap(gray(256));title('Filtered image');

%Sharpenend Image
B=I1-I;
subplot(1,3,3);image(B);colormap(gray(256));title('Sharpened image');
