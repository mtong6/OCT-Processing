function [SNRMask_delp]=GenerateSNRmask_delp(pdPeakSNR,dSNRThreshold,nAlineGap,delp)

% Masum 07062015

pdSNRMask = (10.0*log10(pdPeakSNR)) > dSNRThreshold;
pdSNRMask=pdSNRMask(:,1:end-nAlineGap,:);
SNRMask=pdSNRMask(1:end-delp,:,:).*pdSNRMask(1+delp:end,:,:);
SNRMask_delp=reshape(SNRMask,size(SNRMask,1),size(SNRMask,2)*size(SNRMask,3) );


end