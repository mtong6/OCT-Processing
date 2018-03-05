% Masum 04/27/2016 ,version 1.0
% Primary data processing.
% Input: dat files, calibration and dispersion file
% Output: Intensity, and Phase

close all;clear all; clc;set(0,'defaultfigurecolor',[1 1 1]);
%% Frequently modified parameters
nStartFolder=1;      % folder number
nEndFolder=1;
nBlines=40;           %number of files that make a volume
strDirRawData = 'F:\testicles\20x raw data\3d_3\';  % Location of .dat files
strCalibration='F:\testicles\code\Calibration_11152017.mat';% Location of calibration file
strDispersion='F:\testicles\code\pdDispersion_20x_12132017_v1.mat';  % Location of dispersion file
% strDispersion='F:\testicles\code\pdDispersion_4x_12122017_v3.mat';
bFlip = 1;
bDispersion=1;       % to run for dispersion, set bDispersion=1;
bSave2HD=0;          % to save data,bSave2HD=1;

%% Rarely Modified Parameters
FolderName='Stage01';          % choose a name
bMakeDir=1;
nStartVol=1;                   % play with this [arameter if you want to run specific volume
nRoundLength = 16;
nAlineLength  = 4096;
nNumberAlines = 2048;
nOffset = 2048;

%% load dispersion & calibration file
load(strCalibration);disp(strCalibration);
load(strDispersion);disp(strDispersion);

%% for all folders

for nFolder =nStartFolder:nEndFolder
    % list the dat files for a folder
%     strFolder = [strDirRawData,num2str(nFolder),'\'];
     strFolder = [strDirRawData];
    FileList = dir([strFolder,'*.dat']);
%     FileList= nestedSortStruct(FileList, {'date', 'name'});
    nEndVol=floor((length(FileList))/(nBlines));
    
    %% Create folder to save data
    if(bMakeDir==1)
        [FolderLocation]=CreateDirectoryToSaveDataStage1(strDirRawData,nFolder,FolderName);
    end
    
    %% Do calculation for volume by volume
    for(nVol=nStartVol:nEndVol)        %nEndVol
        % read the data file numbers for each volume
        pnDataFileNumber= ((nVol-1)* nBlines)+1:  ((nVol-1)* nBlines)+nBlines;
        % actual processing for intensity and phase
        GenerateIntensityPhaseAndSave(pnDataFileNumber,FileList,nOffset,nNumberAlines,nAlineLength,nRoundLength,bFlip,pdWavelength,...
            pdDispersion,bDispersion,nFolder,strFolder,nVol,bSave2HD,FolderLocation);
        
    end %for(nVol=nStartVol:nEndVol)
end %for nFolder =nStartFolder:nEndFolder



