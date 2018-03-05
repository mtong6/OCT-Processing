clear all ; close all;clc;set(0,'defaultfigurecolor',[1 1 1]);
%% Load Data

load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\5\OldWay18dB\SThr22_Vol1_to_Vol65_Phase.mat')
load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\1_EP.mat')
%
% var=var(1:3600*100*40);
% Var=Var(1:1200*100*40);
% figure, plot(var);
%
% figure, plot((1:length(Var))/600000,Var);ylim([-100 250]);

% load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\7\OldWay18dB\SThr22_Vol1_to_Vol42_Phase.mat')
% load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\5_EP.mat');
% Var=Var(1:1200*100*40);

%  load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\8\OldWay18dB\SThr22_Vol1_to_Vol19_Phase.mat')
%  load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\6_EP.mat')

% load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\4_1\OldWay18dB\SThr22_Vol1_to_Vol60_Phase.mat')
% load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\2_EP.mat')

% load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\6\OldWay18dB\SThr22_Vol1_to_Vol79_Phase.mat')
% load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\4_EP.mat')

% figure, plot((1:length(Var))/600000,Var);

%
% load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\5\OldSNR16to24dB\SThr24_Vol1_to_Vol65_Phase.mat')
% load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\1_EP.mat')
% 
% Var=Var(1:1200*100*40);

% load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\7\OldSNR16to24dB\SThr24_Vol1_to_Vol42_Phase.mat')
% load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\5_EP.mat');
Var=Var(1:1200*100*40);
%% Do Thresholding
Thr =0.4;
% var=var(2,:);
var=var(1:3600*100*40);

RejectTh=0.6;
var(isnan(var))=0;
var(find(var>RejectTh))=0;
var(find(var<-RejectTh))=0;

nVolume=size(var,2)/360000;
nFrames=nVolume*100;
time=2048*100*nVolume/30000;

%% Actual event detection
% Step 1: detect event frame wise
NoOfPointsInFrame=3600;

for(i=1:nFrames)
    SpliceData=var(NoOfPointsInFrame*(i-1)+1:NoOfPointsInFrame*i);
    event = DetectPosNegEvent(SpliceData,Thr );
    
    WarehouseEvents(i)=event;
    
end
% figure, plot(WarehouseEvents);
% keyboard;
% Step 2(a): Do moving average
Detectionwindow=5*100;   % 1 minutes=500 frames

for(j=1:length(WarehouseEvents)-Detectionwindow)

EventCountData=WarehouseEvents((j-1)+1:(j-1)+Detectionwindow);
EventCount=sum(EventCountData);
WarehouseEventCount(j)=EventCount;
end

WarehouseEventCount=cat(2,zeros(1,Detectionwindow/2),WarehouseEventCount,zeros(1,Detectionwindow/2));
figure,
subplot(211),plot((1:length(WarehouseEventCount))*0.120/60,WarehouseEventCount);ylim([ -1 25]);
subplot(212), plot((1:length(Var))/600000,Var);ylim([-100 250]);

% axis off

% Step 2(b): Do moving average

% for(k=1:length(WarehouseEvents)-Detectionwindow)
% 
% EventCountData=WarehouseEvents((k-1)+1:(k-1)+Detectionwindow);
% EventCount=sum(EventCountData);
% WarehouseEventCount(k)=EventCount;
% 
% WarehouseEvents((k-1)+(Detectionwindow/2))=EventCount;
% end
% figure, plot((1:length(WarehouseEventCount))*0.120/60,WarehouseEventCount);


%% Plot Graph
figure,bar(WarehouseEventCount);
xx=ones(1,size(var,2));
% figure,
% subplot(211),
% plot((1:length(var))/30000,var);hold on; plot((1:length(var))/30000,xx*Thr);hold on; plot((1:length(var))/30000,xx*(-Thr));hold off;
%  xlim([1/30000, length(var)/30000]);ylim([-1 1]);
% subplot(212), plot((1:length(Var))/10000,Var);xlim([1/10000, length(Var)/10000]);



figure,
plot((1:length(var))/30000,var);hold on; plot((1:length(var))/30000,xx*Thr);hold on; plot((1:length(var))/30000,xx*(-Thr));hold off;
%  xlim([1/30000, length(var)/30000]);ylim([-1 1]);
% %
% % figure,
% % plot((1:length(var))/30,var);


figure,
subplot(211), bar(0.5:7.5 ,WHeventPerMinute,0.95);set(gca, 'layer', 'bottom','box', 'off');ylim([0 17]);
hold on;  bar(9,1,.9);hold off;set(gca,'ycolor',[1 1 1]);
set(gca,'xcolor',[1 1 1]);
xlim([0 10])
subplot(212),
plot((1:length(Var))/600000,Var,'k');set(gca, 'layer', 'bottom','box', 'off');hold on;
set(gca,'ycolor',[1 1 1]);
plot([9; 9], [50; 100], 'k'  ,'LineWidth', 2);
xlim([0 10]);ylim([-100 250])

%
% Thr=.1;
% figure,
% subplot(211),
% plot((1:length(varf))/30000,varf);hold on; plot((1:length(var))/30000,xx*Thr);hold on; plot((1:length(var))/30000,xx*(-Thr));hold off;
% xlim([1/30000, length(var)/30000]);ylim([-.3 .3]);
% subplot(212), plot((1:length(Var))/10000,Var);xlim([1/10000, length(Var)/10000]);




% figure,plot(var)
%
%
% clear all;close all;
% y = [ 2 5 7 4 6];
% y1=1;
% figure();
% bar(1:5,y,0.95);
% hold on; bar(7,y1,0.95);hold off;axis off;ylim([0, 7]);
% set(gca,'xcolor',[1 1 1]);
%
% y = [ 1 2 2 4 3];
% y1=1;
% figure();
% bar(1:5,y,0.95);
% hold on; bar(7,y1,0.95);hold off;axis off;ylim([0, 7]);
% set(gca,'xcolor',[1 1 1]);


