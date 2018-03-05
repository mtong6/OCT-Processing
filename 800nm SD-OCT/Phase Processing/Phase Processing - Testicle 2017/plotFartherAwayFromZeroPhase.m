function[HighestPhaseVector,EP]=plotFartherAwayFromZeroPhase(SavePhaseDiffAfterNoiseD,tStart,tEnd,EP,nAlineGap,nFinalFilter,delp,nVolNumber,dSNRThreshold_forMask,CreateNewFolder)
%Masum 08122015
%update 08262015

YlimMin=-pi/8;
YlimMax=pi/8;
YlimMin_EP=-200;
YlimMax_EP=400;
nLinewidth=0.5;

SelectedEPPointsEP=(tStart:tEnd);
TimeStampEP=(tStart:1:tEnd)/10000;

SelectedOCTPoints=((tStart*3)-2:tEnd*3);
size(SelectedOCTPoints)
% EP=EP(:,SelectedEPPointsEP);
TimeStamp=(SelectedOCTPoints)/30000;
SavePhaseDiffAfterNoiseD=SavePhaseDiffAfterNoiseD(:,SelectedOCTPoints);
HighestPhaseVector=zeros(1,size(SavePhaseDiffAfterNoiseD,2));


for(nRownumber=1:size(SavePhaseDiffAfterNoiseD,1))
    Phasevector=SavePhaseDiffAfterNoiseD(nRownumber,:);

    for(i=1:size(SavePhaseDiffAfterNoiseD,2))
        if(abs(Phasevector(i))>abs(HighestPhaseVector(i)))
            HighestPhaseVector(i)=Phasevector(i);
        end

    end %(i=1:size(SavePhaseDiffAfterNoiseD,2))
end  %for(nRownumber=1:size(SavePhaseDiffAfterNoiseD,1)

% size(HighestPhaseVector)
% size(EP)
% size(TimeStamp)

HighestPhaseVector(find(HighestPhaseVector==0))=NaN;

figure, plot(TimeStamp,HighestPhaseVector);
% 
% h=figure; 
% subplot(211),plot(TimeStamp,HighestPhaseVector,'k', 'LineWidth', nLinewidth);ylim([YlimMin,YlimMax]);xlim([min(TimeStamp),max(TimeStamp)]);
% hold on;plot([max(TimeStamp); max(TimeStamp)], [2; 3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
% title([' V: ',num2str(nVolNumber),' AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),...
%     '  STh:',num2str(dSNRThreshold_forMask)]);
% set(gca, 'layer', 'bottom','box', 'off');
% hold off;
% % axis off;
% 
% subplot(212),
% plot(TimeStampEP,EP, 'k', 'LineWidth', nLinewidth);ylim([YlimMin_EP, YlimMax_EP]);
% hold on;
% plot([max(TimeStampEP); max(TimeStampEP)], [50; 100], '-k',  'LineWidth', 2);
%  set(gca, 'layer', 'bottom','box', 'off');
% xlim([min(TimeStampEP),max(TimeStampEP)]);
% % set(gca,'ycolor',[1 1 1]);
% hold off;
% % Save figure.

%   saveas(h,fullfile(CreateNewFolder,sprintf('Fig %d nAlineGap %d  nFinalFilter %d delp %d and_Volume %d .png',1,nAlineGap,nFinalFilter,delp,nVolNumber)));
%  close all;

end

