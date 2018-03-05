function []=plotPhaseDiffForDifferentDepthPointsWithNoiseWithMaskEQ(SavePhaseDiffB4NoiseD1,SavePhaseDiffB4NoiseD2,SavePhaseDiffB4NoiseD3,...
    SavePhaseDiffB4NoiseD4,SavePhaseDiffB4NoiseD5,SavePhaseDiffB4NoiseD6,SavePhaseDiffB4NoiseD7,SavePhaseDiffB4NoiseD8,...
    SavePhaseNoiseD1,SavePhaseNoiseD2,SavePhaseNoiseD3,SavePhaseNoiseD4,SavePhaseNoiseD5,SavePhaseNoiseD6,SavePhaseNoiseD7,...
    SavePhaseNoiseD8,x,SaveEP,nInitVol,nLastVolume,SaveAvgSNRD1,SaveAvgSNRD2,SaveAvgSNRD3,SaveAvgSNRD4,SaveAvgSNRD5,...
    SaveAvgSNRD6,SaveAvgSNRD7,SaveAvgSNRD8,SaveMaskForEarthquake);

% Masum 06162015

nMinYlim= -pi;
nMaxYlim=pi;
c='k';
figure,
subplot(10,1,1),plot(x,SavePhaseDiffB4NoiseD1,c);hold on, plot(x,SavePhaseNoiseD1,'r'); hold on, plot(x,-SavePhaseNoiseD1,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD1)));
title(['From Volume: ', num2str(nInitVol), ' to volume:  ', num2str(nLastVolume)],'FontSize', 20);
subplot(10,1,2),plot(x,SavePhaseDiffB4NoiseD2,c);hold on, plot(x,SavePhaseNoiseD2,'r'); hold on, plot(x,-SavePhaseNoiseD2,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD2)));
subplot(10,1,3),plot(x,SavePhaseDiffB4NoiseD3,c);hold on, plot(x,SavePhaseNoiseD3,'r'); hold on, plot(x,-SavePhaseNoiseD3,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD3)));
subplot(10,1,4),plot(x,SavePhaseDiffB4NoiseD4,c);hold on, plot(x,SavePhaseNoiseD4,'r'); hold on, plot(x,-SavePhaseNoiseD4,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD4)));
subplot(10,1,5),plot(x,SavePhaseDiffB4NoiseD5,c);hold on, plot(x,SavePhaseNoiseD5,'r'); hold on, plot(x,-SavePhaseNoiseD5,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD5)));
subplot(10,1,6),plot(x,SavePhaseDiffB4NoiseD6,c);hold on, plot(x,SavePhaseNoiseD6,'r'); hold on, plot(x,-SavePhaseNoiseD6,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD6)));
subplot(10,1,7),plot(x,SavePhaseDiffB4NoiseD7,c);hold on, plot(x,SavePhaseNoiseD7,'r'); hold on, plot(x,-SavePhaseNoiseD7,'r');hold off;xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD7)));
subplot(10,1,8),plot(x,SavePhaseDiffB4NoiseD8,c);hold on, plot(x,SavePhaseNoiseD8,'r'); hold on, plot(x,-SavePhaseNoiseD8,'r');hold off; xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD8)));
subplot(10,1,9),plot(x,SaveMaskForEarthquake,c); xlim([ min(x),max(x)]);set(gca,'xcolor',[1 1 1]);
subplot(10,1,10), plot(x,SaveEP,c); xlim([ min(x),max(x)]); ylim([ -100,100]);set(gca, 'layer', 'bottom','box', 'off')


end