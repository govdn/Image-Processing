[x,f0]=wavread('Alarm01.wav');
fs = 10000;
x = resample(x,100000,fs);
t = (0:length(x)-1)/fs;
figure,
subplot(2,1,1);
plot(t,x);

[h,f] = freqz(1,512,fs);
subplot(2,1,2);
plot(f,(20*log10(abs(h))));
legend('Formant Freq');
ncoeff = 2+fs/1000