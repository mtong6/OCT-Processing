clear all ; close all;clc;set(0,'defaultfigurecolor',[1 1 1]);
% parameters

% strData='I:\1310_data\08-12-2015 AP Phase\SavedRawData\';
% AccPh=[];
% % nFolder=[1 4 5 6 7 8];
% nFolder=[4];
% ddBOffset = 30;
% ddBRange = 40;
% 
% %% load EP and phase ; then accumulate
% for (k =1:length(nFolder))
%     strFolderSaveData = [strData,num2str(nFolder(k)),'\OldWay18dB\'];
%     FileList = dir([strFolderSaveData,'*.mat']);
% %       keyboard;
%     % for Phase
%       for(j=1::length(FileList))
%         strPathName = sprintf('%s%s',strFolderSaveData,FileList(j).name);
%         load(strPathName);   
%       
%          AccPh=cat(2,AccPh,var); 
%     
%    end
%   
% end
% 
% figure, plot((1:length(AccPh))/30000,AccPh);title('Phase');ylim([-1 1])

% load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\5\OldWay20dB\SThr20_Vol1_to_Vol40_Phase.mat')
% load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\1_EP.mat')





% load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\5\OldWay18dB\SThr22_Vol1_to_Vol65_Phase.mat')
% load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\1_EP.mat')
% % 
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
load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\5\OldSNR16to24dB\SThr24_Vol1_to_Vol65_Phase.mat')
load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\1_EP.mat')
% 
% Var=Var(1:1200*100*40);

% load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\7\OldSNR16to24dB\SThr24_Vol1_to_Vol42_Phase.mat')
% load('I:\1310_data\08-12-2015 AP Phase\OCT data for Oscar\5_EP.mat');
Var=Var(1:1200*100*40);
Thr =0.6;
var=var(2,:);
 var=var(1:3600*100*40);

RejectTh=0.9;
var(isnan(var))=0;
var(find(var>RejectTh))=0;
var(find(var<-RejectTh))=0;
 
% nFinalFilter=10;

% varf = imfilter(var, ones([1,nFinalFilter])/nFinalFilter, 'replicate');
% 
% std(var)

 nVolume=size(var,2)/360000;
 time=2048*100*nVolume/30000;
 
 NoOfPointsIn1Minute=3600*100*5;
 
 for(i=1:floor(nVolume/5))
 SpliceData=var(NoOfPointsIn1Minute*(i-1)+1:NoOfPointsIn1Minute*i);  
event = DetectPosNegEvent(SpliceData,Thr );

WHeventPerMinute(i)=event;

 end

  figure,bar(WHeventPerMinute);




%  EventPerSec=event/time;
 EventPerMinute=event/time*60;
 xx=ones(1,size(var,2));
% 
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


   