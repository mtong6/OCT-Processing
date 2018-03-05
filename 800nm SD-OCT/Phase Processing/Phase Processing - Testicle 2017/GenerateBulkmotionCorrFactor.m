function[BulkCorrectionFactor]=GenerateBulkmotionCorrFactor(pdPeakSNR,dSNRThreshold,pdPeakPhase,nPhaseDiff,nPhaseFilterLength)
%Masum 10-01-15
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

        %         for(i=1:size(pdPhaseDiff,1))
        %             P1=pdPhaseDiff(i,11:2048-11,60);
        %
        %             [f,Y]=FindFreqRange(P1);
        %         end

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
        BulkCorrectionFactor = BulkMotionCorrection( pdUnwrappedPhases,pdMaskDiff,nPhaseFilterLength );
        
        
end