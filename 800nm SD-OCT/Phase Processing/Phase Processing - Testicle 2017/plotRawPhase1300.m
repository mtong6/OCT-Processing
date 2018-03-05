function []=plotRawPhase1300(InputPhase,D1,nStartingFrame,nDepthRange,nVolNumber)
% Masum 082115

nMinY=-4;
nMaxY=4;
nNumberOfFrameToBeplotted=0;
InputPhase=InputPhase(:,:,nStartingFrame:nStartingFrame+nNumberOfFrameToBeplotted);
InputPhase1=reshape(InputPhase, size(InputPhase,1), size(InputPhase,2)*size(InputPhase,3));

PhaseRS=InputPhase1(D1-nDepthRange:D1+nDepthRange,:);

TimeStamp=(((nStartingFrame-1)*size(InputPhase,2))+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(InputPhase,2))*(0.1/3);

figure();

for i = 1:size(PhaseRS,1)-1;
    PhaseVector= PhaseRS(i,:);

    subplot(size(PhaseRS,1), 1, i), plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);ylim([nMinY, nMaxY]);
%     set(gca, 'Visible', 'off');
    xlim([ min(TimeStamp),max(TimeStamp)]);title([' V: ',num2str(nVolNumber),' , Frame Num: ', num2str(nStartingFrame)]);

end

subplot(size(PhaseRS,1), 1, size(PhaseRS,1)), plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);ylim([nMinY, nMaxY]);
% set(gca, 'layer', 'bottom','box', 'off');
xlim([ min(TimeStamp),max(TimeStamp)]);xlabel('time(ms)')
% set(gca,'ycolor',[1 1 1]);
% hold on;
% plot([max(TimeStamp); max(TimeStamp)], [1; 3], '-k',  'LineWidth', 2);
% hold off;






end