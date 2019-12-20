[speechfs,fs]=wavread('sample14.wav');
speechfs=speechfs(4001:5000);
winlen=[150 300 600 700];
n=length(winlen);

k=0;
for iwinlen=winlen
    k=k+1;
    wham =hamming(iwinlen);
    frameop=buffer(speechfs,winlen(k),winlen(k)-1);
    windop=diag(sparse(wham))*frameop;
    energyop=sum(windop.^2,1);
    subplot(n,1,k);
    plot(energyop);
    legend(['windowsize:',num2str(iwinlen),'samples']);
end