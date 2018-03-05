clear all;close all;
set(0,'defaultfigurecolor',[1 1 1]);                               % to make the background of graph in white color

nAddedTime=1; % min
AddedEP1=1*60*1000*.1;
AddedEP=(1:AddedEP1)*0;
AddedOCT1=AddedEP1*3;
AddedOCT=(1:AddedOCT1)*0;


load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\1\Vol17_to_Vol80_Phase.mat');
p1=Var; clear Var;
load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\1\Vol17_to_Vol80_EP.mat');
EP1=Var;clear Var;
disp('p1')

load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\4\Vol1_to_Vol60_Phase.mat');
p4=Var; clear Var;
load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\4\Vol1_to_Vol60_EP.mat');
EP4=Var;clear Var;

disp('p4')

load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\5\SThr22_Vol1_to_Vol24_Phase.mat');
p5=Var; clear Var;
load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\5\SThr22_Vol1_to_Vol24_EP.mat');
EP5=Var;clear Var;
disp('p5')

load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\6\SThr22_Vol1_to_Vol79_Phase.mat')
p6=Var; clear Var;
load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\6\SThr22_Vol1_to_Vol79_EP.mat');
EP6=Var;clear Var;
disp('p6')

load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\7\Vol1_to_Vol42_Phase.mat');
p7=Var; clear Var;
load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\7\Vol1_to_Vol42_EP.mat');
EP7=Var;clear Var;
disp('p7')

load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\8\Vol1_to_Vol19_Phase.mat');
p8=Var; clear Var;
load('B:\1310_data\08-12-2015 AP Phase\SavedRawData\8\Vol1_to_Vol19_EP.mat')
EP8=Var;clear Var;
disp('p8')

AccumulatedEP=cat(2,EP1,AddedEP,EP4,AddedEP,EP5,AddedEP,EP6,AddedEP,AddedEP,EP7,AddedEP,EP8);
AccumulatedOCT=cat(2,p1,AddedOCT,p4,AddedOCT,p5,AddedOCT,p6,AddedOCT,p7,AddedOCT,p8);
disp('cat done')

t_EP=(1:size(AccumulatedEP,2))/(60*10000);
figure, plot(t_EP,AccumulatedEP);


figure,
subplot(211), plot((1:size(AccumulatedEP,2))/(60*10000),AccumulatedEP);
subplot(212), plot((1:size(AccumulatedOCT,2))/(60*30000),AccumulatedOCT);ylim([-.7 0.7]);

figure,
subplot(211), plot((1:size(AccumulatedEP,2))/(60*10000),AccumulatedEP);
subplot(212), plot((1:size(AccumulatedOCT,2))/(60*30000),(1300*AccumulatedOCT/(4*pi)));
ylim([-60 60]);





