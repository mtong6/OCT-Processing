
function []=plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseRS,TheoryticalNoise,TimeStamp,TitleOfGraph,EP)  %#ok<FNDEF>
%Masum 06242015

YlimMin=-.5;
YlimMax=.5;

figure();



subaxis(size(PhaseRS,1)+4, 1, 1,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),plot([max(TimeStamp); max(TimeStamp)], [0; 0.5], '-k',  'LineWidth', 2);title(TitleOfGraph);
xlim([ min(TimeStamp),max(TimeStamp)]);ylim([YlimMin YlimMax]);
axis off;


PhaseVector= PhaseRS(1,:);
PhaseVector2=TheoryticalNoise(1,:);
subaxis(size(PhaseRS,1)+4, 1, 2,'Spacing', 0, 'Padding', 0, 'Margin', 0.1), plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(1)]);
hold on;
plot(TimeStamp,PhaseVector2, 'r', 'LineWidth', .5);hold on;plot(TimeStamp,-PhaseVector2, 'r', 'LineWidth', 0.5);
ylim([YlimMin YlimMax]);xlim([ min(TimeStamp),max(TimeStamp)]);


hold off;
% axis tight;
axis off;

for i = 2:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:);
    PhaseVector2=TheoryticalNoise(i,:);
    subaxis(size(PhaseRS,1)+4, 1, i+1,'Spacing', 0, 'Padding', 0, 'Margin', 0.1), plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    hold on;
    plot(TimeStamp,PhaseVector2, 'r', 'LineWidth', .5);hold on;plot(TimeStamp,-PhaseVector2, 'r', 'LineWidth', 0.5);
    ylim([YlimMin YlimMax]);
    %     set(gca, 'Visible', 'off');
    xlim([ min(TimeStamp),max(TimeStamp)]);
%     axis tight;
    axis off;

    
        % for scale bar
    subaxis(size(PhaseRS,1)+4, 1, size(PhaseRS,1)+2,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),  plot([max(TimeStamp); max(TimeStamp)], [0; 100], '-k',  'LineWidth', 2);
    xlim([ min(TimeStamp),max(TimeStamp)]);
    axis off;
    
      % for EP
    subaxis(size(PhaseRS,1)+4, 1, size(PhaseRS,1)+3:size(PhaseRS,1)+4,'Spacing', 0, 'Padding', 0, 'Margin', 0.1), plot(TimeStamp,EP, 'k', 'LineWidth', 2);
    hold on;
    set(gca, 'layer', 'bottom','box', 'off');
    xlim([ min(TimeStamp),max(TimeStamp)]);
    set(gca,'ycolor',[1 1 1]);
%     axis tight;






end



end