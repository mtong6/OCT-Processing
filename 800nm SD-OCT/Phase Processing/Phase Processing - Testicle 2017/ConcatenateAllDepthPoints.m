function[PhaseDiffB4Noise_all]=ConcatenateAllDepthPoints(D1,D2,D3,D4,D5,D6,D7,D8,SavePhaseDiffAfterNoiseD,nDepthRange)
%Masum 07072015

PhaseDiffB4Noise1=SavePhaseDiffAfterNoiseD(D1-nDepthRange:D1+nDepthRange,:);
PhaseDiffB4Noise2=SavePhaseDiffAfterNoiseD(D2-nDepthRange:D2+nDepthRange,:);
PhaseDiffB4Noise3=SavePhaseDiffAfterNoiseD(D3-nDepthRange:D3+nDepthRange,:);
PhaseDiffB4Noise4=SavePhaseDiffAfterNoiseD(D4-nDepthRange:D4+nDepthRange,:);
PhaseDiffB4Noise5=SavePhaseDiffAfterNoiseD(D5-nDepthRange:D5+nDepthRange,:);
PhaseDiffB4Noise6=SavePhaseDiffAfterNoiseD(D6-nDepthRange:D6+nDepthRange,:);
PhaseDiffB4Noise7=SavePhaseDiffAfterNoiseD(D7-nDepthRange:D7+nDepthRange,:);
PhaseDiffB4Noise8=SavePhaseDiffAfterNoiseD(D8-nDepthRange:D8+nDepthRange,:);

PhaseDiffB4Noise_all=cat(1,PhaseDiffB4Noise1,PhaseDiffB4Noise2,PhaseDiffB4Noise3,PhaseDiffB4Noise4,PhaseDiffB4Noise5,...
     PhaseDiffB4Noise6,PhaseDiffB4Noise7,PhaseDiffB4Noise8);


% PhaseDiffB4Noise_all=cat(1,PhaseDiffB4Noise7);

%     PhaseDiffB4Noise_all=cat(1,PhaseDiffB4Noise1,PhaseDiffB4Noise2,PhaseDiffB4Noise3,PhaseDiffB4Noise4);

%    PhaseDiffB4Noise_all=cat(1,PhaseDiffB4Noise5,PhaseDiffB4Noise6,PhaseDiffB4Noise7,PhaseDiffB4Noise8);

end
