function []=plotPhaseDiffForDifferentDepthPointsWithNoise(SavePhaseDiffB4NoiseD1,SavePhaseDiffB4NoiseD2,SavePhaseDiffB4NoiseD3,...
    SavePhaseDiffB4NoiseD4,SavePhaseDiffB4NoiseD5,SavePhaseDiffB4NoiseD6,SavePhaseDiffB4NoiseD7,SavePhaseDiffB4NoiseD8,...
    SavePhaseNoiseD1,SavePhaseNoiseD2,SavePhaseNoiseD3,SavePhaseNoiseD4,SavePhaseNoiseD5,SavePhaseNoiseD6,SavePhaseNoiseD7,...
    SavePhaseNoiseD8,x,SaveEP,nInitVol,nLastVolume,SaveAvgSNRD1,SaveAvgSNRD2,SaveAvgSNRD3,SaveAvgSNRD4,SaveAvgSNRD5,...
    SaveAvgSNRD6,SaveAvgSNRD7,SaveAvgSNRD8)

% Masum 06162015

nMinYlim= -pi;
nMaxYlim=pi;

% figure,
% subplot(911),plot(x,SavePhaseDiffB4NoiseD1);hold on, plot(x,SavePhaseNoiseD1,'r'); hold on, plot(x,-SavePhaseNoiseD1,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD1)));
% title(['From Volume: ', num2str(nInitVol), ' to volume:  ', num2str(nLastVolume)],'FontSize', 20);
% subplot(912),plot(x,SavePhaseDiffB4NoiseD2);hold on, plot(x,SavePhaseNoiseD2,'r'); hold on, plot(x,-SavePhaseNoiseD2,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD2)));
% subplot(913),plot(x,SavePhaseDiffB4NoiseD3);hold on, plot(x,SavePhaseNoiseD3,'r'); hold on, plot(x,-SavePhaseNoiseD3,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD3)));
% subplot(914),plot(x,SavePhaseDiffB4NoiseD4);hold on, plot(x,SavePhaseNoiseD4,'r'); hold on, plot(x,-SavePhaseNoiseD4,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD4)));
% subplot(915),plot(x,SavePhaseDiffB4NoiseD5);hold on, plot(x,SavePhaseNoiseD5,'r'); hold on, plot(x,-SavePhaseNoiseD5,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD5)));
% subplot(916),plot(x,SavePhaseDiffB4NoiseD6);hold on, plot(x,SavePhaseNoiseD6,'r'); hold on, plot(x,-SavePhaseNoiseD6,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD6)));
% subplot(917),plot(x,SavePhaseDiffB4NoiseD7);hold on, plot(x,SavePhaseNoiseD7,'r'); hold on, plot(x,-SavePhaseNoiseD7,'r');hold off;xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD7)));
% subplot(918),plot(x,SavePhaseDiffB4NoiseD8);hold on, plot(x,SavePhaseNoiseD8,'r'); hold on, plot(x,-SavePhaseNoiseD8,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD8)));
% subplot(919), plot(x,SaveEP); xlim([ min(x),max(x)]); ylim([ -100,100]);set(gca, 'layer', 'bottom','box', 'off');





figure,
subplot(911),plot(x,SavePhaseDiffB4NoiseD1);hold on, plot(x,SavePhaseNoiseD1,'r'); hold on, plot(x,-SavePhaseNoiseD1,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD1)));
title(['From Volume: ', num2str(nInitVol), ' to volume:  ', num2str(nLastVolume)],'FontSize', 20);
subplot(912),plot(x,SavePhaseDiffB4NoiseD2);hold on, plot(x,SavePhaseNoiseD2,'r'); hold on, plot(x,-SavePhaseNoiseD2,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD2)));
subplot(913),plot(x,SavePhaseDiffB4NoiseD3);hold on, plot(x,SavePhaseNoiseD3,'r'); hold on, plot(x,-SavePhaseNoiseD3,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD3)));
subplot(914),plot(x,SavePhaseDiffB4NoiseD4);hold on, plot(x,SavePhaseNoiseD4,'r'); hold on, plot(x,-SavePhaseNoiseD4,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD4)));
subplot(915),plot(x,SavePhaseDiffB4NoiseD5);hold on, plot(x,SavePhaseNoiseD5,'r'); hold on, plot(x,-SavePhaseNoiseD5,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD5)));
subplot(916),plot(x,SavePhaseDiffB4NoiseD6);hold on, plot(x,SavePhaseNoiseD6,'r'); hold on, plot(x,-SavePhaseNoiseD6,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD6)));
subplot(917),plot(x,SavePhaseDiffB4NoiseD7);hold on, plot(x,SavePhaseNoiseD7,'r'); hold on, plot(x,-SavePhaseNoiseD7,'r');hold off;xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD7)));
subplot(918),plot(x,SavePhaseDiffB4NoiseD8);hold on, plot(x,SavePhaseNoiseD8,'r'); hold on, plot(x,-SavePhaseNoiseD8,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD8)));
subplot(919), plot(x,SaveEP); xlim([ min(x),max(x)]); ylim([ -100,100]);




end