%Masum
close all;clear all;clc;set(0,'defaultfigurecolor',[1 1 1]);                              

%% Parameter
% Volume and folder information
nStartFolder=4;
nEndFolder=8;
strData='B:\1310_data\08-12-2015 AP Phase\SavedRawData\';
nInitVol=1;
bMakeDir=1;
% for find surface function
ddBRange = 50;
ddBOffset = 40;
pdSurfaceSettings = [50,8, 0.4, 1];  % alines, points, threshold, sink
nDepthAutoCorrelation=10;

for nFolder =nStartFolder:nEndFolder
    strFolder = [strData,num2str(nFolder),'\'];
    strFolderSaveData = [strData,num2str(nFolder),'\TrackMovement2\'];
    FileList = dir([strFolder,'*.mat']);
    nVolumeEnd = length(FileList);


    %% create folder to save data
    if(bMakeDir==1)
        CreateNewFolderFortSaveData = sprintf('%s', strFolderSaveData);
                mkdir(CreateNewFolderFortSaveData);
    end

    for nVolNumber =nInitVol:2; %nVolumeEnd;nInitVol
        tic
        n=nVolNumber;
        strPathName = sprintf('%s%s',strFolder,FileList(nVolNumber).name);
        load(strPathName);
        disp(['OCT loaded from folder :  ',num2str(nFolder),'  &  Volume Number:  ',num2str(nVolNumber)])
        
        % Extract phase and intensity
        pdI = (abs(pdIVolume)).^2;    % Phase from complex matrix                                                                                      % Intensity from complex matrix
                                                                                            
        nFrameNumber=size(pdIVolume,3);
        nAlineNumber=size(pdIVolume,2);
        clear  pdIVolume; 


        %% Find the surface point and dynamically select tissue depth points

        SurfRef=FindSurfacePostion(nFrameNumber,nDepthAutoCorrelation,pdI,pdSurfaceSettings,ddBRange,ddBOffset);
        TrackSurface((nVolNumber-1)*nFrameNumber+1:nVolNumber*nFrameNumber)=SurfRef;        
        clear SurfRef;  

           

    end  % %nVoulmeNumber
% figure, plot(TrackSurface);
    bSaveDataToHD=1;
    
    if(bSaveDataToHD)     
       dSNRThreshold_forMask=20;
        VarName='TrackSurface';
        SaveMatlabVariable2SpecificFolder(VarName,TrackSurface,nInitVol,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);       
        disp('Saved data successfully')
        clear TrackSurface;
    end


end    %nFolder =nStartFolder:nEndFolder
