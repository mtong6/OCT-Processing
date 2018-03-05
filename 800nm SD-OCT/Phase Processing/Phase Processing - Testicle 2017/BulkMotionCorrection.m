function [ pdMeanPhases ] = BulkMotionCorrection( pdUnwrappedPhases,pdMaskDiff,nPhaseFilterLength )

    pdMeanPhases = zeros(size(pdUnwrappedPhases));
    for nFrame = 1 : size(pdUnwrappedPhases,3);
        pdPhaseImage = squeeze(pdUnwrappedPhases(:,:,nFrame));
        pdMaskImage  = squeeze(pdMaskDiff       (:,:,nFrame));
        pdNum = imfilter(pdPhaseImage.*pdMaskImage, ones([1,nPhaseFilterLength])/nPhaseFilterLength, 'replicate');
        pdDen = imfilter(              pdMaskImage, ones([1,nPhaseFilterLength])/nPhaseFilterLength, 'replicate');
        pdMeanImage = pdNum ./ pdDen;
        pdMeanImage(isnan(pdMeanImage)) = 0;
        pdMeanImage = pdMeanImage .* pdMaskImage;
        pdMeanPhases(:,:,nFrame) = pdMeanImage;
    end % for nFrame = 1 : size(pdUnwrappedPhases,3);
    
%     pdFinalPhases = pdUnwrappedPhases - pdMeanPhases;



end

