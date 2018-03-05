function [SavePhaseDiffB4NoiseD1,SavePhaseDiffAfterNoiseD1,SaveAvgSNRD1,SavePhaseNoiseD1]=CalculateAndSavePhaseNoise_SNR_Variance_for_D(D1,pdLongTraceAllFiltered,FinalMaskEarthQuake,PeakSNR2D,delp,nNoiseStdTimes,nFinalFilter,n,nInitVol,nAlineGap,bFinalMasking,nDepthRange)

% Masum 06242015
%{
1. Find phase difference
2. mask the phase difference
3.Find phase variance
4. calculate phase noise

** calculate average SNR to see the trend

--PhaseDiffD1= Phase diff from a layer to another layer.
-- PhaseDiffD11= Phase diff after correction for Noise.
--PhaseNoiseD11=PhaseNoiseD1*nNoiseStdTimes. here nNoiseStdTimes is a multiplying factor for noise


%}
% nDepthRange=3;

if(bFinalMasking==0)    % 0=No Masking ; 1=Masking
    FinalMaskEarthQuake=ones(1,size(pdLongTraceAllFiltered,2));
end

pdLongTraceSelected=pdLongTraceAllFiltered(D1-nDepthRange:D1+nDepthRange,:);

PhaseDiff_Vertical=pdLongTraceSelected(1:end-delp,:)-pdLongTraceSelected(1+delp:end,:);

PhaseDiff_Vertical_MEQ=PhaseDiff_Vertical.*repmat(FinalMaskEarthQuake , size(PhaseDiff_Vertical,1),1);

PeakSNR2DSelected=PeakSNR2D(D1-nDepthRange:D1+nDepthRange,:);
PhaseVarianceD1=(0.5 ./(PeakSNR2DSelected(1:end-delp,:)))+(0.5 ./(PeakSNR2DSelected(1+delp:end,:)));
AvgSNRD1=10* log10((PeakSNR2DSelected(1:end-delp,:)+PeakSNR2DSelected(1+delp:end,:))/2);
PhaseNoiseD1=sqrt(PhaseVarianceD1)/sqrt(nFinalFilter);

for (i=1:1:size(PhaseDiff_Vertical,1))
    [PhaseDiffD1_W_TN(i,:),PhaseNoiseD1_W_SD(i,:)]=CorrectForPhaseNoise(PhaseDiff_Vertical_MEQ(i,:),PhaseNoiseD1(i,:)*nNoiseStdTimes);

end

SavePhaseDiffB4NoiseD1(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiff_Vertical_MEQ;
SavePhaseDiffAfterNoiseD1(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD1_W_TN;
SavePhaseVarianceD1(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD1;
SaveAvgSNRD1(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD1;
SavePhaseNoiseD1(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD1_W_SD;
end
