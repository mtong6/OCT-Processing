function []=plotAllPhaseInSameGraph_Offset_axis( SavePhaseDiffAfterNoiseD,tStart,tEnd,EP,title)
% Masum 07282018
%% parameter settings
YlimMin=-pi;
YlimMax=pi;
nColorcode=0.8;
lev=0.1;
YlimMin_EP=-100;
YlimMax_EP=100;
nOffset=-0.8;

SelectedEPPointsEP=(tStart:tEnd);
TimeStampEP=(tStart:1:tEnd)/10000;

% disp('SelectedEPPointsEP) :');size(SelectedEPPointsEP)
% disp('size(TimeStampEP) :');size(TimeStampEP)
% figure, plot(TimeStampEP);

SelectedEPPoints=(tStart:tEnd*3);
% size(SelectedEPPoints)

EP=EP(:,SelectedEPPointsEP);
% figure, plot(TimeStampEP,EP);

TimeStamp=(SelectedEPPoints)/30000;

disp('time stamp')
size(TimeStamp)
% figure, plot(TimeStamp);

% For Phase Diff after Noise suppression
PhaseRS=SavePhaseDiffAfterNoiseD(:,SelectedEPPoints);
disp('Phase RS')
size(PhaseRS)
figure, plot(TimeStamp,PhaseRS(80,:));
keyboard;

TitleOfGraph2=' Phase Diff after Noise supp-Masking';
TitleOfGraph=strcat(title,TitleOfGraph2);
%% to plot phase data in separate lines

figure();

subaxis(80,1,1:9,'Spacing', 0, 'Padding', 0, 'Margin', 0.1),

% subplot(80,1,1:5)
plot(TimeStampEP,EP, 'k', 'LineWidth', 2);ylim([YlimMin_EP, YlimMax_EP]);
hold on;
plot([max(TimeStampEP); max(TimeStamp)], [50; 100], '-k',  'LineWidth', 2);
set(gca, 'layer', 'bottom','box', 'off');xlim([min(TimeStamp),max(TimeStamp)]);
set(gca,'ycolor',[1 1 1]);hold off;axis off;


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
plot([max(TimeStamp); max(TimeStamp)], [0.5; 1.5], '-k',  'LineWidth', 2);
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

plot([max(TimeStamp); max(TimeStamp)], [0.5; 1.5], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


end