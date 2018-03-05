function [ pdPeakPhase,pdPeakSNR,MaskEarthquake2D] = BasicItems( bIdentifyRanges,pdI,pnTissueRange,pnNoiseRange,bNoiseSNRPeak, bFlattenAroundPeak,pdPhase,...
    nFrameNumber,nAlineNumber,nStartingFrame,pnFlatteningRange,nFlattenFilter,bInitialTest,pnPeakRange)
% Summary of this function goes here
%   Detailed explanation goes here


        %% Identify tissue and noise ranges
        if (bIdentifyRanges)
            %             disp('select tissue and noise ranges');

            pdAverageImage = mean(pdI, 3);
%              PlotAverageIntensity( pdAverageImage,pnTissueRange,pnNoiseRange ) ;           % plot average image
            %         keyboard;
            pdAverageDepthProfile = mean(pdAverageImage, 2);
%                       PlotDepthProfile(pdAverageDepthProfile,pnTissueRange,pnNoiseRange );          % plot depth profile
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


       MaskEarthquake2D=Generate2DMEQ(MaskEartquake,nFrameNumber,nAlineNumber,nStartingFrame);

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



end

