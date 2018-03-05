function[Phase2D]=CutOffFromInitialAndLastPoints(SavePhaseDiffAfterNoiseD,nFrameNumber,nCutoffThrPooints,nAlineGap)
%Masum 09152015
%Explanation
% 1. make zero for 1st and last few points
% 2. Add zero for A line Gaps and Time gap between 2 frames

%% Parameters
nGapBetnFrame=517 *3;  % 51.7 ms
nAddedZerosForGap=zeros(1,nGapBetnFrame);
nAddedZerosForAlineGap=zeros(1,nAlineGap+1);
nAppendedGapForEachFrame=cat(2,nAddedZerosForAlineGap,nAddedZerosForGap);

%% Detail calculation 

Phase3D=reshape(SavePhaseDiffAfterNoiseD,size(SavePhaseDiffAfterNoiseD,1),size(SavePhaseDiffAfterNoiseD,2)/nFrameNumber,nFrameNumber);

% Phase3D(:,1:nCutoffThrPooints,:)=0;
% Phase3D(:,end-nCutoffThrPooints+1:end,:)=0;

Phase3D=cat(2,Phase3D,repmat(nAppendedGapForEachFrame,[size(Phase3D,1),1,size(Phase3D,3)]));
Phase2D=reshape(Phase3D,size(Phase3D,1),size(Phase3D,2)*size(Phase3D,3));


end