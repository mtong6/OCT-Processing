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
        clear pdNoiseLevel;

        %% flatten around peak and generate mask matrix

        pdFlattenedSNR = pdSNR;
        pdFlattenedPhase = pdPhase;
        pdTissueSNR = pdSNR(pnTissueRange,:,:);



        pdWorkingSNR = imfilter(10.0*log10(pdTissueSNR(pnFlatteningRange,:,:)), ones([nFlattenFilter,1])/nFlattenFilter, 'replicate');

        nMidLength = round(0.5*size(pdWorkingSNR,1));
       
        for nFrame = 1 : 1  %size(pdFlattenedSNR,3)
            pdReferenceLine = mean(pdWorkingSNR(:,:,nFrame), 2);
            figure, plot(pdReferenceLine);
            pdReferenceFFT = fft(pdReferenceLine);
            for nAline = 100 :100 %size(pdFlattenedSNR,2)
%                  pdCurrentLine = pdWorkingSNR(:,nAline,nFrame);
                 pdCurrentLine=circshift(pdReferenceLine,-8);
%                  pdCurrentLine(end-3:end)=0;
                figure, plot(pdCurrentLine);title('pdCurrentLine')
                pdCurrentFFT = fft(pdCurrentLine);                
                pdCross = fftshift(ifft(pdReferenceFFT.*conj(pdCurrentFFT)));
                figure, plot(pdCross); title('pdCross');

                %             keyboard;
%                 selectedCross=pdCross((nMidLength-nFlattenFilter):(nMidLength+nFlattenFilter));
%                 figure, plot(selectedCross); title('selectedCross');
%                 [dMax, nIndex] = max(selectedCross);
%                 nShift = (nIndex+(nMidLength-nFlattenFilter)-1) - nMidLength-1
%                 nShift1 = nIndex-nFlattenFilter-2;
                
                % Or
                 [dMaxf, nIndexf] = max(pdCross);
                 nShiftf=nIndexf-nMidLength-1              


            end % for nFrame = 1 : size(pdFlattenedSNR,2)
        end % for nFrame = 1 : size(pdFlattenedSNR,3)



    end  % %nVoulmeNumber


end    %nFolder =nStartFolder:nEndFolder
