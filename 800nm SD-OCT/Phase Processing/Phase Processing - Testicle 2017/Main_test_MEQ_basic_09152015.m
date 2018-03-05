clear all; close all;clc;
nFlattenFilter=10;

pdReferenceLine=1:2:500;
pdReferenceFFT = fft(pdReferenceLine);
figure, plot(pdReferenceFFT);

nMidLength = round(0.5*length(pdReferenceLine));
pdCurrentLine=pdReferenceLine;
pdCurrentFFT = fft(pdCurrentLine);
figure, plot(pdCurrentFFT);
pdCross = fftshift(ifft(pdCurrentFFT.*conj(pdCurrentFFT)));
[dMax, nIndex] = max(pdCross((nMidLength-nFlattenFilter):(nMidLength+nFlattenFilter)))
nShift = (nIndex+(nMidLength-nFlattenFilter)-1) - nMidLength



