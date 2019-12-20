% get a section of vowel
clc;
[x,fs]=wavread('Alarm01.wav');
% resample to 10,000Hz (optional)
x=resample(x,10000,fs);
fs=10000;
%
% plot waveform
t=(0:length(x)-1)/fs;        % times of sampling instants
subplot(2,1,1);
plot(t,x);
title('Original speech waveform')
xlabel('Time ');
ylabel('Amplitude');
%
% get Linear prediction filter
ncoeff=2+fs/1000;           % rule of thumb for formant estimation
a=lpc(x,ncoeff);
%
% plot frequency response
[h,f]=freqz(1,a,512,fs);
subplot(2,1,2);
plot(f,20*log10(abs(h)+eps));
title('Formant frequency');
xlabel('Frequency');
ylabel('Gain');


% find frequencies by root-solving
r=roots(a);                  % find roots of polynomial a
r=r(imag(r)>0.01);           % only look for roots >0Hz up to fs/2
ffreq=sort(atan2(imag(r),real(r))*fs/(2*pi));
                             % convert to Hz and sort
for i=1:length(ffreq)
    fprintf('Formant %d Frequency %0f\n',i,ffreq(i));
end