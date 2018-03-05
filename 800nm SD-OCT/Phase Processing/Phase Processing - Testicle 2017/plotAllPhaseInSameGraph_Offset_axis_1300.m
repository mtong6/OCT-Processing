function []=plotAllPhaseInSameGraph_Offset_axis_1300( SavePhaseDiffAfterNoiseD,tStart,tEnd,EP,title,nMEADataAcquisitionSpeed,nOCTDataAcquisitionSpeed,nAlineGap,nFinalFilter,delp,nVolNumber,dSNRThreshold_forMask)
% Masum 08212015
%% parameter settings
YlimMin=-pi/8;
YlimMax=pi/8;
nColorcode=0.8;
lev=0.01;
YlimMin_EP=-200;
YlimMax_EP=200;
nOffset=-0.3;

PhaseRS=SavePhaseDiffAfterNoiseD;


%% to plot phase data in separate lines

h(1)=figure();

subaxis(80,1,1:9,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),

% subplot(80,1,1:5)
plot(TimeStampEP,EP, 'k', 'LineWidth', 2);ylim([YlimMin_EP, YlimMax_EP]);
hold on;
plot([max(TimeStampEP); max(TimeStamp)], [50; 100], '-k',  'LineWidth', 2);
set(gca, 'layer', 'bottom','box', 'off');xlim([min(TimeStamp),max(TimeStamp)]);
set(gca,'ycolor',[1 1 1]); set(gca,'xcolor',[1 1 1]);
% title([' V: ',num2str(nVolNumber),' AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),...
%     '  STh:',num2str(dSNRThreshold_forMask)]);
% title([' AGap: ', num2str(nAlineGap),' FS: ', num2str(nFinalFilter), '  DP: ', num2str(delp)]);

hold off;
% axis off;


subaxis(80,1,10:73,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
%  subplot(80,1,6:80),
a=0;
for i = 1:size(PhaseRS,1);
    PhaseVector=PhaseRS(i,:);
    % Find points above the level
    aboveLine = (abs(PhaseVector)<lev);
    % Create 2 copies of y
    bottomLine = PhaseVector;
    topLine = PhaseVector;
    % Set the values you don't want to get drawn to nan
    bottomLine(aboveLine) = NaN;
    topLine(~aboveLine) = NaN;


    %     plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
%       plot(TimeStamp,a+bottomLine,'r',TimeStamp,a+topLine,'k');
      plot(TimeStamp,a+bottomLine,'color', [0 0 0 ]); hold on;
      plot(TimeStamp,a+topLine,'color', [nColorcode nColorcode nColorcode ]);
%     plot(TimeStamp,a+bottomLine,'Color',[0.5,0.5,0.5],TimeStamp,a+topLine,'Color',[0,0,0]);
    xlim([ min(TimeStamp),max(TimeStamp)]);
    hold on;    axis off;

    a=a+nOffset;
end
plot([max(TimeStamp); max(TimeStamp)], [0.1; 0.2], '-k',  'LineWidth', 2);
hold off;


%% to plot all phases in same line
subaxis(80,1,74:80,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),

for j = 1:size(PhaseRS,1);
    PhaseVector2= PhaseRS(j,:);

    % Find points above the level
    aboveLine = (abs(PhaseVector2)<lev);
    % Create 2 copies of y
    bottomLine = PhaseVector2;
    topLine = PhaseVector2;
    % Set the values you don't want to get drawn to nan
    bottomLine(aboveLine) = NaN;
    topLine(~aboveLine) = NaN;

%     plot(TimeStamp,bottomLine,'r',TimeStamp,topLine,'k');
          plot(TimeStamp,bottomLine,'color', [0 0 0 ]); hold on;
      plot(TimeStamp,topLine,'color', [nColorcode nColorcode nColorcode ]);
    
    xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    set(gca, 'layer', 'bottom','box', 'off');
    set(gca,'ycolor',[1 1 1]); hold on;

end

plot([max(TimeStamp); max(TimeStamp)], [0.1; 0.2], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


% saveas(h(1),sprintf('Fig %d nAlineGap %d  nFinalFilter %d delp %d and_Volume %d .bmp',1,nAlineGap,nFinalFilter,delp,nVolNumber));



end