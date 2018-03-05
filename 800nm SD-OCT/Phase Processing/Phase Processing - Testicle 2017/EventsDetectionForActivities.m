function[]=EventsDetectionForActivities(SavePhaseDiffAfterNoiseD1,SavePhaseDiffAfterNoiseD2,SavePhaseDiffAfterNoiseD3,SavePhaseDiffAfterNoiseD4,...
    SavePhaseDiffAfterNoiseD5,SavePhaseDiffAfterNoiseD6,SavePhaseDiffAfterNoiseD7,SavePhaseDiffAfterNoiseD8,nWindowLength,...
   SaveAvgSNRD1,SaveAvgSNRD2,SaveAvgSNRD3,SaveAvgSNRD4,SaveAvgSNRD5,SaveAvgSNRD6,SaveAvgSNRD7,SaveAvgSNRD8,nInitVol,nLastVolume,...
   x,SaveEP)

% Masum 06162015


NoOfWindow=floor(length(SavePhaseDiffAfterNoiseD1)/(nWindowLength*10));

for(d=1:1:NoOfWindow)
threshold=0.5;

TotalNoOfEventsD1(d)=DetectEvents(threshold,SavePhaseDiffAfterNoiseD1(((d-1)*(nWindowLength*10))+1: d*(nWindowLength*10)));
TotalNoOfEventsD2(d)=DetectEvents(threshold,SavePhaseDiffAfterNoiseD2(((d-1)*(nWindowLength*10))+1: d*(nWindowLength*10)));
TotalNoOfEventsD3(d)=DetectEvents(threshold,SavePhaseDiffAfterNoiseD3(((d-1)*(nWindowLength*10))+1: d*(nWindowLength*10)));
TotalNoOfEventsD4(d)=DetectEvents(threshold,SavePhaseDiffAfterNoiseD4(((d-1)*(nWindowLength*10))+1: d*(nWindowLength*10)));
TotalNoOfEventsD5(d)=DetectEvents(threshold,SavePhaseDiffAfterNoiseD5(((d-1)*(nWindowLength*10))+1: d*(nWindowLength*10)));
TotalNoOfEventsD6(d)=DetectEvents(threshold,SavePhaseDiffAfterNoiseD6(((d-1)*(nWindowLength*10))+1: d*(nWindowLength*10)));
TotalNoOfEventsD7(d)=DetectEvents(threshold,SavePhaseDiffAfterNoiseD7(((d-1)*(nWindowLength*10))+1: d*(nWindowLength*10)));
TotalNoOfEventsD8(d)=DetectEvents(threshold,SavePhaseDiffAfterNoiseD8(((d-1)*(nWindowLength*10))+1: d*(nWindowLength*10)));

end

xx=0.5:1:NoOfWindow-0.5;

figure,
subplot(911), bar(xx,TotalNoOfEventsD1,0.98);  xlim([ 0,NoOfWindow]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD1)));set(gca,'xcolor',[1 1 1]);
 title(['From Volume: ', num2str(nInitVol), ' to volume:  ', num2str(nLastVolume)],'FontSize', 16);
subplot(912), bar(xx,TotalNoOfEventsD2,0.98);xlim([ 0,NoOfWindow]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD2)));set(gca,'xcolor',[1 1 1]);
subplot(913), bar(xx,TotalNoOfEventsD3,0.98);xlim([ 0,NoOfWindow]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD3)));set(gca,'xcolor',[1 1 1]);
subplot(914), bar(xx,TotalNoOfEventsD4,0.98);xlim([ 0,NoOfWindow]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD4)));set(gca,'xcolor',[1 1 1]);
subplot(915), bar(xx,TotalNoOfEventsD5,0.98);xlim([ 0,NoOfWindow]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD5)));set(gca,'xcolor',[1 1 1]);
subplot(916), bar(xx,TotalNoOfEventsD6,0.98);xlim([ 0,NoOfWindow]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD6)));set(gca,'xcolor',[1 1 1]);
subplot(917), bar(xx,TotalNoOfEventsD7,0.98);xlim([ 0,NoOfWindow]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD7)));set(gca,'xcolor',[1 1 1]);
subplot(918), bar(xx,TotalNoOfEventsD8,0.98);xlim([ 0,NoOfWindow]);ylabel(sprintf('%.1f\n',mean(SaveAvgSNRD8)));set(gca,'xcolor',[1 1 1]);
subplot(919),plot(x,SaveEP); xlim([ min(x),max(x)]); ylim([ -100,100]);set(gca, 'layer', 'bottom','box', 'off')



end