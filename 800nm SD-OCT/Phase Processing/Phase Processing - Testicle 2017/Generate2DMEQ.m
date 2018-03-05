function [MaskEarthquake2D]=Generate2DMEQ(MaskEartquake,nFrameNumber,nAlineNumber,nStartingFrame);
%Masum 08272015

%{
     Initally 0 means no movement, not 0 means movement.Now convert no movement to 1 & movement to  0.This matrix will be used to suppress any kind of movement.
%}


% Play with MEQ
%      PlayWithMaskEarthQuake(MaskEartquake,nAlineNumber,nStartingFrame);

MaskEartquake(find (MaskEartquake==0))=100;
MaskEartquake(find (MaskEartquake<100))=0;
MaskEartquake(find (MaskEartquake==100))=1;
% figure, plot(MaskEartquake); title(' only 0(move) & 1(no move)');

MaskEarthquake2D=reshape(MaskEartquake,[nAlineNumber,nFrameNumber]);
MaskEarthquake2D=MaskEarthquake2D';

end