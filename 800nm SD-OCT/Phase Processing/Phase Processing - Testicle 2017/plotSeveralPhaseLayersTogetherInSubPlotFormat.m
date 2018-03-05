
function []=plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseRS,TimeStamp,TitleOfGraph,EP)
%Masum 06242015

YlimMin=-pi;
YlimMax=pi;

YlimMin_EP=-100;
YlimMax_EP=100;

lev = 0.3;

figure();


subaxis(size(PhaseRS,1)+13, 1, 1,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
plot([max(TimeStamp); max(TimeStamp)], [0; 1], '-k',  'LineWidth', 2);

title(TitleOfGraph);
% axis tight;
xlim([ min(TimeStamp),max(TimeStamp)]);title(TitleOfGraph);ylim([YlimMin YlimMax]);
axis off;

PhaseVector= PhaseRS(1,:);
% Find points above the level
aboveLine = (abs(PhaseVector)<lev);
% Create 2 copies of y
bottomLine = PhaseVector;
topLine = PhaseVector;
% Set the values you don't want to get drawn to nan
bottomLine(aboveLine) = NaN;
topLine(~aboveLine) = NaN;

subaxis(size(PhaseRS,1)+13, 1, 2,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
plot(TimeStamp,bottomLine, 'r' ,TimeStamp,topLine, 'k');

xlim([ min(TimeStamp),max(TimeStamp)]);
ylim([YlimMin YlimMax]);
set(gca,'xcolor',[1 1 1],'ycolor',[1 1 1]);
hold off;
% axis tight;
axis off;

for i = 2:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:);
    % Find points above the level
    aboveLine = (abs(PhaseVector)<lev);
    % Create 2 copies of y
    bottomLine = PhaseVector;
    topLine = PhaseVector;
    % Set the values you don't want to get drawn to nan
    bottomLine(aboveLine) = NaN;
    topLine(~aboveLine) = NaN;

    subaxis(size(PhaseRS,1)+13, 1, i+1,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
    plot(TimeStamp,bottomLine, 'r' ,TimeStamp,topLine, 'k');
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    % axis tight;
    axis off;

end


subaxis(size(PhaseRS,1)+13, 1, size(PhaseRS,1)+2,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),  plot([max(TimeStamp); max(TimeStamp)], [0; 100], '-k',  'LineWidth', 2);
xlim([ min(TimeStamp),max(TimeStamp)]);
axis off;ylim([YlimMin_EP, YlimMax_EP]);



subaxis(size(PhaseRS,1)+13, 1,size(PhaseRS,1)+3:size(PhaseRS,1)+13,'Spacing', 0, 'Padding', 0, 'Margin', 0.1), plot(TimeStamp,EP, 'k', 'LineWidth', 2);
ylim([YlimMin_EP, YlimMax_EP]);
hold on;
set(gca, 'layer', 'bottom','box', 'off');
xlim([ min(TimeStamp),max(TimeStamp)]);
set(gca,'ycolor',[1 1 1]);

hold off;
% axis tight;



%% Customization
%{
%%%
figure();
% subaxis(211,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
subplot(211),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:);

     plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
   hold on;
% axis tight;
  axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [2; 3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;

% subaxis(212,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),
subplot(212),
 plot(TimeStamp,EP, 'k', 'LineWidth', 2);
hold on;
set(gca, 'layer', 'bottom','box', 'off');
xlim([ min(TimeStamp),max(TimeStamp)]);
set(gca,'ycolor',[1 1 1]); ylim([YlimMin_EP, YlimMax_EP]);

 plot([max(TimeStamp); max(TimeStamp)], [50; 100], '-k',  'LineWidth', 2);
    xlim([ min(TimeStamp),max(TimeStamp)]);ylim([YlimMin_EP, YlimMax_EP]);

hold off;


%}

end