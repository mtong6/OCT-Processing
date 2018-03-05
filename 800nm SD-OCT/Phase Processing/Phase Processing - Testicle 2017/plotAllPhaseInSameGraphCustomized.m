function []=plotAllPhaseInSameGraphCustomized( InputPhase,D1,D2,D3,nStartingFrame,nDepthRange)
% Masum 06232015
nNumberOfFrameToBeplotted=1;
InputPhase=InputPhase(:,:,nStartingFrame:nStartingFrame+nNumberOfFrameToBeplotted);
InputPhase1=reshape(InputPhase, size(InputPhase,1), size(InputPhase,2)*size(InputPhase,3));

PhaseRS=InputPhase1(D1-nDepthRange:D1+nDepthRange,:);
% PhaseRS2=InputPhase1(D2,:);
% PhaseRS3=InputPhase1(D3,:);
% PhaseRS12=cat(1,PhaseRS1,PhaseRS2);
% PhaseRS=cat(1,PhaseRS12,PhaseRS3);

TimeStamp=(((nStartingFrame-1)*size(InputPhase,2))+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(InputPhase,2))*0.1;

figure();

for i = 1:size(PhaseRS,1)-1;
    PhaseVector= PhaseRS(i,:);

    subplot(size(PhaseRS,1), 1, i), plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);ylim([-pi, pi]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)+100]);

    %     xlim ([1 1024]);
    %     ylim([-300 300]);
    %     if( i==1)
    %         title(['Image Number = ',num2str(Segment),' and Depth Points = ',num2str(D1(1)), ' to ', num2str(D1(end))]);
    %     end
end

subplot(size(PhaseRS,1), 1, size(PhaseRS,1)), plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);ylim([-pi, pi]);
% set(gca, 'layer', 'bottom','box', 'off');
xlim([ min(TimeStamp),max(TimeStamp)+100]);
% set(gca,'ycolor',[1 1 1]);
hold on;
plot([2900; 2900], [1; 3], '-k',  'LineWidth', 2);
hold off;


end