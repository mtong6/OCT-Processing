
function[pdUnwrappedPhases]=UnwrapPhaseDiff(pdPeakSNR,dSNRThreshold,pdPeakPhase,nPhaseDiff)
%Masum 10152015

pdSNRMask = (10.0*log10(pdPeakSNR)) > dSNRThreshold;
pdPhaseDiff = pdPeakPhase(:,nPhaseDiff+1:end,:)  - pdPeakPhase(:,1:end-nPhaseDiff,:);
pdPhaseDiff=ConfinePhaseInBetweenPiAndMinusPi(pdPhaseDiff);
pdMaskDiff  = pdSNRMask  (:,nPhaseDiff+1:end,:) .* pdSNRMask  (:,1:end-nPhaseDiff,:);
pdUnwrappedPhases = pdPhaseDiff .* pdMaskDiff;
% Mask and unwrap phases

for nFrame = 1 : size(pdPhaseDiff,3)
    %         disp(sprintf('unwrapping frame %d', nFrame));
    for nDepth = 1 : size(pdPhaseDiff,1)
        pdLine = squeeze(pdUnwrappedPhases(nDepth,:,nFrame));
        pdCurrentMask = squeeze(pdMaskDiff(nDepth,:,nFrame));
        dLastUnmaskedValue = 0;
        bUnmaskedFound = 0;
        for nAline = 1 : length(pdLine)
            if (pdCurrentMask(nAline) == 1)
                if (bUnmaskedFound == 0)
                    bUnmaskedFound = 1;
                    dLastUnmaskedValue = pdLine(nAline);
                else % if (bUnmaskedFound == 0)
                    dDiff = pdLine(nAline) - dLastUnmaskedValue;
                    if (pi < dDiff)
                        pdLine(nAline:end) = pdLine(nAline:end) - 2*pi;
                    end % if (pi < dDiff)
                    if (dDiff < -pi)
                        pdLine(nAline:end) = pdLine(nAline:end) + 2*pi;
                    end % if (dDiff < -pi)
                    dLastUnmaskedValue = pdLine(nAline);
                end % if (bUnmaskedFound == 0)
            end % if (pdCurrentMask(nAline == 1)
        end % for nAline = 1 : length(pdLine)
        pdUnwrappedPhases(nDepth,:,nFrame) = pdLine .* pdCurrentMask;
    end % for nDepth = 1 : size(pdPhaseDiff,1)
end % for nFrame = 1 : size(pdPhaseDiff,3)
end