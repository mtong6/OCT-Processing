function[pdZP]=ZeropaddingOfRawData(pdRaw,nWavelengthPaddingFactor)
%Masum 04/27/2016

    pdFFT = fft(pdRaw);
    nMidLength = round(size(pdRaw, 1)/2 + 1);
    pdFFT(nMidLength,:) = 0.5*pdFFT(nMidLength,:);
    pdZPFFT = zeros([nWavelengthPaddingFactor*size(pdFFT, 1), size(pdFFT, 2)]);
    pdZPFFT(1:nMidLength,:) = pdFFT(1:nMidLength,:);
    pdZPFFT(end-nMidLength+2:end,:) = pdFFT(end-nMidLength+2:end,:);
    pdZP = nWavelengthPaddingFactor * ifft(pdZPFFT);
    clear pdRaw pdFFT nMidLength pdZPFFT;
     
end