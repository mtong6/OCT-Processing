
close all;clear all;clc;
set(0,'defaultfigurecolor',[1 1 1]);                               % to make the background of graph in white color

%% Freqently changed parameters
% select method(at a time only one method)
bMethod1=1;
bMethod2=0;
bMethod3=0;

% Volume and folder information
% nStartFolder=1;
% nEndFolder=8;
%or
nFolder=[1];
strData='I:\1310_data\08-12-2015 AP Phase\SavedRawData\';
nInitVol=1;
%to test para
bInitialTest=0;
% if plot from a particular frame
nStartingFrame=27;
nSelectedLayer=7;
nDepthRange=2;                       % Input phase layer/row range is, for example, D1-nDepthRange:D1+nDepthRange   ;


% Identify tissue and noise ranges
bIdentifyRanges = 1;
nHeightOfBrainSlice=30 ;   % in pixels

%calculate noise levels and SNR, then select peak
bNoiseSNRPeak = 1;
%flatten around peak
bFlattenAroundPeak = 1;
nFlattenFilter = 5;
%cut out peak

dSNRThreshold = 10;                            %Key Input
dSNRThresholdForUnwrap=10;
% dSNRThreshold_forMask=20;
bSNRMask=1;   % 1= Apply SNR mask; 0=No SNR mask
bFinalMasking=0;

nPhaseDiff = 1;
nPhaseFilterLength = 10;             %Filter for bulk motion correction
nFinalFilter = 3;                    %Filter for pdLongTrace and pdLongMask
nStdFilter = 100;                    %Filter for Std of phase
nMaskFilter=0;                       %Filter to make zero around earthquake motion

delp=4;
nAlineGap=nPhaseDiff;                         % select A line gap
nNoiseStdTimes=1;                    % Set std of noise noise
nDepthAutoCorrelation = 10;          %Auto-Correlation Noise(usually fixed)

nOCTDataAcquisitionSpeed=30000;     %Hz
nMEADataAcquisitionSpeed=10000;     %Hz
R_OCTbyMEA=nOCTDataAcquisitionSpeed/nMEADataAcquisitionSpeed;

bMakeDir=0;

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
bSaveDataToHD=0;
nVolIncrement=5;
nSV=1;


% nFolder=[100];


for i =1:length(nFolder);
    strFolder = [strData,num2str(nFolder(i)),'\'];
    strFolderSaveData = [strData,num2str(nFolder(i)),'\BandpassFilteredPhase22M3db\'];
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


        %         if(bInitialTest)
        %             %     plotRawPhase1300(pdPhase(:,1:2048,:),nMiddleLayer,nStartingFrame,nDepthRange,nVolNumber);
        %             TitleOfGraph='Raw Phase';
        %             plotAllPhaseInSameGraph( pdPhase(pnTissueRange,:,:),nStartingFrame,TitleOfGraph);
        %         end


        %% Find the surface point and dynamically select tissue depth points

        %          figure, plot(10*log10(mean((mean(pdI,3)),2))); title('DP');


        SurfRef=FindSurfacePostion(nFrameNumber,nDepthAutoCorrelation,pdI,pdSurfaceSettings,ddBRange,ddBOffset);

        %          [Inten,SurfRef]=max(10*log10(mean((mean(pdI,3)),2)));
        %          SurfRef=SurfRef-round(nHeightOfBrainSlice/2);
        %        keyboard;
        pnTissueRange =SurfRef:SurfRef+nHeightOfBrainSlice;                                            % Select Tissue range from the image depth profile:
        pnFlatteningRange = SurfRef+2-pnTissueRange(1):pnTissueRange(end)-pnTissueRange(1)-2;            % Minus from pnTissueRange
        pnPeakRange = pnFlatteningRange;                                                               % Select peak range
        pnNoiseRange = SurfRef-41:SurfRef-21;
        TrackSurface(nVolNumber)=SurfRef;
        %         keyboard;
        %         clear SurfRef;
        %         keyboard;

        %% Do Basic stuff

        [ pdPeakPhase,pdPeakSNR,MaskEarthquake2D] = BasicItems( bIdentifyRanges,pdI,pnTissueRange,pnNoiseRange,bNoiseSNRPeak, bFlattenAroundPeak,pdPhase,...
            nFrameNumber,nAlineNumber,nStartingFrame,pnFlatteningRange,nFlattenFilter,bInitialTest,pnPeakRange);


%                          DepthProfilepdPeakSNR=mean(mean(10.0*log10(pdPeakSNR),3),2);
%                          plotDepthProfileReverseOrder(DepthProfilepdPeakSNR,nVolNumber);
%                                  keyboard;

        %% Bulk motion correction
        if(bMethod1)
            pdPeakPhase=ConfinePhaseInBetweenPiAndMinusPi(pdPeakPhase);
            figure, subplot(211),plot(pdPeakPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('before unwrap');axis tight;
            % Unwrap phase row wise using matlab std function
            pdPeakPhase=UnwrapPhaseUsingMatlabStdFunc(pdPeakPhase);
            subplot(212),plot(pdPeakPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('After unwrap');axis tight;

            BulkMotionCorrPhase=pdPeakPhase(:,2:end,:);
        end

        if(bMethod2)
            pdUnwrappedPhasesDiff=UnwrapPhaseDiff(pdPeakSNR,dSNRThresholdForUnwrap,pdPeakPhase,nPhaseDiff);

            figure();
            subplot(311), plot(pdUnwrappedPhasesDiff(nSelectedLayer,11:2048-11,nStartingFrame)); title('pdUnwrappedPhasesDiff');axis tight;
            %             %        pdUnwrappedPhasesDiff=unwrap(nPhaseDiff,pi,2);
            BulkCorrectionFactor=GenerateBulkmotionCorrFactor(pdPeakSNR,dSNRThreshold,pdPeakPhase,nPhaseDiff,nPhaseFilterLength);
            subplot(312), plot(BulkCorrectionFactor(nSelectedLayer,11:2048-11,nStartingFrame)); title('BulkCorrectionFactor');axis tight;
            % Correct with Bulk motion corr factor
            BulkMotionCorrPhase=pdUnwrappedPhasesDiff-BulkCorrectionFactor;

            subplot(313), plot(BulkMotionCorrPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('BulkMotionCorrPhase');axis tight;
        end
        %                keyboard;

        if(bMethod3)



            pdPeakPhase=ConfinePhaseInBetweenPiAndMinusPi(pdPeakPhase);

            figure, subplot(211),plot(pdPeakPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('before unwrap');axis tight;
            % Unwrap phase row wise using std matlab  function
            pdPeakPhase=UnwrapPhaseUsingMatlabStdFunc(pdPeakPhase);
            subplot(212),plot(pdPeakPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('After unwrap');axis tight;
            %             keyboard;

            BulkCorrectionFactor=GenerateBulkmotionCorrFactor(pdPeakSNR,dSNRThreshold,pdPeakPhase,nPhaseDiff,nPhaseFilterLength);

            % Correct with Bulk motion corr factor
            BulkMotionCorrPhase=pdPeakPhase(:,2:end,:)-BulkCorrectionFactor;
            figure,
            subplot(211),plot(BulkCorrectionFactor(nSelectedLayer,11:2048-11,nStartingFrame)); title('BulkCorrectionFactor');axis tight;
            subplot(212),plot(BulkMotionCorrPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('BulkMotionCorrPhase');axis tight;


            BulkMotionCorrPhase=cat(2,pdPeakPhase(:,1,:),BulkMotionCorrPhase);
            BulkMotionCorrPhase=ConfinePhaseInBetweenPiAndMinusPi(BulkMotionCorrPhase);
            % Use time difference for A line gap
            DelPhaseBulkMotionCorrPhase=BulkMotionCorrPhase(:,nAlineGap+1:end,:)-BulkMotionCorrPhase(:,1:end-nAlineGap,:);
            DelPhaseBulkMotionCorrPhase=ConfinePhaseInBetweenPiAndMinusPi(DelPhaseBulkMotionCorrPhase);
            BulkMotionCorrPhase=DelPhaseBulkMotionCorrPhase;

            figure,
            subplot(211),plot(BulkCorrectionFactor(nSelectedLayer,11:2048-11,nStartingFrame)); title('BulkCorrectionFactor');axis tight;
            subplot(212),plot(BulkMotionCorrPhase(nSelectedLayer,11:2048-11,nStartingFrame)); title('Bulk Motion CorrPhase after Aline Gap');axis tight;
            %

        end
        %         keyboard;
        %         if(bInitialTest)
        %             TitleOfGraph='Bulk Motion Corr Phase';
        %             plotAllPhaseInSameGraph( BulkMotionCorrPhase,nStartingFrame,TitleOfGraph);

        Phase1=BulkMotionCorrPhase(nSelectedLayer,11:2048-11,nStartingFrame);[f,Y]=FindFreqRange(Phase1);
        %         end

        %          keyboard;
        clear BulkCorrectionFactor pdPeakPhase;
        %% More on Masking

        % Correct the Mask for the side effect of movement. Also if any Aline has movement, Aline+nMaskFilter should be made zero too.
        FinalMaskEarthQuake=ModifyMaskForSideEffectOfMovement(MaskEarthquake2D,nAlineGap,nFrameNumber,nAlineNumber,nMaskFilter);
        % Add zero for in between frames
        FinalMaskEarthQuake1D=AddZeroForFrameAndAlineGap(FinalMaskEarthQuake,nAlineGap,nAlineNumber,nFrameNumber);

        %Generate SNR mask
        disp([' Time to work for diff SNR Threshold :', num2str(dSNRThreshold)]);
        SNRMask_Comb_AlineGap_delp=GenerateSNRmask_Comb_AlineGap_delp(pdPeakSNR,dSNRThreshold,nAlineGap,delp); % combied mask; can be applied on del p;
        if(bMethod1)
            SNRMaskM1=GenerateSNRmaskM1(pdPeakSNR(:,2:end,:),dSNRThreshold,delp);
            %           SNRMaskM1=SNRMaskM1(:,2:end);
        end

        %% Make SNR 2D from 3D, band pass filter
        pdPeakSNR1=pdPeakSNR(:,1:end-nAlineGap,:);
        PeakSNR2D=reshape(pdPeakSNR1, size(pdPeakSNR1,1), size(pdPeakSNR1,2)* size(pdPeakSNR1,3));


        % long trace of phase ; No filter
        pdLongTraceUnFiltered =GenerateLongTrace_InitailTest( BulkMotionCorrPhase,nFinalFilter,nStartingFrame,bInitialTest);
        
        pdLongTraceUnFiltered1=pdLongTraceUnFiltered;
          r=22;
        figure, 
        subplot(311),plot( pdLongTraceUnFiltered1(r,:));axis tight;
        subplot(312),plot( pdLongTraceUnFiltered1(r+1,:));axis tight;
        subplot(313),plot( pdLongTraceUnFiltered1(r,:)- pdLongTraceUnFiltered(r+1,:));axis tight;
        
        % Unwrap again for method 1
        if(bMethod1)
            for(j=1:size(pdLongTraceUnFiltered,1))
                ppp=pdLongTraceUnFiltered(j,:);
                PP=unwrap(ppp,pi,2);
                AllUnwrapPhases(j,:)=PP;
            end
            pdLongTraceUnFiltered= AllUnwrapPhases;
        end

% %         Phase2=pdLongTraceUnFiltered(nSelectedLayer,:);
%          Phase2=pdLongTraceUnFiltered(13,:);
%         [f,Y]=FindFreqRange(Phase2);
        
     
       figure, 
        subplot(311),plot( pdLongTraceUnFiltered(r,:));axis tight;
        subplot(312),plot( pdLongTraceUnFiltered(r+1,:));axis tight;
        subplot(313),plot( pdLongTraceUnFiltered(r,:)- pdLongTraceUnFiltered(r+1,:));axis tight;
        
        
                         keyboard;
        %
        % Band pass filter
        for(f=1:size(pdLongTraceUnFiltered,1))
            FilteredPhase=BandPassFilter( pdLongTraceUnFiltered(f,:));
            pdLongTraceAllFiltered(f,:)=FilteredPhase;

        end

        Phase3=pdLongTraceAllFiltered(nSelectedLayer,:);
        [f,Y]=FindFreqRange(Phase3);

        %                  keyboard;


        if(bMethod1)

            [SavePhaseDiffAfterNoiseD,SaveAvgSNRD,SavePhaseNoiseD]=GeneratePhaseDiffandmaskingM1(pdLongTraceAllFiltered,FinalMaskEarthQuake,PeakSNR2D,delp,nNoiseStdTimes,nFinalFilter,n,nInitVol,...
                bFinalMasking,SNRMaskM1,bSNRMask,nStartingFrame,nFrameNumber,bInitialTest);

        end

        %% customized calculation for a depth ponts and around for all Depth
        % generate layer wise phase diff and do final masking for SNR
        % and/or MEQ
        if(bMethod1==0)
            [SavePhaseDiffB4NoiseD,SavePhaseDiffAfterNoiseD,SaveAvgSNRD,SavePhaseNoiseD]=CalculateAndSavePhaseNoise_SNR_Variance_for_All_D_IniTest(pdLongTraceAllFiltered,FinalMaskEarthQuake,PeakSNR2D,delp,...
                nNoiseStdTimes,nFinalFilter,n,nInitVol,nAlineGap,bFinalMasking,SNRMask_Comb_AlineGap_delp,bSNRMask,nStartingFrame,nFrameNumber,bInitialTest);
            %         title=(['SNR Thr :', num2str(dSNRThreshold_forMask)]);

        end
        %% Cut off first 11 and last 11 points from Phase data as well as add zero betn frames
        InterlayerPhase2D=CutOffFromInitialAndLastPoints(SavePhaseDiffAfterNoiseD,nFrameNumber,nCutoffThrPoints,nAlineGap);
        HighestPhaseVector=PlotHighestPhaseWithEndCutOff(InterlayerPhase2D);
        figure, plot((1:length(HighestPhaseVector))/30000,HighestPhaseVector); title('HighestPhaseVector');axis tight;
        keyboard;

        RawPhase2D=CutOffFromInitialAndLastPoints(pdLongTraceAllFiltered,nFrameNumber,nCutoffThrPoints,nAlineGap);
        PeakSNR2D=CutOffFromInitialAndLastPoints(PeakSNR2D,nFrameNumber,nCutoffThrPoints,nAlineGap);



        if(bInitialTest)

            TitleOfGraph='Final Phase';
            plotAllPhaseInSameGraph(InterlayerPhase2D(3:5,1:2048),nStartingFrame,TitleOfGraph);
        end

        %         keyboard;

        %% Saving Data

        WarehousePhaseVector((nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=HighestPhaseVector;
        WarehouseRawPhase2D(:,(nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=RawPhase2D;
        %         WarehouseIntensity2D(:,(nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=PeakSNR2D;
        %         WareHouseMEQ((nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=FinalMaskEarthQuake1D;
        WarehouseInterlayerPhase2D(:,(nSave-nInitVol)*nFrameNumber*(nAlineNumber+(3600-2048))+1:(nSave-nInitVol+1)*(nAlineNumber+(3600-2048))*nFrameNumber)=InterlayerPhase2D;
        clear  RawPhase2D  PeakSNR2D InterlayerPhase2D HighestPhaseVector;

        dSNRThreshold_forMask=dSNRThreshold;
        if(mod(nVolNumber,nVolIncrement)==0)

            if(bSaveDataToHD)

                VarName='PhaseVector';
                SaveMatlabVariable2SpecificFolder(VarName,WarehousePhaseVector,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                VarName='InterlayerPhase';
                SaveMatlabVariable2SpecificFolder(VarName,WarehouseInterlayerPhase2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                VarName='RawPhase';
                SaveMatlabVariable2SpecificFolder(VarName,WarehouseRawPhase2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                %                 VarName='Intensity';
                %                 SaveMatlabVariable2SpecificFolder(VarName,WarehouseIntensity2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
                %

                disp('Saved data successfully')
                clear WarehousePhaseVector WarehouseInterlayerPhase2D WarehouseRawPhase2D WarehouseIntensity2D ;
            end

            nSV=nSV+nVolIncrement;

        elseif(n==nVolumeEnd)

            VarName='PhaseVector';
            SaveMatlabVariable2SpecificFolder(VarName,WarehousePhaseVector,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
            VarName='InterlayerPhase';
            SaveMatlabVariable2SpecificFolder(VarName,WarehouseInterlayerPhase2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
            VarName='RawPhase';
            SaveMatlabVariable2SpecificFolder(VarName,WarehouseRawPhase2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
            %             VarName='Intensity';
            %             SaveMatlabVariable2SpecificFolder(VarName,WarehouseIntensity2D,nSV,nVolNumber,CreateNewFolderFortSaveData,dSNRThreshold_forMask);
            %
            disp('Saved final data successfully')
            clear WarehousePhaseVector WarehouseInterlayerPhase2D WarehouseRawPhase2D WarehouseIntensity2D ;


            nSV=1;

        end

        toc
    end  % %nVoulmeNumber


end    %nFolder =nStartFolder:nEndFolder

