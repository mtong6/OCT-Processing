function []=plotAllPhaseInSameGraph_Offset_axis_1300_fullEP( PhaseRS,tStart,tEnd,EP,title,...
    nMEADataAcquisitionSpeed,nOCTDataAcquisitionSpeed,nAlineGap,nFinalFilter,delp,nVolNumber,dSNRThreshold_forMask)
% Masum 08212015
%% parameter settings
YlimMin=-.2;
YlimMax=.2;
nColorcode=0.1;
lev=0.01;
YlimMin_EP=-200;
YlimMax_EP=200;
nOffset=-0.3;

  PhaseRS(PhaseRS==0)=NaN;

%% Add zero with phase data
nGapBetnFrame=517 *3;  % 51.7 ms
nAddedZerosForGap=zeros(1,nGapBetnFrame);
nAddedZerosForAlineGap=zeros(1,nAlineGap+1);
nAppendedGapForEachFrame=cat(2,nAddedZerosForAlineGap,nAddedZerosForGap);
Zero3D= repmat(nAppendedGapForEachFrame,[size(PhaseRS,1) 1 100]);
Phase3D=reshape(PhaseRS,[size(PhaseRS,1),size(PhaseRS,2)/100,100]);
PhaseWithZero=cat(2,Phase3D,Zero3D);
Phase2D=reshape(PhaseWithZero,[size(PhaseWithZero,1),(size(PhaseRS,2)/100+size(Zero3D,2))*100]);

%% Plot
figure();
subplot(80,1,1:10),plot((1:length(EP))/nMEADataAcquisitionSpeed,EP);axis tight;
axis off;

subplot(80,1,11:70)
a=0;
for i = 1:size(Phase2D,1)-1;
    plot((1:length(Phase2D(1,:)))/nOCTDataAcquisitionSpeed,a+Phase2D(i,:),'k');hold on;
    a=a+nOffset;
end
plot((1:length(Phase2D(1,:)))/nOCTDataAcquisitionSpeed,a+Phase2D(i+1,:));
%  axis tight;
set(gca, 'layer', 'bottom','box', 'off');axis off;
xlim([1/nOCTDataAcquisitionSpeed,length(Phase2D(1,:))/nOCTDataAcquisitionSpeed]);set(gca,'ycolor',[1 1 1]);
hold off;

%% All phase in a line
for j = 1:size(Phase2D,1);
    subplot(80,1,71:80),
    plot((1:length(Phase2D(1,:)))/nOCTDataAcquisitionSpeed,a+Phase2D(j,:),'k');hold on;

end
set(gca, 'layer', 'bottom','box', 'off');set(gca,'ycolor',[1 1 1]);
hold off;

%%  plot phase data in separate lines for different color

%{

h(1)=figure();

% subaxis(80,1,1:9,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
subplot(80,1,1:9),

plot(EP, 'k', 'LineWidth', 2);ylim([YlimMin_EP, YlimMax_EP]);

set(gca,'ycolor',[1 1 1]); set(gca,'xcolor',[1 1 1]);
hold off;
% axis off;


% subaxis(80,1,10:73,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
subplot(80,1,10:80),
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

    %     plot(a+bottomLine,'color', [0 0 0 ]); hold on;
    %     plot(a+topLine,'color', [nColorcode nColorcode nColorcode ]);
    %     hold off;    axis off;

    plot(a+bottomLine); hold on;
    plot(a+topLine);
    hold off;    axis off;
    a=a+nOffset;
end



%% to plot all phases in same line
% subaxis(80,1,74:80,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
subplot(80,1,74:80),
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
    %     plot(bottomLine,'color', [0 0 0 ]); hold on;
    %     plot(topLine,'color', [nColorcode nColorcode nColorcode ]);

    plot(bottomLine); hold on;
    plot(topLine);

    set(gca, 'layer', 'bottom','box', 'off');
    set(gca,'ycolor',[1 1 1]); hold off;

end

%}
end