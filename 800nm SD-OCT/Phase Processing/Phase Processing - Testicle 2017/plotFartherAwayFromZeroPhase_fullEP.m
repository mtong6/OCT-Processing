function[HighestPhase1D]=plotFartherAwayFromZeroPhase_fullEP(SavePhaseDiffAfterNoiseD,tStart,tEnd,EP,nAlineGap,nFinalFilter,delp,nVolNumber,dSNRThreshold_forMask,CreateNewFolder)
%Masum 08302015
%% Parameters
nGapBetnFrame=517 *3;  % 51.7 ms
nAddedZerosForGap=zeros(1,nGapBetnFrame);
nAddedZerosForAlineGap=zeros(1,nAlineGap+1);
nAppendedGapForEachFrame=cat(2,nAddedZerosForAlineGap,nAddedZerosForGap);

YlimMin=-pi/8;
YlimMax=pi/8;
YlimMin_EP=-200;
YlimMax_EP=400;
nLinewidth=0.5;


HighestPhaseVector=zeros(1,size(SavePhaseDiffAfterNoiseD,2));

%% Take only highest Phase value from a row


for(nRownumber=1:size(SavePhaseDiffAfterNoiseD,1))
    Phasevector=SavePhaseDiffAfterNoiseD(nRownumber,:);

    for(i=1:size(SavePhaseDiffAfterNoiseD,2))
        if(abs(Phasevector(i))>abs(HighestPhaseVector(i)))
            HighestPhaseVector(i)=Phasevector(i);
        end

    end %(i=1:size(SavePhaseDiffAfterNoiseD,2))
end  %for(nRownumber=1:size(SavePhaseDiffAfterNoiseD,1)

HighestPhaseVector(find(HighestPhaseVector==0))=NaN;
% figure,
% subplot(212), plot(HighestPhaseVector); title('HighestPhaseVector');


HighestPhase=reshape(HighestPhaseVector,[size(HighestPhaseVector,2)/100,100]);
HighestPhase=HighestPhase';
HighestPhase=cat(2,HighestPhase,repmat(nAppendedGapForEachFrame,[size(HighestPhase,1),1]));
HighestPhase=HighestPhase';
HighestPhase1D=reshape(HighestPhase,[1,size(HighestPhase,1)*size(HighestPhase,2)]);



%% for plotting

% subplot(212),plot(HighestPhase1D);title('HighestPhase1D');
% 
% h=figure;
% subplot(211),plot((1:length(EP))/10000,EP);
% title([' V: ',num2str(nVolNumber),' AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),...
%     '  STh:',num2str(dSNRThreshold_forMask)]);
% axis tight;
% subplot(212),plot((1:length(HighestPhase1D))/30000,HighestPhase1D);title('HighestPhase1D');axis tight;
% 
% 

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

%   saveas(h,fullfile(CreateNewFolder,sprintf('nAlineGap %d  nFinalFilter %d delp %d and SNR Thr %d .png',nAlineGap,nFinalFilter,delp,dSNRThreshold_forMask)));
%  close all;

end

