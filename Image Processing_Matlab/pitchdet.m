clc;
clear;
close all;

 [x, fs] = audioread('sample14.wav'); x = x(1000:1480);
  
     maxlag = fs/50; % F0 is greater than 50Hz => 20ms maxlag

 %% Auto-correlation
 r = xcorr(x, maxlag, 'coeff');

     %% plot waveform
     t=(0:length(x)-1)/fs;        % times of sampling instants
     subplot(2,1,1);
     plot(t,x);
     legend('Waveform');
     xlabel('Time (s)');
     ylabel('Amplitude');
     xlim([t(1) t(end)]);

     %% plot autocorrelation
     d=(-maxlag:maxlag)/fs;
     subplot(2,1,2);
     plot(d,r);
     legend('Auto-correlation');
     xlabel('Lag (s)');
     ylabel('Correlation coef');

 ms2=floor(fs/500); % 2ms
 ms20=floor(fs/50); % 20ms
 % half is just mirror for real signal
 r = r(floor(length(r)/2):end);
 [maxi,idx]=max(r(ms2:ms20));
 f0 = fs/(ms2+idx-1);
 disp(f0);
