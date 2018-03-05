function [ y ] =BandPassFilter( Phase )
% Summary of this function goes here
%   Detailed explanation goes here

%Masum 09302015

Fs = 30000;                    % Sampling frequency
T = 1/Fs;                      % Sampling period
L = size(Phase,2);              % Length of signal
t = (0:L-1)*T*1000;             % Time vector


% figure();
% subplot(411),plot(t,Phase)
% title('  the Time Domain');

n = 2^nextpow2(L);
dim = 2;
Y = fft(Phase,n,dim)/n;% 

% f = Fs*(0:(n/2))/n;
% subplot(412),plot(f,2*abs(Y(1:n/2+1)))
% title(' the Frequency Domain')


Cutoff = 3100;
Ratio = (Fs/n);
fCutoff = ceil(Cutoff/Ratio);
fBandHalfWidth=ceil(400/Ratio);
Y(fCutoff-fBandHalfWidth:fCutoff+fBandHalfWidth) = 0;
Y(end-fCutoff+1-fBandHalfWidth:end-fCutoff+1+fBandHalfWidth) = 0;

% figure, plot(2*abs(Y(1:n/2+1)));title('Check cut off in fd');

y = L*(real(ifft(Y)));
y(:,L+1:end) = [];


% subplot(413),plot(t,y); title('Back to time domain')

% n1 = 2^nextpow2(size(y,2));
% dim = 2;
% Yf = fft(y,n1,dim)/n;% 
% f = Fs*(0:(n1/2))/n1;

% subplot(414),plot(f,2*abs(Yf(1:n1/2+1))); title('Again td to fd')


%% low pass filter
% 
% LowPassCutOff=2000;
% 
% % zero-out the frequencies higher than LowPassCutoff
% midpoint = ceil(length(Y)/2);
% Cutoff = LowPassCutOff;
% Ratio = (Fs/n);
% fCutoff = ceil(Cutoff/Ratio);
% Y(fCutoff:midpoint) = 0; 
% Y(midpoint+1:end-fCutoff+1)=0;
% 
% subplot(413),plot(f,2*abs(Y(1:n/2+1))); title('fd after low pass')
% 
% % returning back to time domain
% 
% y_td = L*(real(ifft(Y)));
% y_td(L+1:end) = [];
% subplot(414),plot(t,y_td); title('Back to time domain after low pass')
% y=y_td;

end




