function [pdCorrMatrix] = FindCorrelation(pdPhaseDifferences,CorrLength,CorrCtrStart)
% CorrLength =16; % change

nTopLayer=1;
nBottomLayer= size(pdPhaseDifferences,1);
nLength = CorrLength;
for k=nTopLayer:nBottomLayer-1
nInd1 = k;
nInd2 = nInd1+1;
pnCenterPoint = CorrCtrStart:size(pdPhaseDifferences,2)-floor(CorrLength/2)-1;
pdX = 0*pnCenterPoint;
pdCorrArray = 0*pnCenterPoint;

for i=1:length(pnCenterPoint);
    
    nCenterPoint = pnCenterPoint(i);

    pdLine1 = pdPhaseDifferences(nInd1,(nCenterPoint-floor(nLength/2)+1):(nCenterPoint-floor(nLength/2)+nLength));
    [dHigh1, nX1] = max(pdLine1);
    [dLow1, nY1] = min(pdLine1);

    pdLine2 = pdPhaseDifferences(nInd2,(nCenterPoint-floor(nLength/2)+1):(nCenterPoint-floor(nLength/2)+nLength));
    [dHigh2, nX2] = max(pdLine2);
    [dLow2, nY2] = min(pdLine2);

    pdAuto1 = fftshift(ifft((fft(pdLine1).*conj(fft(pdLine1)))));
    [dMax1, nIndex1] = max(abs(pdAuto1));

    pdAuto2 = fftshift(ifft((fft(pdLine2).*conj(fft(pdLine2)))));
    [dMax2, nIndex2] = max(abs(pdAuto2));

    pdCorr = fftshift(ifft((fft(pdLine1).*conj(fft(pdLine2)))));
    [dMax, nIndex] = max(abs(pdCorr));
    dMean = mean(pdCorr);
    
    nShift = nIndex - (floor(length(pdLine1) / 2) + 1);

%     figure, plot(pdLine1), hold on, plot(pdLine2, 'r'), hold off, title(sprintf('(%d->%d) %d, %f', nInd1, nInd2, nShift, (dHigh1-dLow1)*(dHigh2-dLow2)*dMax/sqrt(dMax1*dMax2)));
%     figure, plot(pdCorr), title(sprintf('(%d->%d) %f-%f=%f', nInd1, nInd2, dMax, dMean, dMax-dMean));

    pdX(i) = (dHigh1-dLow1)*(dHigh2-dLow2)*dMax/sqrt(dMax1*dMax2);
    pdCorrArray(i) = (dHigh1-dLow1)*(dHigh2-dLow2)*abs(pdCorr(floor(CorrLength/2)+1))/sqrt(dMax1*dMax2); % change
    
end

% plot(pnCenterPoint, pdX);
% title(['between layer ',num2str(nInd1),' and ',num2str(nInd2)]);
pdCorrArray = pdCorrArray(:)*10/max(pdCorrArray); pdCorrArray = pdCorrArray';
pdCorrMatrix(k,:)=pdCorrArray;

% figure, plot(pnCenterPoint, pdCorrArray); title(['Correlation between layer ',num2str(nInd1),' and ',num2str(nInd2)]);
end
