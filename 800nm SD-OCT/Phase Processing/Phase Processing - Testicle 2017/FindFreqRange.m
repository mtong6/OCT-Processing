function[f,Y]=FindFreqRange(Phase)

%Masum 09252015

Fs = 30000;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L = size(Phase,2);                     % Length of signal
t = (0:L-1)*T*1000;                % Time vector


figure();
subplot(211),plot(t,Phase)
title('  the Time Domain');

n = 2^nextpow2(L);
dim = 2;
Y = fft(Phase,n,dim)/n;% 
% P2 = abs(Y/n);
% P1 = Y(:,1:n/2+1);
% P1(:,2:end-1) = 2*P1(:,2:end-1);

% In the frequency domain, plot the single-sided amplitude spectrum for each row in a single figure.

f = Fs*(0:(n/2))/n;

subplot(212),plot(f,2*abs(Y(1:n/2+1)))
title(' the Frequency Domain')