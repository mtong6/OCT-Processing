function [SNRMaskM1]=GenerateSNRmaskM1(pdPeakSNR,dSNRThreshold,delp)

% Masum 10202015
SNRMask = (10.0*log10(pdPeakSNR)) > dSNRThreshold;
SNRMaskM1=SNRMask(1:end-delp,:).*SNRMask(1+delp:end,:); % Depth wise low SNR mask over low SNR  Aline gap mask


end