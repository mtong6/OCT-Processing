
function[]=plotPhaseBeforeAndAfterBulkMotionCorr(nAlineGap,DelPhaseBulkMotionCorrPhase,pdPeakPhase,nAlineNumber,FinalMaskEarthQuake)
% Masum 06 21 2015
% Select starting layer number
StartingLayerNo=50;
SelectFrameNumber=3;
nTotalNumberOfPhaseTobePlot=10;
cc=lines(12);

% BeforeBulkMoitionCorrection=pdPeakPhase(:,nAlineGap+1:end,:)  - pdPeakPhase(:,1:end-nAlineGap,:);
BeforeBulkMoitionCorrection=pdPeakPhase(:,1+1:end,:)  - pdPeakPhase(:,1:end-1,:);
BeforeBulkMoitionCorrection=ConfinePhaseInBetweenPiAndMinusPi(BeforeBulkMoitionCorrection);

figure,
 for (i=1:1:nTotalNumberOfPhaseTobePlot)
 subplot(211),plot(BeforeBulkMoitionCorrection(StartingLayerNo+i,:,SelectFrameNumber),'color',cc(i,:)); title('Before Bulk Moition Correction'); hold on;
subplot(212),plot(DelPhaseBulkMotionCorrPhase(StartingLayerNo+i,:,SelectFrameNumber)... 
     .*FinalMaskEarthQuake((SelectFrameNumber-1)*(nAlineNumber-nAlineGap)+1:(nAlineNumber-nAlineGap)*SelectFrameNumber),'color',cc(i,:) ); 
title('After Bulk Moition Correction'); hold on;

 end
 hold off;
 
%   figure,
%  for (j=1:1:nTotalNumberOfPhaseTobePlot)
% plot(DelPhaseBulkMotionCorrPhase(StartingLayerNo+j,:,SelectFrameNumber));title('After Bulk Moition Correction');hold on;
%  end
%  hold off;
%  
 

end