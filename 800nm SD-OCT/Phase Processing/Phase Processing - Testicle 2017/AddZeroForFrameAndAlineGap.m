function[FinalMaskEarthQuake1D]=AddZeroForFrameAndAlineGap(FinalMaskEarthQuake,nAlineGap,nAlineNumber,nFrameNumber)

%% Parameters
nGapBetnFrame=517 *3;  % 51.7 ms
nAddedZerosForGap=zeros(1,nGapBetnFrame);
nAddedZerosForAlineGap=zeros(1,nAlineGap+1);
nAppendedGapForEachFrame=cat(2,nAddedZerosForAlineGap,nAddedZerosForGap);

%% Add zero

FinalMaskEarthQuake2D=reshape(FinalMaskEarthQuake,[nAlineNumber-nAlineGap,nFrameNumber]);
FinalMaskEarthQuake2D=FinalMaskEarthQuake2D';
FinalMaskEarthQuake2D=cat(2,FinalMaskEarthQuake2D,repmat(nAppendedGapForEachFrame,[nFrameNumber,1]));

FinalMaskEarthQuake2D=FinalMaskEarthQuake2D';

FinalMaskEarthQuake1D=reshape(FinalMaskEarthQuake2D,[ 1,size(FinalMaskEarthQuake2D,1)*size(FinalMaskEarthQuake2D,2)]);



end