function [y_td] = LowPassFilter(y_td_unfiltered, SamplingRate, LowPassCutOff, bShowFigure)
% Shahid 03-06-2013

Fs = SamplingRate;

%% Gets the spectrum by fft
[y_td_same y_fd faxis NFFT] = GetPowerSpectrum(y_td_unfiltered, Fs, bShowFigure);


%% zero-out the frequencies higher than LowPassCutoff
midpoint = ceil(length(y_fd)/2);
Cutoff = LowPassCutOff;
Ratio = (Fs/NFFT);
fCutoff = ceil(Cutoff/Ratio);
y_fd(fCutoff:midpoint) = 0; 
y_fd(midpoint+1:end-fCutoff+1)=0;


%% returning back to time domain
L = length(y_td_unfiltered);
y_td = L*(real(ifft(y_fd)));
y_td(L+1:end) = [];

%% Plot single-sided amplitude spectrum.
if(bShowFigure)

    figure, subplot 211, plot(y_td);
             title('signal in time domain - after filtering');
            xlabel('Time');
            ylabel('|y(t)|');
            
            subplot 212, plot(faxis, 2*abs(y_fd(1:NFFT))); 
            title('Single-Sided Spectrum of Y(t) - after filtering');
            xlabel('Frequency (Hz)');
            ylabel('|Y(f)|');
end