function [y_td_same y_fd faxis NFFT] = GetPowerSpectrum(y_td_unfiltered, SamplingRate, bShowFigure)

Fs = SamplingRate;
L = length(y_td_unfiltered);
NFFT = 2^nextpow2(L);         % Immediate close power of 2 from length of y
y_fd = fft(y_td_unfiltered, NFFT)/L;
% faxis = Fs*linspace(0, 1, NFFT);
faxis = 0:Fs/NFFT:Fs-1;

%% Plot single-sided amplitude spectrum.
if(bShowFigure)
    figure, subplot 211, plot(y_td_unfiltered);
            title('signal in time domain - before any filtering');
            xlabel('Time Points');
            ylabel('|y(t)|');
            
            subplot 212, plot(faxis, 2*abs(y_fd(1:NFFT))); 
            title('Single-Sided Spectrum of Y(t) - before any filtering');
            xlabel('Frequency (Hz)');
            ylabel('|Y(f)|');
end

%% returning back to time domain
L = length(y_td_unfiltered);
y_td = L*(real(ifft(y_fd)));
y_td(L+1:end) = [];
y_td_same = y_td;
