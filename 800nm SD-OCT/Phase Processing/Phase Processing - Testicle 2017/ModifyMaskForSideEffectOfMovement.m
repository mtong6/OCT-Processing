function [FinalMaskEarthQuake_MadeZeroNearMovement]=ModifyMaskForSideEffectOfMovement(MaskEarthquake2D,nAlineGap,nFrameNumber,nAlineNumber,nMaskFilter)
% Masum 06162015

% Explanation why  masking of mask again?
%{
         To make sure that if there is any movement in BulkMotionCorrPhase(:,nAlineGap+1:end,:),
         or BulkMotionCorrPhase(:,1:end-nAlineGap,:), final mask must count it.

%}

MaskEarthquake22D=MaskEarthquake2D(:,nAlineGap+1:end).*MaskEarthquake2D(:,1:end-nAlineGap);
% make the mask 1D
for(d=1:1:nFrameNumber)
    FinalMaskEarthQuake((d-1)*(nAlineNumber-nAlineGap)+1:(nAlineNumber-nAlineGap)*d)= MaskEarthquake22D(d,:);
end
%{
        There is a possibility of movement of A lines nearby the movement
        of a Aline. So make the mask value zero nearby Alines according to
         mask filter size
%}

%         c = clock;fix(c)
FinalMaskEarthQuake_MadeZeroNearMovement=FinalMaskEarthQuake;

l=length(FinalMaskEarthQuake);
for(p=nMaskFilter+1:1:l-nMaskFilter)
    if(FinalMaskEarthQuake(p)==0)

        FinalMaskEarthQuake_MadeZeroNearMovement(p-nMaskFilter:p+nMaskFilter)=0;
    end
end

% figure, subplot(211), plot(FinalMaskEarthQuake); title(['FinalMaskEarthQuake:  ', num2str(sum(FinalMaskEarthQuake))]);
% subplot(212), plot(FinalMaskEarthQuake_MadeZeroNearMovement);
% title(['FinalMaskEarthQuake-MadeZeroNearMovement:  ',num2str(sum(FinalMaskEarthQuake_MadeZeroNearMovement))]);
% %         fix(c)

end