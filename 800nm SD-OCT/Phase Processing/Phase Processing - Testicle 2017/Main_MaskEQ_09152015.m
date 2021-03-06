%Masum

close all;clear all;clc;
set(0,'defaultfigurecolor',[1 1 1]);                               % to make the background of graph in white color

%% Parameter
% Volume and folder information
nStartFolder=1;
nEndFolder=1;
strData='B:\1310_data\08-12-2015 AP Phase\SavedRawData\';
nInitVol=1;
%to test para
% Identify tissue and noise ranges
bIdentifyRanges = 1;
nHeightOfBrainSlice=85   ;   % in pixels
%calculate noise levels and SNR, then select peak
bNoiseSNRPeak = 1;
%flatten around peak
bFlattenAroundPeak = 1;
nFlattenFilter = 5;
%cut out peak

nDepth=5;
nMaskFilter=10;                       %Filter to make zero around earthquake motion

delp=4;
nAlineGap=3;                         % select A line gap
nDepthAutoCorrelation = 10;          %Auto-Correlation Noise(usually fixed)


nOCTDataAcquisitionSpeed=30000;     %Hz
nMEADataAcquisitionSpeed=10000;     %Hz


% if plot from a particular frame
nStartingFrame=27;

% for find surface function
ddBRange = 50;
ddBOffset = 40;
pdSurfaceSettings = [50,8, 0.4, 1];  % alines, points, threshold, sink


for nFolder =nStartFolder:nEndFolder
    strFolder = [strData,num2str(nFolder),'\'];  
    FileList = dir([strFolder,'*.mat']);
    nVolumeEnd = length(FileList);


    for nVolNumber =nInitVol:1; %nVolumeEnd;nInitVol
  
        n=nVolNumber;
        strPathName = sprintf('%s%s',strFolder,FileList(nVolNumber).name);
        load(strPathName);
        disp(['OCT loaded from folder :  ',num2str(nFolder),'  &  Volume Number:  ',num2str(nVolNumber)])

        % correction for autocorrelation
        pdIVolume(1:nDepthAutoCorrelation,:,:) = repmat(pdIVolume(nDepthAutoCorrelation+1,:,:), [nDepthAutoCorrelation,1,1]); % modify the autocorrelation noise
      
        % Extract phase and intensity
        pdI = (abs(pdIVolume)).^2;                                                                                            % Intensity from complex matrix
        pdPhase = angle(pdIVolume);                                                                                       % Phase from complex matrix

        nFrameNumber=size(pdIVolume,3);
        nAlineNumber=size(pdIVolume,2);
        clear  pdIVolume;


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

       
        %% calculate noise levels and SNR, then select peak
      
            pdNoiseLevel = mean(pdI(pnNoiseRange,:,:), 1);
            pdSNR = pdI ./ repmat(pdNoiseLevel, [size(pdI,1),1,1]);
          
        %% flatten around peak and generate mask matrix

        if (bFlattenAroundPeak)
            %             disp('flattening around peak');
            pdFlattenedSNR = pdSNR;
            pdFlattenedPhase = pdPhase;
            pdTissueSNR = pdSNR(pnTissueRange,:,:);

    [ pdFlattenedSNR,pdFlattenedPhase,MaskEartquake] =DoFlattenAndFindMEQ( pdFlattenedSNR,pdFlattenedPhase,pdTissueSNR,pnFlatteningRange,nFlattenFilter );

        end

        
        keyboard;
        
        figure, plot(  (1:length(MaskEartquake))/30000,  MaskEartquake); title(' only 0(No move) & 1(move)');
%          figure,subplot(211), plot((1:length(MaskEartquake))/nOCTDataAcquisitionSpeed,MaskEartquake);
        
       MaskEarthquake2D=Generate2DMEQ(MaskEartquake,nFrameNumber,nAlineNumber,nStartingFrame);
          
        MEQ2D_T= MaskEarthquake2D';
        TestMaskEQ2D=reshape(MEQ2D_T,1,size(MaskEarthquake2D,1)*size(MaskEarthquake2D,2));
        
        figure, plot((1:length(TestMaskEQ2D))/nOCTDataAcquisitionSpeed,TestMaskEQ2D);title('TestMaskEQ2D')
%         subplot(212),plot((1:length(TestMaskEQ2D))/nOCTDataAcquisitionSpeed,TestMaskEQ2D);
        
%         keyboard;
%         
% 
        % Correct the Mask for the side effect of movement. Also if any Aline has movement, Aline+nMaskFilter should be made zero too.
        FinalMaskEarthQuake=ModifyMaskForSideEffectOfMovement(MaskEarthquake2D,nAlineGap,nFrameNumber,nAlineNumber,nMaskFilter);
        
         figure, plot((1:length(FinalMaskEarthQuake))/nOCTDataAcquisitionSpeed,FinalMaskEarthQuake);title('Final MaskEarth Quake');
        
%          figure, plot(FinalMaskEarthQuake(1:3*2045));ylim([-1 2]);
         
         
         FinalMaskEarthQuake1D=AddZeroForFrameAndAlineGap(FinalMaskEarthQuake,nAlineGap,nAlineNumber,nFrameNumber);
%          figure, plot(FinalMaskEarthQuake1D(1:3*3600));ylim([-1 2]);
         figure, plot(FinalMaskEarthQuake1D);ylim([-1 2]);title('FinalMaskEarthQuake1D')
         %         % Save mask Data
% %          WareHouseMEQ((n-nInitVol)*nFrameNumber*(nAlineNumber-nAlineGap)+1:(n-nInitVol+1)*nFrameNumber*(nAlineNumber-nAlineGap))=FinalMaskEarthQuake;
%      
    end  % %nVoulmeNumber  


end    %nFolder =nStartFolder:nEndFolder
