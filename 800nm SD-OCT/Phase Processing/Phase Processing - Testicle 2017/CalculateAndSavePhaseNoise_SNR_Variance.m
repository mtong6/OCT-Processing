function [SavePhaseDiffB4NoiseD1,SavePhaseDiffB4NoiseD2,SavePhaseDiffB4NoiseD3,SavePhaseDiffB4NoiseD4,SavePhaseDiffB4NoiseD5,...
    SavePhaseDiffB4NoiseD6,SavePhaseDiffB4NoiseD7,SavePhaseDiffB4NoiseD8,SavePhaseDiffAfterNoiseD1,SavePhaseDiffAfterNoiseD2,SavePhaseDiffAfterNoiseD3,...
    SavePhaseDiffAfterNoiseD4,SavePhaseDiffAfterNoiseD5,SavePhaseDiffAfterNoiseD6,SavePhaseDiffAfterNoiseD7,SavePhaseDiffAfterNoiseD8,...
    SaveAvgSNRD1,SaveAvgSNRD2,SaveAvgSNRD3,SaveAvgSNRD4,SaveAvgSNRD5,SaveAvgSNRD6,SaveAvgSNRD7,SaveAvgSNRD8,...
     SavePhaseNoiseD1,SavePhaseNoiseD2,SavePhaseNoiseD3,SavePhaseNoiseD4,SavePhaseNoiseD5,SavePhaseNoiseD6,SavePhaseNoiseD7,...
    SavePhaseNoiseD8]=CalculateAndSavePhaseNoise_SNR_Variance(pdLongTraceAllFiltered,FinalMaskEarthQuake,PeakSNR2D,delp,nNoiseStdTimes,nFinalFilter,n,nInitVol,nAlineGap,...
    D1,D2,D3,D4,D5,D6,D7,D8)

% Masum 06162015
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

                FinalMaskEarthQuake=1;
                PhaseDiffD1=pdLongTraceAllFiltered(D1(1),:)-pdLongTraceAllFiltered(D1(1)+delp,:);
                PhaseDiffD1=PhaseDiffD1.*FinalMaskEarthQuake;
                PhaseVarianceD1=(0.5 ./(PeakSNR2D(D1(1),:)))+(0.5 ./(PeakSNR2D(D1(1)+delp,:)));
                PhaseNoiseD1=sqrt(PhaseVarianceD1)/sqrt(nFinalFilter);
                [PhaseDiffD11,PhaseNoiseD11]=CorrectForPhaseNoise(PhaseDiffD1,PhaseNoiseD1*nNoiseStdTimes); 
                AvgSNRD1=10* log10((PeakSNR2D(D1(1),:)+PeakSNR2D((D1(1)+delp),:))/2);

                SavePhaseDiffB4NoiseD1((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD1;
                SavePhaseDiffAfterNoiseD1((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD11;
                SavePhaseVarianceD1((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD1;
                SaveAvgSNRD1((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD1;
                SavePhaseNoiseD1((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD11;

                PhaseDiffD2=pdLongTraceAllFiltered(D2(1),:)-pdLongTraceAllFiltered(D2(1)+delp,:);
                PhaseDiffD2=PhaseDiffD2.*FinalMaskEarthQuake;
                PhaseVarianceD2=(0.5 ./(PeakSNR2D(D2(1),:)))+(0.5 ./(PeakSNR2D(D2(1)+delp,:)));
                PhaseNoiseD2=sqrt(PhaseVarianceD2)/sqrt(nFinalFilter);
                [PhaseDiffD22,PhaseNoiseD22]=CorrectForPhaseNoise(PhaseDiffD2,PhaseNoiseD2*nNoiseStdTimes);
                AvgSNRD2=10* log10((PeakSNR2D(D2(1),:)+PeakSNR2D((D2(1)+delp),:))/2);

                SavePhaseDiffB4NoiseD2((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD2;
                SavePhaseDiffAfterNoiseD2((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD22;
                SavePhaseVarianceD2((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD2;
                SaveAvgSNRD2((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD2;
                SavePhaseNoiseD2((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD22;

                PhaseDiffD3=pdLongTraceAllFiltered(D3(1),:)-pdLongTraceAllFiltered(D3(1)+delp,:);
                PhaseDiffD3=PhaseDiffD3.*FinalMaskEarthQuake;
                PhaseVarianceD3=(0.5 ./(PeakSNR2D(D3(1),:)))+(0.5  ./(PeakSNR2D(D3(1)+delp,:)));
                PhaseNoiseD3=sqrt(PhaseVarianceD3)/sqrt(nFinalFilter);
                [PhaseDiffD33,PhaseNoiseD33]=CorrectForPhaseNoise(PhaseDiffD3,PhaseNoiseD3*nNoiseStdTimes);
                AvgSNRD3=10* log10((PeakSNR2D(D3(1),:)+PeakSNR2D((D3(1)+delp),:))/2);

                SavePhaseDiffB4NoiseD3((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD3;
                SavePhaseDiffAfterNoiseD3((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD33;
                SavePhaseVarianceD3((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD3;
                SaveAvgSNRD3((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD3;
                SavePhaseNoiseD3((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD33;

                PhaseDiffD4=pdLongTraceAllFiltered(D4(1),:)-pdLongTraceAllFiltered(D4(1)+delp,:);
                PhaseDiffD4=PhaseDiffD4.*FinalMaskEarthQuake;
                PhaseVarianceD4=(0.5 ./(PeakSNR2D(D4(1),:)))+(0.5 ./(PeakSNR2D(D4(1)+delp,:)));
                PhaseNoiseD4=sqrt(PhaseVarianceD4)/sqrt(nFinalFilter);
                [PhaseDiffD44,PhaseNoiseD44]=CorrectForPhaseNoise(PhaseDiffD4,PhaseNoiseD4*nNoiseStdTimes);
                AvgSNRD4=10* log10((PeakSNR2D(D4(1),:)+PeakSNR2D((D4(1)+delp),:))/2);

                SavePhaseDiffB4NoiseD4((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD4;
                SavePhaseDiffAfterNoiseD4((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD44;
                SavePhaseVarianceD4((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD4;
                SaveAvgSNRD4((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD4;
                SavePhaseNoiseD4((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD44;

                PhaseDiffD5=pdLongTraceAllFiltered(D5(1),:)-pdLongTraceAllFiltered(D5(1)+delp,:);
                PhaseDiffD5=PhaseDiffD5.*FinalMaskEarthQuake;
                PhaseVarianceD5=(0.5 ./(PeakSNR2D(D5(1),:)))+(0.5 ./(PeakSNR2D(D5(1)+delp,:)));
                PhaseNoiseD5=sqrt(PhaseVarianceD5)/sqrt(nFinalFilter);
                [PhaseDiffD55,PhaseNoiseD55]=CorrectForPhaseNoise(PhaseDiffD5,PhaseNoiseD5*nNoiseStdTimes);
                AvgSNRD5=10* log10((PeakSNR2D(D5(1),:)+PeakSNR2D((D5(1)+delp),:))/2);

                SavePhaseDiffB4NoiseD5((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD5;
                SavePhaseDiffAfterNoiseD5((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD55;
                SavePhaseVarianceD5((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD5;
                SaveAvgSNRD5((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD5;
                SavePhaseNoiseD5((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD55;

                %D6
                PhaseDiffD6=pdLongTraceAllFiltered(D6(1),:)-pdLongTraceAllFiltered(D6(1)+delp,:);
                PhaseDiffD6=PhaseDiffD6.*FinalMaskEarthQuake;
                PhaseVarianceD6=(0.5 ./(PeakSNR2D(D6(1),:)))+(0.5 ./(PeakSNR2D(D6(1)+delp,:)));
                PhaseNoiseD6=sqrt(PhaseVarianceD6)/sqrt(nFinalFilter);
                [PhaseDiffD66,PhaseNoiseD66]=CorrectForPhaseNoise(PhaseDiffD6,PhaseNoiseD6*nNoiseStdTimes);
                AvgSNRD6=10* log10((PeakSNR2D(D6(1),:)+PeakSNR2D((D6(1)+delp),:))/2);

                SavePhaseDiffB4NoiseD6((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD6;
                SavePhaseDiffAfterNoiseD6((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD66;
                SavePhaseVarianceD6((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD6;
                SaveAvgSNRD6((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD6;
                SavePhaseNoiseD6((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD66;
                %D7
                PhaseDiffD7=pdLongTraceAllFiltered(D7(1),:)-pdLongTraceAllFiltered(D7(1)+delp,:);
                PhaseDiffD7=PhaseDiffD7.*FinalMaskEarthQuake;
                PhaseVarianceD7=(0.5 ./(PeakSNR2D(D7(1),:)))+(0.5 ./(PeakSNR2D(D7(1)+delp,:)));
                PhaseNoiseD7=sqrt(PhaseVarianceD7)/sqrt(nFinalFilter);
                [PhaseDiffD77,PhaseNoiseD77]=CorrectForPhaseNoise(PhaseDiffD7,PhaseNoiseD7*nNoiseStdTimes);
                AvgSNRD7=10* log10((PeakSNR2D(D7(1),:)+PeakSNR2D((D7(1)+delp),:))/2);

                SavePhaseDiffB4NoiseD7((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD7;
                SavePhaseDiffAfterNoiseD7((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD77;
                SavePhaseVarianceD7((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD7;
                SaveAvgSNRD7((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD7;
                SavePhaseNoiseD7((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD77;

                %D8
                PhaseDiffD8=pdLongTraceAllFiltered(D8(1),:)-pdLongTraceAllFiltered(D8(1)+delp,:);
                PhaseDiffD8=PhaseDiffD8.*FinalMaskEarthQuake;
                PhaseVarianceD8=(0.5 ./(PeakSNR2D(D8(1),:)))+(0.5 ./(PeakSNR2D(D8(1)+delp,:)));
                PhaseNoiseD8=sqrt(PhaseVarianceD8)/sqrt(nFinalFilter);
                [PhaseDiffD88,PhaseNoiseD88]=CorrectForPhaseNoise(PhaseDiffD8,PhaseNoiseD8*nNoiseStdTimes);
                AvgSNRD8=10* log10((PeakSNR2D(D8(1),:)+PeakSNR2D((D8(1)+delp),:))/2);

                SavePhaseDiffB4NoiseD8((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD8;
                SavePhaseDiffAfterNoiseD8((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseDiffD88;
                SavePhaseVarianceD8((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseVarianceD8;
                SaveAvgSNRD8((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=AvgSNRD8;
                SavePhaseNoiseD8((n-nInitVol)*100*(1024-nAlineGap)+1:(n-nInitVol+1)*100*(1024-nAlineGap))=PhaseNoiseD88;
end