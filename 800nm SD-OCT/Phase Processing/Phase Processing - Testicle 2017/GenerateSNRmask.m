function [SNRMask]=GenerateSNRmask(pdPeakSNR,dSNRThreshold,nAlineGap,delp)

% Masum 07062015

pdSNRMask = (10.0*log10(pdPeakSNR)) > dSNRThreshold;
SNRMask = pdSNRMask(:,nAlineGap+1:end,:).*pdSNRMask(:,1:end-nAlineGap,:);
SNRMask=reshape(SNRMask,size(SNRMask,1),size(SNRMask,2)*size(SNRMask,3) );


% SNRMask(find (SNRMask==1))=100;
% SNRMask(find (SNRMask<100))=0;
% SNRMask(find (SNRMask==100))=1;

end