[x,fs]=audioread('sample14.wav');
f= linspace(1,8000);
window=round(0.02*fs);
noverlap=round(0.97*window);
subplot(2,1,1);
spectrogram(x(200:2000),window,noverlap,f,fs,'yaxis');
