
function []=plotDiffThrDatainSameGraphWire(PhaseRS,tStart,tEnd)
%Masum 07282015

SelectedEPPoints=(tStart:tEnd);

TimeStamp=(tStart:1:tEnd)./30000;

PhaseRS=PhaseRS(:,SelectedEPPoints,:);
YlimMin=-pi/4;
YlimMax=pi/4;



%% Customization

figure();


%Thr 25
subplot(611),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,6);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [.2; .3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;

%Thr 20
subplot(612),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,5);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [.2; .3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


%Thr 15
subplot(613),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,4);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [.2; .3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


%Thr 10
subplot(614),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,3);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [.2; .3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;



%Thr 5
subplot(615),
for i = 1:size(PhaseRS,1);
    PhaseVector= PhaseRS(i,:,2);

    plot(TimeStamp,PhaseVector, 'k', 'LineWidth', 2); ylabel([num2str(i)]);
    set(gca, 'Visible', 'off');xlim([ min(TimeStamp),max(TimeStamp)]); ylim([YlimMin YlimMax]);
    hold on;
    % axis tight;
    axis off;

end
plot([max(TimeStamp); max(TimeStamp)], [.2; .3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


%Thr 0
subplot(616),
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
plot([max(TimeStamp); max(TimeStamp)], [.2; .3], '-k',  'LineWidth', 2);ylim([YlimMin YlimMax]);
hold off;


end