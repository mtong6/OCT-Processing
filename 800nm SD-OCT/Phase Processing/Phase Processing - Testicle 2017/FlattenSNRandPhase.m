function [ pdFlattenedSNR,pdFlattenedPhase] = FlattenSNRandPhase( pdFlattenedSNR,pdFlattenedPhase,pdTissueSNR,pnFlatteningRange,nFlattenFilter )

    pdWorkingSNR = imfilter(10.0*log10(pdTissueSNR(pnFlatteningRange,:,:)), ones([nFlattenFilter,1])/nFlattenFilter, 'replicate');
    pdReferenceImage = mean(pdWorkingSNR, 3);
    pdReferenceLine = mean(pdReferenceImage, 2);
    pdReferenceFFT = fft(pdReferenceLine);
    nMidLength = round(0.5*size(pdWorkingSNR,1));
    MaskForEarthQuake=zeros(1,size(pdFlattenedSNR,2)*size(pdFlattenedSNR,3));       % Mask for earchquick Movement
    for nFrame = 1 : size(pdFlattenedSNR,3)
        for nAline = 1 : size(pdFlattenedSNR,2)
            pdCurrentLine = pdWorkingSNR(:,nAline,nFrame);
            pdCurrentFFT = fft(pdCurrentLine);
            pdCross = fftshift(ifft(pdReferenceFFT.*conj(pdCurrentFFT)));
            [dMax, nIndex] = max(pdCross((nMidLength-nFlattenFilter):(nMidLength+nFlattenFilter)));
            nShift = (nIndex+(nMidLength-nFlattenFilter)-1) - nMidLength - 1;
            MaskForEarthQuake(nFrame-1+nAline)=nShift;
            pdFlattenedSNR(:,nAline,nFrame) = circshift(pdFlattenedSNR(:,nAline,nFrame), [nShift,0]);
            pdFlattenedPhase(:,nAline,nFrame) = circshift(pdFlattenedPhase(:,nAline,nFrame), [nShift,0]);
        end % for nFrame = 1 : size(pdFlattenedSNR,2)
    end % for nFrame = 1 : size(pdFlattenedSNR,3)
    clear pdTissueSNR pdWorkingSNR pdReferenceImage pdReferenceLine pdReferenceFFT nFrame nAline pdCurrentLine pdCurrentFFT pdCross dMax nIndex;

end

