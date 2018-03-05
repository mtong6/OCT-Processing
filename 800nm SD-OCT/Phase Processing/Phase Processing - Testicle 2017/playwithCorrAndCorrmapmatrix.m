function [SavePhaseDiffB4NoiseD,SavePhaseDiffAfterNoiseD,SaveAvgSNRD,SavePhaseNoiseD,pdCorrMatrix,CorrMapMatrix,CorrMapMatrix_just_after_thr,PhaseDiff_VerticalEdited]=playwithCorrAndCorrmapmatrix(pdLongTraceAllFiltered,FinalMaskEarthQuake,PeakSNR2D,delp,nNoiseStdTimes,nFinalFilter,n,nInitVol,nAlineGap,bFinalMasking,SNRMask_Comb_AlineGap_delp,bSNRMask ...
    ,D1,D2,D3,D4,D5,D6,D7,D8,nDepthRange,CorrLength,CorrCtrStart)

% Masum 0721015
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

PhaseDiff_VerticalEdited=ConcatenateAllDepthPoints(D1,D2,D3,D4,D5,D6,D7,D8,PhaseDiff_Vertical,nDepthRange+1);

disp('Correlation started...');
pdCorrMatrix = FindCorrelation(PhaseDiff_VerticalEdited,CorrLength,CorrCtrStart);
disp('Inter layer Correlation done.');


SNRMask_Comb=ConcatenateAllDepthPoints(D1,D2,D3,D4,D5,D6,D7,D8,SNRMask_Comb_AlineGap_delp,nDepthRange+1);


disp('Corr mapping Started...');
[CorrMapMatrix,CorrMapMatrix_just_after_thr] = CorrMap(pdCorrMatrix);
disp('Corr mapping done.');

figure, imagesc(-pdCorrMatrix(:,1:1000)); colormap gray;title('pdCorrMatrix ');colorbar;
figure, imagesc(-CorrMapMatrix_just_after_thr(:,1:1000)); colormap gray;title('CorrMapMatrix just after thr');colorbar;
figure, imagesc(-(CorrMapMatrix(:,1:1000).*SNRMask_Comb(:,1:1000))); colormap gray;title('CorrMapMatrix ');colorbar;
figure, imagesc(-(CorrMapMatrix(:,1:1000).*SNRMask_Comb(:,1:1000))); colormap gray;title('CorrMapMatrix with SNRMask_Comb');colorbar;
keyboard;

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

SavePhaseDiffB4NoiseD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiff_Vertical_MEQ;
SavePhaseDiffAfterNoiseD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD_W_TN;
SavePhaseVarianceD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD;
SaveAvgSNRD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD;
SavePhaseNoiseD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD_W_SD;
end
