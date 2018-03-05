function []=plotPhaseDiffForDifferentDepthPoints(SavePhaseDiffAfterNoiseD1,SavePhaseDiffAfterNoiseD2,SavePhaseDiffAfterNoiseD3,...
    SavePhaseDiffAfterNoiseD4,SavePhaseDiffAfterNoiseD5,SavePhaseDiffAfterNoiseD6,SavePhaseDiffAfterNoiseD7,SavePhaseDiffAfterNoiseD8,...
    x,SaveEP,SaveAvgSNRD1,SaveAvgSNRD2,SaveAvgSNRD3,SaveAvgSNRD4,SaveAvgSNRD5,SaveAvgSNRD6,SaveAvgSNRD7,SaveAvgSNRD8,nInitVol,nLastVolume, ...
    SavePhaseDiffB4NoiseD1,SavePhaseDiffB4NoiseD2,SavePhaseDiffB4NoiseD3,...
    SavePhaseDiffB4NoiseD4,SavePhaseDiffB4NoiseD5,SavePhaseDiffB4NoiseD6,SavePhaseDiffB4NoiseD7,SavePhaseDiffB4NoiseD8)
% Masum 06162015

nMinYlim=-pi;
nMaxYlim=pi;
c='k';
%{
figure,
subplot(911),plot(x,SavePhaseDiffAfterNoiseD1,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD1)));
title(['From Volume: ', num2str(nInitVol), ' to volume:  ', num2str(nLastVolume)],'FontSize', 20);
subplot(912),plot(x,SavePhaseDiffAfterNoiseD2,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD2)));
subplot(913),plot(x,SavePhaseDiffAfterNoiseD3,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD3)));
subplot(914),plot(x,SavePhaseDiffAfterNoiseD4,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD4)));
subplot(915),plot(x,SavePhaseDiffAfterNoiseD5,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD5)));
subplot(916),plot(x,SavePhaseDiffAfterNoiseD6,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD6)));
subplot(917),plot(x,SavePhaseDiffAfterNoiseD7,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD7)));
subplot(918),plot(x,SavePhaseDiffAfterNoiseD8,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD8)));
subplot(919), plot(x,SaveEP); xlim([ min(x),max(x)]); ylim([ -100,100]);set(gca, 'layer', 'bottom','box', 'off')
%}


% figure,
% 
% subplot(511), plot(x,SaveEP,'k'); xlim([ min(x),max(x)]); ylim([ -150,150]);set(gca, 'Visible', 'off');
% axis([[1 12]    -150,150]);
% hold on;
% plot([10.5; 10.5], [0; 50], '-k', [10.5; 11.5], [0; 0], '-k', 'LineWidth', 2);
% hold off;
% 
% 
% subplot(512),plot(x,SavePhaseDiffAfterNoiseD1,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
% set(gca, 'Visible', 'off');axis([[1 12]    -pi  pi]);
% 
% subplot(513),plot(x,SavePhaseDiffAfterNoiseD2,c); xlim([
% min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca, 'Visible', 'off')
% axis([[1 12]    -pi  pi]);
% hold on; axis([[1 12]    -pi  pi]);
% 
% plot([10.5; 10.5], [0; 1], '-k',  [10.5; 11.5], [0; 0], '-k', 'LineWidth', 2);
% hold off;
% 
% subplot(514),plot(x,SavePhaseDiffAfterNoiseD3,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca, 'Visible', 'off');
% axis([[1 12]    -pi  pi]);
% subplot(515),plot(x,SavePhaseDiffAfterNoiseD4,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca, 'Visible', 'off')
% axis([[1 12]    -pi  pi]);


% x=x*1000;
% figure,
% 
% subplot(511), plot(x,SaveEP,'k'); xlim([ min(x),max(x)]); ylim([ -150,150]);
% subplot(512),plot(x,SavePhaseDiffAfterNoiseD1,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
% subplot(513),plot(x,SavePhaseDiffAfterNoiseD2,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
% subplot(514),plot(x,SavePhaseDiffAfterNoiseD3,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
% subplot(515),plot(x,SavePhaseDiffAfterNoiseD4,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
% 
% figure,
% 
% subplot(511), plot(x,SaveEP,'k'); xlim([ min(x),max(x)]); ylim([ -150,150]);
% subplot(512),plot(x,SavePhaseDiffAfterNoiseD5,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
% subplot(513),plot(x,SavePhaseDiffAfterNoiseD6,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
% subplot(514),plot(x,SavePhaseDiffAfterNoiseD7,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
% subplot(515),plot(x,SavePhaseDiffAfterNoiseD8,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);



x=x*1000;
figure,

subplot(511), plot(x,SaveEP,'k'); xlim([ min(x),max(x)]); ylim([ -150,150]); title(' B4 noise');
subplot(512),plot(x,SavePhaseDiffB4NoiseD1,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
subplot(513),plot(x,SavePhaseDiffB4NoiseD2,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
subplot(514),plot(x,SavePhaseDiffB4NoiseD3,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
subplot(515),plot(x,SavePhaseDiffB4NoiseD4,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);

figure,

subplot(511), plot(x,SaveEP,'k'); xlim([ min(x),max(x)]); ylim([ -150,150]);title(' B4 noise');
subplot(512),plot(x,SavePhaseDiffB4NoiseD5,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
subplot(513),plot(x,SavePhaseDiffB4NoiseD6,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
subplot(514),plot(x,SavePhaseDiffB4NoiseD7,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);
subplot(515),plot(x,SavePhaseDiffB4NoiseD8,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);




end