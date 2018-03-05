
function []=plotDiffThrDatainSameGraph(PhaseRS,EP,tStart,tEnd)
%Masum 07282015

SelectedEPPoints=(tStart:tEnd);
% EP=EP(:,SelectedEPPoints);
TimeStamp=(tStart:1:tEnd)./1000;

PhaseRS=PhaseRS(:,SelectedEPPoints,:);

YlimMin=-pi;
YlimMax=pi;

YlimMin_EP=-100;
YlimMax_EP=100;


%% Customization

figure();


% subplot(9,1,1:3),
% plot(TimeStamp,EP, 'k', 'LineWidth', 2);
% hold on;
% set(gca, 'layer', 'bottom','box', 'off');
% xlim([ min(TimeStamp),max(TimeStamp)]);
% set(gca,'ycolor',[1 1 1]); ylim([YlimMin_EP, YlimMax_EP]);
% 
% plot([max(TimeStamp); max(TimeStamp)], [50; 100], '-k',  'LineWidth', 2);
% xlim([ min(TimeStamp),max(TimeStamp)]);ylim([YlimMin_EP, YlimMax_EP]);
% 
% hold off; axis off;

%Thr 25
subplot(914),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,6);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [2; 3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;

%Thr 20
subplot(915),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,5);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [2; 3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


%Thr 15
subplot(916),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,4);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [2; 3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


%Thr 10
subplot(917),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,3);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [2; 3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;



%Thr 5
subplot(918),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,2);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [2; 3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


%Thr 0
subplot(919),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,1);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    %     set(gca, 'Visible', 'off');
    set(gca,'ycolor',[1 1 1]);set(gca, 'layer', 'bottom','box', 'off');
    xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    %    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [2; 3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


end