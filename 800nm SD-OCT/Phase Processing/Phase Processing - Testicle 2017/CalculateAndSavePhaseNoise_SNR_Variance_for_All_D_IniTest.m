function [SavePhaseDiffB4NoiseD,SavePhaseDiffAfterNoiseD,SaveAvgSNRD,SavePhaseNoiseD]=CalculateAndSavePhaseNoise_SNR_Variance_for_All_D_IniTest(pdLongTraceAllFiltered,FinalMaskEarthQuake,PeakSNR2D,delp,nNoiseStdTimes,nFinalFilter,n,nInitVol,nAlineGap,...
    bFinalMasking,SNRMask_Comb_AlineGap_delp,bSNRMask,nStartingFrame,nFrameNumber,bInitialTest)

% Masum 0707015
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

 if(bInitialTest)
     pdPD3D=reshape(PhaseDiff_Vertical,size(PhaseDiff_Vertical,1), size(PhaseDiff_Vertical,2)/nFrameNumber,nFrameNumber); 
     TitleOfGraph='Layer wise phase diff before apply of SNR or MEQ';
     plotAllPhaseInSameGraph( pdPD3D,nStartingFrame,TitleOfGraph);
 end

if(bSNRMask==1)
PhaseDiff_Vertical=PhaseDiff_Vertical.*SNRMask_Comb_AlineGap_delp;                                       % 1= Apply SNR mask; 0=No SNR mask

 if(bInitialTest)
     pdPD3D1=reshape(PhaseDiff_Vertical,size(PhaseDiff_Vertical,1), size(PhaseDiff_Vertical,2)/nFrameNumber,nFrameNumber); 
   
     TitleOfGraph='Layer wise phase diff after SNRmask';
     plotAllPhaseInSameGraph( pdPD3D1,nStartingFrame,TitleOfGraph);
 end

end

if(bFinalMasking==0)    % 0=No Masking ; 1=Masking
    FinalMaskEarthQuake=ones(1,size(pdLongTraceAllFiltered,2));
end

PhaseDiff_Vertical_MEQ=PhaseDiff_Vertical.*repmat(FinalMaskEarthQuake , size(PhaseDiff_Vertical,1),1);   % For no masking, multiply with all 1.
 if(bInitialTest)
     pdPD3D2=reshape(PhaseDiff_Vertical_MEQ,size(PhaseDiff_Vertical,1), size(PhaseDiff_Vertical,2)/nFrameNumber,nFrameNumber); 
   
     TitleOfGraph='Layer wise phase diff after MEQ';
     plotAllPhaseInSameGraph( pdPD3D2,nStartingFrame,TitleOfGraph);
 end

PeakSNR2DSelected=PeakSNR2D;
PhaseVarianceD=(0.5 ./(PeakSNR2DSelected(1:end-delp,:)))+(0.5 ./(PeakSNR2DSelected(1+delp:end,:)));
AvgSNRD=10* log10((PeakSNR2DSelected(1:end-delp,:)+PeakSNR2DSelected(1+delp:end,:))/2);
PhaseNoiseD=sqrt(PhaseVarianceD)/sqrt(nFinalFilter);

for (i=1:1:size(PhaseDiff_Vertical,1))
    [PhaseDiffD_W_TN(i,:),PhaseNoiseD_W_SD(i,:)]=CorrectForPhaseNoise(PhaseDiff_Vertical_MEQ(i,:),PhaseNoiseD(i,:)*nNoiseStdTimes);

end
% 
% SavePhaseDiffB4NoiseD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiff_Vertical_MEQ;
% SavePhaseDiffAfterNoiseD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD_W_TN;
% SavePhaseVarianceD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD;
% SaveAvgSNRD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD;
% SavePhaseNoiseD(:,(n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD_W_SD;

SavePhaseDiffB4NoiseD(:,:)=PhaseDiff_Vertical_MEQ;
SavePhaseDiffAfterNoiseD(:,:)=PhaseDiffD_W_TN;
SavePhaseVarianceD(:,:)=PhaseVarianceD;
SaveAvgSNRD(:,:)=AvgSNRD;
SavePhaseNoiseD(:,:)=PhaseNoiseD_W_SD;
end
