function []=plotAllPhaseInSameGraph( InputPhase,nFrametoBePloted,TitleOfGraph)
% Masum 06222015
% InputPhase=squeeze(InputPhase(:,:,nFrametoBePloted));


YlimMax=pi;
YlimMin=-pi;

PhaseRS=InputPhase;

figure();
nRow=size(InputPhase,1);
   PhaseVector= PhaseRS(1,:);
    subplot(nRow, 1, 1), plot(PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(1)]);axis tight;
    title(TitleOfGraph); set(gca, 'layer', 'bottom','box', 'off');ylim([YlimMin,YlimMax]);



for i = 2:nRow                     %i = 1:size(PhaseRS,1)
    PhaseVector= PhaseRS(i,:);

%     subplot(size(PhaseRS,1), 1, i), plot(PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    subplot(nRow, 1, i), plot(PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);axis tight; 
     set(gca, 'layer', 'bottom','box', 'off');set(gca,'xcolor',[1 1 1]);ylim([YlimMin,YlimMax]);
%      axis off;

end

end