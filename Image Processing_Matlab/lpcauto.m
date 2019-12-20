
%
% define lpc analysis parameters
    p=12;
    N=400;
    start=3000;
    nfft=1024;
  [x1 fs]=wavread('sample14.wav');
  subplot(2,1,1);plot(x1(1:N));title('input speech');
  
  % create arrays and hamming window weighted sequence
    n=[0:N-1];
    freq=0:fs/nfft:fs/2;
    winsig=hamming(length(x1(start:start+N-1))).*x1(start:start+N-1);
    winsig=[winsig;zeros(1,nfft-N)'];

% autolpc needs window applied prior to call        
% autolpc
x=winsig(1:N);%window applied
L=length(x);
r=[];
for i=0:p
	r=[r; sum(x(1:L-i).*x(1+i:L))];
end
R=toeplitz(r(1:p));
a=inv(R)*r(2:p+1);
A=[1; -a];
G=sqrt(sum(A.*r));

[Z,freq]=freqz(G,A',nfft,'whole',fs);
subplot(2,1,2);
plot(freq(1:nfft/2+1),20*log10(abs(Z(1:nfft/2+1))),'g','LineWidth',2);
title('lpc')
