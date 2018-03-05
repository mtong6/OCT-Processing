function [SNRMask_Comb_AlineGap_delp]=GenerateSNRmask_Comb_AlineGap_delp(pdPeakSNR,dSNRThreshold,nAlineGap,delp)

% Masum 07072015
pdSNRMask = (10.0*log10(pdPeakSNR)) > dSNRThreshold;
SNRMask = pdSNRMask(:,nAlineGap+1:end,:).*pdSNRMask(:,1:end-nAlineGap,:);
SNRMask=reshape(SNRMask,size(SNRMask,1),size(SNRMask,2)*size(SNRMask,3) );  % if only mask for low SNR over Aline gap
SNRMask_Comb_AlineGap_delp=SNRMask(1:end-delp,:).*SNRMask(1+delp:end,:); % Depth wise low SNR mask over low SNR  Aline gap mask


end