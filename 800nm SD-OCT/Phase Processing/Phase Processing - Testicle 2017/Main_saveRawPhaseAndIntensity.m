
close all;clear all;clc;
set(0,'defaultfigurecolor',[1 1 1]);                               % to make the background of graph in white color

%% Freqently changed parameters
% select method(at a time only one method)

bMethod3=1;
% Volume and folder information
nFolder=[9 10];
strData='J:\08-17-2015-1D\';
nInitVol=1;
%to test para
bInitialTest=1;
% if plot from a particular frame
nStartingFrame=27;
nSelectedLayer=7;
nDepthRange=2;                       % Input phase layer/row range is, for example, D1-nDepthRange:D1+nDepthRange   ;


% Identify tissue and noise ranges
bIdentifyRanges = 1;
nHeightOfBrainSlice=75 ;   % in pixels

%calculate noise levels and SNR, then select peak
bNoiseSNRPeak = 1;
%flatten around peak
bFlattenAroundPeak = 1;
nFlattenFilter = 5;
%cut out peak

dSNRThreshold = 20;                            %Key Input
dSNRThresholdForUnwrap=20;
% dSNRThreshold_forMask=20;
bSNRMask=1;   % 1= Apply SNR mask; 0=No SNR mask
bFinalMasking=0;

nPhaseDiff = 1;
nPhaseFilterLength = 10;             %Filter for bulk motion correction
nFinalFilter = 10;                    %Filter for pdLongTrace and pdLongMask
nStdFilter = 100;                    %Filter for Std of phase
nMaskFilter=0;                       %Filter to make zero around earthquake motion

delp=4;
nAlineGap=nPhaseDiff;                         % select A line gap
nNoiseStdTimes=1;                    % Set std of noise noise
nDepthAutoCorrelation = 10;          %Auto-Correlation Noise(usually fixed)

nOCTDataAcquisitionSpeed=30000;     %Hz
nMEADataAcquisitionSpeed=10000;     %Hz
R_OCTbyMEA=nOCTDataAcquisitionSpeed/nMEADataAcquisitionSpeed;

bMakeDir=1;

% Initialization
nCutoffThrPoints=11;
IniSNRTh=0;
IncThr=5;
FinalThr=0;

% for find surface function
ddBRange = 50;
ddBOffset = 40;
pdSurfaceSettings = [50,8, 0.4, 1];  % alines, points, threshold, sink
% if wanna save
bSaveDataToHD=1;
nVolIncrement=5;
nSV=1;


% nFolder=[100];


for i =1:length(nFolder);
    strFolder = [strData,num2str(nFolder(i)),'\'];
    strFolderSaveData = [strData,num2str(nFolder(i)),'\RawPhaseAndIntensity_0106\'];
    FileList = dir([strFolder,'*.mat']);
    nVolumeEnd = length(FileList);
    nSV=1;
% nVolumeEnd=1;
    %% create folder to save data
    if(bMakeDir==1)
        CreateNewFolderFortSaveData = sprintf('%s', strFolderSaveData);
        mkdir(CreateNewFolderFortSaveData);
    end

    for nVolNumber =nInitVol:nVolumeEnd; %nVolumeEnd;nInitVol
        tic
        n=nVolNumber;
        nSave=mod(n,nVolIncrement);

        if(mod(n,nVolIncrement)==0)
            nSave= nVolIncrement;

        end

        strPathName = sprintf('%s%s',strFolder,FileList(nVolNumber).name);
        load(strPathName);
        disp(strPathName)
%         disp(['OCT loaded from folder :  ',num2str(nFolder(i)),'  &  Volume Number:  ',num2str(nVolNumber)])

        % correction for autocorrelation
        pdIVolume(1:nDepthAutoCorrelation,:,:) = repmat(pdIVolume(nDepthAutoCorrelation+1,:,:), [nDepthAutoCorrelation,1,1]); % modify the autocorrelation noise

        % Extract phase and intensity
        pdI = (abs(pdIVolume)).^2;                                                                                            % Intensity from complex matrix
        pdPhase = angle(pdIVolume);                                                                                        % Phase from complex matrix

        nFrameNumber=size(pdIVolume,3);
        nAlineNumber=size(pdIVolume,2);
        clear  pdIVolume;


        %% Find the surface point and dynamically select tissue depth points

%        figure, plot(10*log10(mean((mean(pdI,3)),2))); title('DP');


        SurfRef=FindSurfacePostion(nFrameNumber,nDepthAutoCorrelation,pdI,pdSurfaceSettings,ddBRange,ddBOffset);

        pnTissueRange =SurfRef:SurfRef+nHeightOfBrainSlice;                                            % Select Tissue range from the image depth profile:
        pnFlatteningRange = SurfRef+2-pnTissueRange(1):pnTissueRange(end)-pnTissueRange(1)-2;            % Minus from pnTissueRange
        pnPeakRange = pnFlatteningRange;                                                               % Select peak range
        pnNoiseRange = SurfRef-41:SurfRef-21;
        TrackSurface(nVolNumber)=SurfRef;

% keyboard;
        %% Do Basic stuff

        [ pdPeakPhase,pdPeakSNR,MaskEarthquake2D] = BasicItems( bIdentifyRanges,pdI,pnTissueRange,pnNoiseRange,bNoiseSNRPeak, bFlattenAroundPeak,pdPhase,...
            nFrameNumber,nAlineNumber,nStartingFrame,pnFlatteningRange,nFlattenFilter,bInitialTest,pnPeakRange);


        %% Bulk motion correction

        if(bMethod3)

            pdPeakPhase=ConfinePhaseInBetweenPiAndMinusPi(pdPeakPhase);

%             figure, subplot(211),plot(pdPeakPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('before unwrap');axis tight;
            % Unwrap phase row wise using std matlab  function
            pdPeakPhase=UnwrapPhaseUsingMatlabStdFunc(pdPeakPhase);
%             subplot(212),plot(pdPeakPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('After unwrap');axis tight;
            %             keyboard;


        end

  
% keyboard;
        %% Make SNR 2D from 3D, band pass filter
        pdPeakSNR1=pdPeakSNR(:,1:end-nAlineGap,:);
        pdPeakPhase=pdPeakPhase(:,1:end-nAlineGap,:);
        PeakSNR2D=reshape(pdPeakSNR1, size(pdPeakSNR1,1), size(pdPeakSNR1,2)* size(pdPeakSNR1,3));
        pdPeakPhase2D=reshape(pdPeakPhase, size(pdPeakPhase,1), size(pdPeakPhase,2)* size(pdPeakPhase,3));

        %% Cut off first 11 and last 11 points from Phase data as well as add zero betn frames


        RawPhase2D=CutOffFromInitialAndLastPoints(pdPeakPhase2D,nFrameNumber,nCutoffThrPoints,nAlineGap);
        PeakSNR2D=CutOffFromInitialAndLastPoints(PeakSNR2D,nFrameNumber,nCutoffThrPoints,nAlineGap);



        %% Saving Data

        WarehouseRawPhase2D(:,(nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=RawPhase2D;
        WarehouseIntensity2D(:,(nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=PeakSNR2D;
        clear  RawPhase2D  PeakSNR2D ;

        dSNRThreshold_forMask=dSNRThreshold;
        if(mod(nVolNumber,nVolIncrement)==0)

            if(bSaveDataToHD)

                VarName='RawPhase';
                SaveMatlabVariable2SpecificFolder(VarName,WarehouseRawPhase2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                VarName='Intensity';
                SaveMatlabVariable2SpecificFolder(VarName,WarehouseIntensity2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                
                disp('Saved data successfully')
                clear   WarehouseRawPhase2D WarehouseIntensity2D ;
            end

            nSV=nSV+nVolIncrement;

        elseif(n==nVolumeEnd)


                VarName='RawPhase';
                SaveMatlabVariable2SpecificFolder(VarName,WarehouseRawPhase2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                VarName='Intensity';
                SaveMatlabVariable2SpecificFolder(VarName,WarehouseIntensity2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                
                disp('Saved final data successfully')
            clear   WarehouseRawPhase2D WarehouseIntensity2D ;


            nSV=1;

        end

        toc
    end  % %nVoulmeNumber


end    %nFolder =nStartFolder:nEndFolder

