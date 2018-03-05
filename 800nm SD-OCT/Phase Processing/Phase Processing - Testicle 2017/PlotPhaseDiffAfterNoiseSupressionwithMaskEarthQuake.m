function[]=PlotPhaseDiffAfterNoiseSuppressionwithMaskEarthQuake(SavePhaseDiffAfterNoiseD1,SavePhaseDiffAfterNoiseD2,SavePhaseDiffAfterNoiseD3,...
    SavePhaseDiffAfterNoiseD4,SavePhaseDiffAfterNoiseD5,SavePhaseDiffAfterNoiseD6,SavePhaseDiffAfterNoiseD7,SavePhaseDiffAfterNoiseD8,...
    SaveAvgSNRD1,SaveAvgSNRD2,SaveAvgSNRD3,SaveAvgSNRD4,SaveAvgSNRD5,SaveAvgSNRD6,SaveAvgSNRD7,SaveAvgSNRD8,nInitVol,nLastVolume,...
    x,SaveEP,SaveMaskForEarthquake)    
nMinYlim=-pi;
nMaxYlim=pi;

c='k';

figure,
subplot(10, 1, 1),plot(x,SavePhaseDiffAfterNoiseD1,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD1)));
title(['From Volume: ', num2str(nInitVol), ' to volume:  ', num2str(nLastVolume)],'FontSize', 20);
subplot(10, 1, 2),plot(x,SavePhaseDiffAfterNoiseD2,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD2)));
subplot(10, 1, 3),plot(x,SavePhaseDiffAfterNoiseD3,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD3)));
subplot(10, 1, 4),plot(x,SavePhaseDiffAfterNoiseD4,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD4)));
subplot(10, 1, 5),plot(x,SavePhaseDiffAfterNoiseD5,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD5)));
subplot(10, 1,6),plot(x,SavePhaseDiffAfterNoiseD6,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD6)));
subplot(10 ,1,7),plot(x,SavePhaseDiffAfterNoiseD7,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD7)));
subplot(10,1,8),plot(x,SavePhaseDiffAfterNoiseD8,c); xlim([ min(x),max(x)]);ylim([ nMinYlim,nMaxYlim]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD8)));
subplot(10,1,9),plot(x,SaveMaskForEarthquake,c); xlim([ min(x),max(x)]);set(gca,'xcolor',[1 1 1]);
subplot(10,1,10), plot(x,SaveEP,c); xlim([ min(x),max(x)]); ylim([ -100,100]);set(gca, 'layer', 'bottom','box', 'off')

end