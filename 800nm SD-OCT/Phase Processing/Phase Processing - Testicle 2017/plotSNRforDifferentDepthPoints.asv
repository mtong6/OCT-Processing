
function[]=plotSNRforDifferentDepthPoints(SaveAvgSNRD1,SaveAvgSNRD2,SaveAvgSNRD3,SaveAvgSNRD4,SaveAvgSNRD5,SaveAvgSNRD6,...
    SaveAvgSNRD7,SaveAvgSNRD8,x,SaveEP,nInitVol,nLastVolume)

%Masum 06162015

nMinSNR=5;
nMaxSNR=35;
figure,
subplot(911),plot(x,SaveAvgSNRD1); xlim([ min(x),max(x)]);ylim([ nMinSNR,nMaxSNR]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD1)));
title(['From Volume: ', num2str(nInitVol), ' to volume:  ', num2str(nLastVolume)],'FontSize', 20);
% set(gca,'FontSize', 20);
subplot(912),plot(x,SaveAvgSNRD2); xlim([ min(x),max(x)]);ylim([ nMinSNR,nMaxSNR]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD2)));
subplot(913),plot(x,SaveAvgSNRD3); xlim([ min(x),max(x)]);ylim([ nMinSNR,nMaxSNR]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD3)));
subplot(914),plot(x,SaveAvgSNRD4); xlim([ min(x),max(x)]);ylim([ nMinSNR,nMaxSNR]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD4)));
subplot(915),plot(x,SaveAvgSNRD5); xlim([ min(x),max(x)]);ylim([ nMinSNR,nMaxSNR]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD5)));
subplot(916),plot(x,SaveAvgSNRD6); xlim([ min(x),max(x)]);ylim([ nMinSNR,nMaxSNR]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD6)));
subplot(917),plot(x,SaveAvgSNRD7); xlim([ min(x),max(x)]);ylim([ nMinSNR,nMaxSNR]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD7)));
subplot(918),plot(x,SaveAvgSNRD8); xlim([ min(x),max(x)]);ylim([ nMinSNR,nMaxSNR]);set(gca,'xcolor',[1 1 1]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD8)));
subplot(919), plot(x,SaveEP); xlim([ min(x),max(x)]); ylim([ -100,100]);set(gca, 'layer', 'bottom','box', 'off')

end