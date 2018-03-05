function [PhasediffB4NoiseSubtraction,PhasediffAfterNoiseSubtraction,AvgSNR,PhaseNoise]=GeneratePhaseDiffAndPhaseNoise(pdLongTraceAllFiltered,FinalMaskEarthQuake,...
    PeakSNR2D,delp,nNoiseStdTimes,nFinalFilter,n,nInitVol,nAlineGap,bFinalMasking,SNRMask_Comb_AlineGap_delp,bSNRMask,nFrameNumber,nAlineNumber)
% Masum 07272015
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


pdLongTraceSelected=pdLongTraceAllFiltered;
PhaseDiff_Vertical=pdLongTraceSelected(1:end-delp,:)-pdLongTraceSelected(1+delp:end,:);

if(bSNRMask==1)
    PhaseDiff_Vertical=PhaseDiff_Vertical.*SNRMask_Comb_AlineGap_delp;                                       % 1= Apply SNR mask; 0=No SNR mask

end

if(bFinalMasking==0)    % 0=No Masking ; 1=Masking
    FinalMaskEarthQuake=ones(1,size(pdLongTraceAllFiltered,2));
end

PhaseDiff_Vertical_MEQ=PhaseDiff_Vertical.*repmat(FinalMaskEarthQuake , size(PhaseDiff_Vertical,1),1);   % For no masking, multiply with all 1.

PeakSNR2DSelected=PeakSNR2D;
PhaseVarianceD=(0.5 ./(PeakSNR2DSelected(1:end-delp,:)))+(0.5 ./(PeakSNR2DSelected(1+delp:end,:)));
AvgSNRD=10* log10((PeakSNR2DSelected(1:end-delp,:)+PeakSNR2DSelected(1+delp:end,:))/2);
PhaseNoiseD=sqrt(PhaseVarianceD)/sqrt(nFinalFilter);

for (i=1:1:size(PhaseDiff_Vertical,1))
    [PhaseDiffD_W_TN(i,:),PhaseNoiseD_W_SD(i,:)]=CorrectForPhaseNoise(PhaseDiff_Vertical_MEQ(i,:),PhaseNoiseD(i,:)*nNoiseStdTimes);

end

PhasediffB4NoiseSubtraction(:,(n-nInitVol)*nFrameNumber*(nAlineNumber-nAlineGap)+1:(n-nInitVol+1)*nFrameNumber*(nAlineNumber-nAlineGap))=PhaseDiff_Vertical_MEQ;
PhasediffAfterNoiseSubtraction(:,(n-nInitVol)*nFrameNumber*(nAlineNumber-nAlineGap)+1:(n-nInitVol+1)*nFrameNumber*(nAlineNumber-nAlineGap))=PhaseDiffD_W_TN;
AvgSNR(:,(n-nInitVol)*nFrameNumber*(nAlineNumber-nAlineGap)+1:(n-nInitVol+1)*nFrameNumber*(nAlineNumber-nAlineGap))=AvgSNRD;
PhaseNoise(:,(n-nInitVol)*nFrameNumber*(nAlineNumber-nAlineGap)+1:(n-nInitVol+1)*nFrameNumber*(nAlineNumber-nAlineGap))=PhaseNoiseD_W_SD;
end
