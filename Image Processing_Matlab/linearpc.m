noise=randn(50000,1);
x=filter(1,[1 0.5 0.33 0.25],noise);
x=x(45904:50000);
a= lpc(x,3);
est=filter([0,-a(2:end)],1,x);
e=x-est;
subplot(1,2,1);
plot(1:97,x(4001:4097),1:97,est(4001:4097),'--');
legend('orginal signal','estimated');
[acs,lag]=xcorr(e,'coeff');
subplot(1,2,2);
plot(lag,acs);


