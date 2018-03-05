
close all;clear all;clc;
set(0,'defaultfigurecolor',[1 1 1]);                               % to make the background of graph in white color

%% Parameter
% Volume and folder information
nStartFolder=1;
nEndFolder=8;
strData='I:\1310_data\08-13-2015 PPY phase vol\1D\';
nInitVol=1;
%to test para
bInitialTest=0;
% Identify tissue and noise ranges

nHeightOfBrainSlice=12  ;   % in pixels
dSNRThreshold = 5;                            %Key Input


nPhaseDiff = 1;
nPhaseFilterLength = 10;             %Filter for bulk motion correction
nDepthAutoCorrelation = 10;          %Auto-Correlation Noise(usually fixed)
% if plot from a particular frame
nStartingFrame=27;
nDepthRange=2;                       % Input phase layer/row range is, for example, D1-nDepthRange:D1+nDepthRange   ;

% for find surface function
ddBRange = 50;
ddBOffset = 40;
pdSurfaceSettings = [50,8, 0.4, 1];  % alines, points, threshold, sink

nFolder=[1];
% nFolder=[100];

for i =1:length(nFolder);
    strFolder = [strData,num2str(nFolder(i)),'\'];
    strFolderSaveData = [strData,num2str(nFolder(i)),'\Raw_Phase_Intensity2\'];
    FileList = dir([strFolder,'*.mat']);
    nVolumeEnd = length(FileList);

    for nVolNumber =1:1; %nVolumeEnd;nInitVol
   
        n=nVolNumber;       

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

%         figure, plot(10* log10(mean(pdI(:,:,50),2)));

        %% Find the surface point and dynamically select tissue depth points
        
        SurfRef=FindSurfacePostion(nFrameNumber,nDepthAutoCorrelation,pdI,pdSurfaceSettings,ddBRange,ddBOffset);
%         keyboard;
        pnTissueRange =SurfRef:SurfRef+nHeightOfBrainSlice;                                            % Select Tissue range from the image depth profile:
        pnFlatteningRange = SurfRef+2-pnTissueRange(1):pnTissueRange(end)-pnTissueRange(1)-2;            % Minus from pnTissueRange
        pnPeakRange = pnFlatteningRange;                                                               % Select peak range
        pnNoiseRange = SurfRef-41:SurfRef-21;
        TrackSurface(nVolNumber)=SurfRef;
        %         keyboard;
        clear SurfRef;
        %         keyboard;

        %% Identify tissue and noise ranges
      
            pdAverageImage = mean(pdI, 3);
%                          PlotAverageIntensity( pdAverageImage,pnTissueRange,pnNoiseRange ) ;           % plot average image
            %         keyboard;
            pdAverageDepthProfile = mean(pdAverageImage, 2);
%                        PlotDepthProfile(pdAverageDepthProfile,pnTissueRange,pnNoiseRange );          % plot depth profile
            clear pdAverageImage pdAverageDepthProfile ;
                 

        %% calculate noise levels and SNR, then select peak     
            pdNoiseLevel = mean(pdI(pnNoiseRange,:,:), 1);

            pdSNR = pdI ./ repmat(pdNoiseLevel, [size(pdI,1),1,1]);
            pdAverageImage = mean(pdSNR(pnTissueRange,:,:), 3);
            %             PlotAverageSNRinTissue( pdAverageImage,pnFlatteningRange ) ;              % plot SNR in tissue

            pdAverageDepthProfile = mean(pdAverageImage, 2);
            %                       PlotDepthProfileSNRinTissue( pdAverageDepthProfile,pnFlatteningRange )      % plot depth profile of SNR in tissue

            clear pdAverageImage pdAverageDepthProfile pdGraphLine pnX;
        

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
 
        pdSNRMask = (10.0*log10(pdPeakSNR)) > dSNRThreshold;
        pdPhaseDiff = pdPeakPhase(:,nPhaseDiff+1:end,:)  - pdPeakPhase(:,1:end-nPhaseDiff,:);
        pdPhaseDiff=ConfinePhaseInBetweenPiAndMinusPi(pdPhaseDiff);
        pdMaskDiff  = pdSNRMask  (:,nPhaseDiff+1:end,:) .* pdSNRMask  (:,1:end-nPhaseDiff,:);
        pdUnwrappedPhases1 = pdPhaseDiff .* pdMaskDiff;
        
        % Mask and unwrap phases
        pdUnwrappedPhases  = MaskAndUnwrapPhases( pdPhaseDiff,pdMaskDiff,pdUnwrappedPhases1);
        
        pdUnwrappedPhasesTest  = MaskAndUnwrapPhases( pdPhaseDiff,pdMaskDiff,pdPhaseDiff);
        
        
        figure,
subplot(211),imagesc(pdUnwrappedPhases(:,:,nStartingFrame));colorbar;title(['pdUnwrappedPhases for SNR Thr: ',num2str(dSNRThreshold) ]);
subplot(212),imagesc(pdUnwrappedPhasesTest(:,:,nStartingFrame));colorbar;title(['pdUnwrappedPhasesTest for SNR Thr: ',num2str(dSNRThreshold) ]);
        
ss=pdUnwrappedPhases-pdUnwrappedPhasesTest;
figure, imagesc(ss(:,:,nStartingFrame));colorbar;

        

        
        
        % Bulk motion Correction
        BulkCorrectionFactor = BulkMotionCorrection( pdUnwrappedPhases,pdMaskDiff,nPhaseFilterLength );
        
%         BulkCorrectionFactor=GenerateBulkmotionCorrFactor(pdPeakSNR,dSNRThreshold,pdPeakPhase,nPhaseDiff,nDepth,nPhaseFilterLength)
aa=7;
zz=pdUnwrappedPhases(:,:,nStartingFrame) ;   
yy=pdUnwrappedPhases1(:,:,nStartingFrame)  ;    
xx=BulkCorrectionFactor(:,:,nStartingFrame);
dd=pdPhaseDiff(:,:,nStartingFrame);

% figure, plot(yy(aa,:),'k');hold on; plot(zz(aa,:),'r');hold on; plot(xx(aa,:),'b');hold off;

%% test case 1

pp=zz-xx;
qq=dd-xx;

aa=3;
figure, plot(yy(aa,:),'k');hold on; plot(zz(aa,:),'r');hold on; plot(xx(aa,:),'b'); plot(pp(aa,:));hold off;axis tight;
title(['Layer No: ',num2str(aa),'  when SNR Thr: ', num2str(dSNRThreshold)]);

figure, plot(yy(aa,:),'k');hold on; plot(zz(aa,:),'r');hold on; plot(xx(aa,:),'b'); plot(qq(aa,:));hold off;axis tight;
title(['qq Layer No: ',num2str(aa),'  when SNR Thr: ', num2str(dSNRThreshold)]);
figure, imagesc(pp-qq);colorbar;
figure, imagesc(dd);colorbar;

keyboard;

figure,
subplot(211),imagesc(pdMaskDiff(:,:,nStartingFrame));colorbar;title(['pdMaskDiff for SNR Thr: ',num2str(dSNRThreshold) ]);
subplot(212),imagesc(BulkCorrectionFactor(:,:,nStartingFrame));colorbar;title(['BulkCorrectionFactor for SNR Thr: ',num2str(dSNRThreshold) ]);


figure,
subplot(211),imagesc(pdUnwrappedPhases(:,:,nStartingFrame));colorbar;title(['pdUnwrappedPhases for SNR Thr: ',num2str(dSNRThreshold) ]);
subplot(212),imagesc(BulkCorrectionFactor(:,:,nStartingFrame));colorbar;title(['BulkCorrectionFactor for SNR Thr: ',num2str(dSNRThreshold) ]);

figure,
subplot(211),imagesc(pp);colorbar;title(['Bulk motion corr phase for SNR Thr: ',num2str(dSNRThreshold) ]);
subplot(212),imagesc(pdUnwrappedPhases(:,:,nStartingFrame));colorbar;title(['pdUnwrappedPhases for SNR Thr: ',num2str(dSNRThreshold) ]);

figure,
subplot(211),imagesc(pdUnwrappedPhases1(:,:,nStartingFrame));colorbar;title(['No unwrap for SNR Thr: ',num2str(dSNRThreshold) ]);
subplot(212),imagesc(pdUnwrappedPhases(:,:,nStartingFrame));colorbar;title(['pdUnwrappedPhases for SNR Thr: ',num2str(dSNRThreshold) ]);

% 
%         
%         if(bInitialTest)
%                     TitleOfGraph='Bulk Correction Factor';
%                     plotAllPhaseInSameGraph( BulkCorrectionFactor,nStartingFrame,TitleOfGraph);
%         end

keyboard;
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


    end  % %nVoulmeNumber


end    %nFolder =nStartFolder:nEndFolder

