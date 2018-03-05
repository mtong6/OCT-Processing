function[BulkCorrectionFactor2nd]=GenerateBulkmotionCorrFactor2ndTime(pdPeakSNR,dSNRThreshold,BulkMotionCorrPhase,nPhaseDiff,nPhaseFilterLength)
%Masum 10-20-15

        pdSNRMask = (10.0*log10(pdPeakSNR)) > dSNRThreshold;
        pdPhaseDiff = BulkMotionCorrPhase;
        pdPhaseDiff=ConfinePhaseInBetweenPiAndMinusPi(pdPhaseDiff);
 

        pdMaskDiff  = pdSNRMask  (:,nPhaseDiff+1:end,:) .* pdSNRMask  (:,1:end-nPhaseDiff,:);
        pdUnwrappedPhases = pdPhaseDiff .* pdMaskDiff;
        % Mask and unwrap phases
        pdUnwrappedPhases  = MaskAndUnwrapPhases( pdPhaseDiff,pdMaskDiff,pdUnwrappedPhases);
% 
%         for(i=1:size(pdUnwrappedPhases,1))
%             P2=pdUnwrappedPhases(i,11:2048-11,60);
% 
%             [f,Y]=FindFreqRange(P2);
%         end

        % Bulk motion Correction
        BulkCorrectionFactor2nd = BulkMotionCorrection( pdUnwrappedPhases,pdMaskDiff,nPhaseFilterLength );
        
        
end