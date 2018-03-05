
close all;clear all;clc;
set(0,'defaultfigurecolor',[1 1 1]);                               % to make the background of graph in white color

%% Parameter
% Volume and folder information
nStartFolder=1;
nEndFolder=8;
strData='B:\1310_data\08-12-2015 AP Phase\SavedRawData\';
nInitVol=1;
%to test para
bInitialTest=0;
% Identify tissue and noise ranges
bIdentifyRanges = 1;
nHeightOfBrainSlice=85   ;   % in pixels

%calculate noise levels and SNR, then select peak
bNoiseSNRPeak = 1;
%flatten around peak
bFlattenAroundPeak = 1;
nFlattenFilter = 5;
%cut out peak

dSNRThreshold = 18;                            %Key Input
% dSNRThreshold_forMask=20;
bSNRMask=0;   % 1= Apply SNR mask; 0=No SNR mask

nPhaseDiff = 1;
nDepth=5;
nPhaseFilterLength = 10;             %Filter for bulk motion correction
nFinalFilter = 3;                    %Filter for pdLongTrace and pdLongMask
nStdFilter = 100;                    %Filter for Std of phase
nMaskFilter=0;                       %Filter to make zero around earthquake motion

delp=4;
nAlineGap=3;                         % select A line gap
nNoiseStdTimes=1;                    % Set std of noise noise
nDepthAutoCorrelation = 10;          %Auto-Correlation Noise(usually fixed)

nOCTDataAcquisitionSpeed=30000;     %Hz
nMEADataAcquisitionSpeed=10000;     %Hz
R_OCTbyMEA=nOCTDataAcquisitionSpeed/nMEADataAcquisitionSpeed;

bMakeDir=1;

% Show Image
bFinalMasking=0;
bPlotTimeWise=0;
% if plot from a particular frame
nStartingFrame=27;
nDepthRange=2;                       % Input phase layer/row range is, for example, D1-nDepthRange:D1+nDepthRange   ;

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

nFolder=[6 7 8];
% nFolder=[100];

for i =1:length(nFolder);
    strFolder = [strData,num2str(nFolder(i)),'\'];
    strFolderSaveData = [strData,num2str(nFolder(i)),'\Raw_Phase_Intensity2\'];
    FileList = dir([strFolder,'*.mat']);
    nVolumeEnd = length(FileList);
    nSV=1;

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
        disp(['OCT loaded from folder :  ',num2str(nFolder(i)),'  &  Volume Number:  ',num2str(nVolNumber)])

        % correction for autocorrelation
        pdIVolume(1:nDepthAutoCorrelation,:,:) = repmat(pdIVolume(nDepthAutoCorrelation+1,:,:), [nDepthAutoCorrelation,1,1]); % modify the autocorrelation noise

        % Extract phase and intensity
        pdI = (abs(pdIVolume)).^2;                                                                                            % Intensity from complex matrix
        pdPhase = angle(pdIVolume);                                                                                        % Phase from complex matrix

        nFrameNumber=size(pdIVolume,3);
        nAlineNumber=size(pdIVolume,2);
        clear  pdIVolume;


        if(bInitialTest)
            %     plotRawPhase1300(pdPhase(:,1:2048,:),nMiddleLayer,nStartingFrame,nDepthRange,nVolNumber);
            TitleOfGraph='Raw Phase';
            plotAllPhaseInSameGraph( pdPhase(pnTissueRange,:,:),nStartingFrame,TitleOfGraph);
        end


        %% Find the surface point and dynamically select tissue depth points

        SurfRef=FindSurfacePostion(nFrameNumber,nDepthAutoCorrelation,pdI,pdSurfaceSettings,ddBRange,ddBOffset);

        pnTissueRange =SurfRef:SurfRef+nHeightOfBrainSlice;                                            % Select Tissue range from the image depth profile:
        pnFlatteningRange = SurfRef+5-pnTissueRange(1):pnTissueRange(end)-pnTissueRange(1)-5;            % Minus from pnTissueRange
        pnPeakRange = pnFlatteningRange;                                                               % Select peak range
        pnNoiseRange = SurfRef-41:SurfRef-21;
        TrackSurface(nVolNumber)=SurfRef;
        %         keyboard;
        clear SurfRef;
        %         keyboard;

        %% Identify tissue and noise ranges
        if (bIdentifyRanges)
            %             disp('select tissue and noise ranges');

            pdAverageImage = mean(pdI, 3);
            %             PlotAverageIntensity( pdAverageImage,pnTissueRange,pnNoiseRange ) ;           % plot average image
            %         keyboard;
            pdAverageDepthProfile = mean(pdAverageImage, 2);
            %             PlotDepthProfile(pdAverageDepthProfile,pnTissueRange,pnNoiseRange );          % plot depth profile
            clear pdAverageImage pdAverageDepthProfile ;
        else % if (bIdentifyRanges)
            disp('using pre-selected tissue and noise ranges');
        end % if (bIdentifyRanges)
        %               keyboard;
        %% calculate noise levels and SNR, then select peak

        if (bNoiseSNRPeak)
            %             disp('calculating noise levels and resulting SNR');
            pdNoiseLevel = mean(pdI(pnNoiseRange,:,:), 1);

            pdSNR = pdI ./ repmat(pdNoiseLevel, [size(pdI,1),1,1]);
            pdAverageImage = mean(pdSNR(pnTissueRange,:,:), 3);
            %             PlotAverageSNRinTissue( pdAverageImage,pnFlatteningRange ) ;              % plot SNR in tissue

            pdAverageDepthProfile = mean(pdAverageImage, 2);
            %                       PlotDepthProfileSNRinTissue( pdAverageDepthProfile,pnFlatteningRange )      % plot depth profile of SNR in tissue

            clear pdAverageImage pdAverageDepthProfile pdGraphLine pnX;
        else % if (bNoiseSNRPeak)
            disp('using pre-calculated noise levels, SNR, and peak position');
        end % if (bNoiseSNRPeak)



        %% flatten around peak and generate mask matrix

        if (bFlattenAroundPeak)
            %             disp('flattening around peak');
            pdFlattenedSNR = pdSNR;
            pdFlattenedPhase = pdPhase;
            pdTissueSNR = pdSNR(pnTissueRange,:,:);

            [ pdFlattenedSNR,pdFlattenedPhase,MaskEartquake] =DoFlattenAndFindMEQ( pdFlattenedSNR,pdFlattenedPhase,pdTissueSNR,pnFlatteningRange,nFlattenFilter );

        end
        %          figure,subplot(211), plot((1:length(MaskEartquake))/nOCTDataAcquisitionSpeed,MaskEartquake);

%         MaskEarthquake2D=Generate2DMEQ(MaskEartquake,nFrameNumber,nAlineNumber,nStartingFrame);

        clear MaskEartquake;

        %% cut out peak

        pdTissueSNR = pdSNR(pnTissueRange,:,:);
        %     pdTissuePhase = pdFlattenedPhase(pnTissueRange,:,:);  % very unstable
        pdTissuePhase = pdPhase(pnTissueRange,:,:);

        pdAverageTissueImage = mean(pdTissueSNR, 3);
        pdAverageTissueLine = mean(pdAverageTissueImage, 2);
        %     PlotPeakDepthProfile( pdAverageTissueLine,pnPeakRange );    % Plot peak depth Profile
        % keyboard;
        pdPeakSNR = pdTissueSNR(pnPeakRange,:,:);
        pdPeakPhase = pdTissuePhase(pnPeakRange,:,:);
        %
        if(bInitialTest)
            %
            %              TitleOfGraph='pd Peak Phase';
            %              plotAllPhaseInSameGraph( pdPeakPhase,nStartingFrame,TitleOfGraph);
        end
        clear pdAverageTissueLine pdAverageTissueImage;

        %%  Plot depth profile of SNR portion
        %          DepthProfilepdPeakSNR=mean(mean(10.0*log10(pdPeakSNR),3),2);
        %          plotDepthProfileReverseOrder(DepthProfilepdPeakSNR,nVolNumber);
        %          keyboard;

        %% Bulk motion correction
        %Steps to find bulk motion correction facotrs
        %{
    1. Find Maask by SNR threshold
    2. Find phase diffrence for consecutive ( can be changed by setting nPhaseDiff) A lines
    3. Mask the phase difference ( from step2)
    4. Find   bulk motion correction factor
        %}
        pdSNRMask = (10.0*log10(pdPeakSNR)) > dSNRThreshold;
        pdPhaseDiff = pdPeakPhase(:,nPhaseDiff+1:end,:)  - pdPeakPhase(:,1:end-nPhaseDiff,:);
        pdPhaseDiff=ConfinePhaseInBetweenPiAndMinusPi(pdPhaseDiff);
        if(bInitialTest)
            %         TitleOfGraph='pd Phase Diff';
            %         plotAllPhaseInSameGraph( pdPhaseDiff,nStartingFrame,TitleOfGraph);
        end
        pdMaskDiff  = pdSNRMask  (:,nPhaseDiff+1:end,:) .* pdSNRMask  (:,1:end-nPhaseDiff,:);
        pdUnwrappedPhases = pdPhaseDiff .* pdMaskDiff;
        % Mask and unwrap phases
        pdUnwrappedPhases  = MaskAndUnwrapPhases( pdPhaseDiff,pdMaskDiff,pdUnwrappedPhases,nDepth);
        % Bulk motion Correction
        BulkCorrectionFactor = BulkMotionCorrection( pdUnwrappedPhases,pdMaskDiff,nPhaseFilterLength );
        if(bInitialTest)
            %         TitleOfGraph='Bulk Correction Factor';
            %         plotAllPhaseInSameGraph( BulkCorrectionFactor,nStartingFrame,TitleOfGraph);
        end

        clear pdSNRMask pdUnwrappedPhases pdMaskDiff;
        %% continue
        pdPeakPhase=ConfinePhaseInBetweenPiAndMinusPi(pdPeakPhase);
        % Correct the phase with bulk motion correction.

        BulkMotionCorrPhase=pdPeakPhase(:,2:end,:)-BulkCorrectionFactor;
        BulkMotionCorrPhase=cat(2,pdPeakPhase(:,1,:),BulkMotionCorrPhase);

        BulkMotionCorrPhase=ConfinePhaseInBetweenPiAndMinusPi(BulkMotionCorrPhase);
        if(bInitialTest)
            TitleOfGraph='Bulk Motion Corr Phase';
            plotAllPhaseInSameGraph( BulkMotionCorrPhase,nStartingFrame,TitleOfGraph);
        end

        %    keyboard;
        clear BulkCorrectionFactor pdPeakPhase;
        %% Actual processing

        DelPhaseBulkMotionCorrPhase=BulkMotionCorrPhase(:,nAlineGap+1:end,:)-BulkMotionCorrPhase(:,1:end-nAlineGap,:);
        DelPhaseBulkMotionCorrPhase=ConfinePhaseInBetweenPiAndMinusPi(DelPhaseBulkMotionCorrPhase);
        if(bInitialTest)
            TitleOfGraph='Del Phase Bulk Motion Corr Phase';
            plotAllPhaseInSameGraph( DelPhaseBulkMotionCorrPhase,nStartingFrame,TitleOfGraph);
        end

        % Correct the Mask for the side effect of movement. Also if any Aline has movement, Aline+nMaskFilter should be made zero too.
%         FinalMaskEarthQuake=ModifyMaskForSideEffectOfMovement(MaskEarthquake2D,nAlineGap,nFrameNumber,nAlineNumber,nMaskFilter);
        % Add zero for in between frames
%         FinalMaskEarthQuake1D=AddZeroForFrameAndAlineGap(FinalMaskEarthQuake,nAlineGap,nAlineNumber,nFrameNumber);

        % Make SNR 2D from 3D
        pdPeakSNR1=pdPeakSNR(:,1:end-nAlineGap,:);
        PeakSNR2D=reshape(pdPeakSNR1, size(pdPeakSNR1,1), size(pdPeakSNR1,2)* size(pdPeakSNR1,3));


        % long trace of phase ; No filter
        pdLongTraceAllFiltered =GenerateLongTrace_InitailTest( DelPhaseBulkMotionCorrPhase,nFinalFilter,nStartingFrame,bInitialTest);
        %         b=1;
        %         for(dSNRThreshold_forMask=IniSNRTh:IncThr:FinalThr)
        %             %% Generate SNR mask
        %             disp([' Time to work for diff SNR Threshold :', num2str(dSNRThreshold_forMask)]);
        %             SNRMask_Comb_AlineGap_delp=GenerateSNRmask_Comb_AlineGap_delp(pdPeakSNR,dSNRThreshold_forMask,nAlineGap,delp); % combied mask; can be applied on del p;

        %             %% customized calculation for a depth ponts and around for all Depth
        %             [SavePhaseDiffB4NoiseD,SavePhaseDiffAfterNoiseD,SaveAvgSNRD,SavePhaseNoiseD]=CalculateAndSavePhaseNoise_SNR_Variance_for_All_D_IniTest(pdLongTraceAllFiltered,FinalMaskEarthQuake,PeakSNR2D,delp,...
        %                 nNoiseStdTimes,nFinalFilter,n,nInitVol,nAlineGap,bFinalMasking,SNRMask_Comb_AlineGap_delp,bSNRMask,nStartingFrame,nFrameNumber,bInitialTest);
        %             title=(['SNR Thr :', num2str(dSNRThreshold_forMask)]);
        %             b=b+1;

        %% Cut off first 11 and last 11 points from Phase data
        %             Phase2D=CutOffFromInitialAndLastPoints(SavePhaseDiffAfterNoiseD,nFrameNumber,nCutoffThrPoints,nAlineGap);
        %             HighestPhaseVector=PlotHighestPhaseWithEndCutOff(Phase2D);

        RawPhase2D=CutOffFromInitialAndLastPoints(pdLongTraceAllFiltered,nFrameNumber,nCutoffThrPoints,nAlineGap);
        PeakSNR2D=CutOffFromInitialAndLastPoints(PeakSNR2D,nFrameNumber,nCutoffThrPoints,nAlineGap);

        %         end    %for (dSNRThreshold_forMask=IniSNRTh:IncThr:FinalThr)

        %         WarehousePhaseVector((nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=HighestPhaseVector;
        WarehouseRawPhase2D(:,(nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=RawPhase2D;
        WarehouseIntensity2D(:,(nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=PeakSNR2D;
        %         WareHouseMEQ((nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=FinalMaskEarthQuake1D;
        clear  RawPhase2D  PeakSNR2D ;

        dSNRThreshold_forMask=0;
        if(mod(nVolNumber,nVolIncrement)==0)

            if(bSaveDataToHD)


                VarName='RawPhase';
                SaveMatlabVariable2SpecificFolder(VarName,WarehouseRawPhase2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                VarName='Intensity';
                SaveMatlabVariable2SpecificFolder(VarName,WarehouseIntensity2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);

                disp('Saved data successfully')
                clear  WarehouseRawPhase2D WarehouseIntensity2D;
            end

            nSV=nSV+nVolIncrement;

        elseif(n==nVolumeEnd)

            VarName='RawPhase';
            SaveMatlabVariable2SpecificFolder(VarName,WarehouseRawPhase2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
            VarName='Intensity';
            SaveMatlabVariable2SpecificFolder(VarName,WarehouseIntensity2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);

            disp('Saved final data successfully')
            clear  WarehouseRawPhase2D WarehouseIntensity2D;


            nSV=1;

        end

        toc
    end  % %nVoulmeNumber


end    %nFolder =nStartFolder:nEndFolder

