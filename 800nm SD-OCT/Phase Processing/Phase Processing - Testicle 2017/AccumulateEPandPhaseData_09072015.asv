clear all;close all;clc;set(0,'defaultfigurecolor',[1 1 1]);
% parameters
nStartFolder=1;
nEndFolder=1;
strData='H:\08-18-2015-1D\';
AccEP=[];
AccPh=[];

%% load EP and phase ; then accumulate
for nFolder =nStartFolder:nEndFolder
    strFolderSaveData = [strData,num2str(nFolder),'\SaveData4\'];
    FileList = dir([strFolderSaveData,'*.mat']);

    % for EP
    for nVolNumber =1;
        strPathName = sprintf('%s%s',strFolderSaveData,FileList(nVolNumber).name);
        load(strPathName);
    end
     AccEP=cat(2,AccEP,Var);
     clear Var;
    % for Phase
    for nVolNumber =2;
        strPathName = sprintf('%s%s',strFolderSaveData,FileList(nVolNumber).name);
        load(strPathName);
    end
    AccPh=cat(2,AccPh,Var);
    clear Var;
disp(['done for folder :  ',num2str(nFolder)])

end

figure,
subplot(211), plot((1:size(AccEP,2))/(60*10000),AccEP);axis tight;xlabel('time(minute)');ylabel('EP(microvolt)');
subplot(212), plot((1:size(AccPh,2))/(60*30000),AccPh);axis tight;xlabel('time(minute)');ylabel('Phase(rad)');

figure,plot((1:size(AccEP,2))/(60*30000),AccEP);axis tight;xlabel('time(minute)');ylabel('EP(microvolt)');

