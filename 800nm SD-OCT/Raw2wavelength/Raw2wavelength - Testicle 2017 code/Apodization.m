function[pdRounded]=Apodization(pdRaw,nRoundLength)
 % Masum 04/27/2016
 % rounding off
 
    pdMask = zeros([size(pdRaw, 1), 1]);
    pdMask(nRoundLength:end-nRoundLength+1) = 1;
    pdMask(1     :     nRoundLength) = 0.5*(1.0-cos((pi/nRoundLength)*(0:nRoundLength-1)));
    pdMask(end-nRoundLength+1 : end) = 0.5*(1.0+cos((pi/nRoundLength)*(0:nRoundLength-1)));
    pdRounded = pdRaw .* repmat(pdMask, [1, size(pdRaw, 2)]);
    clear nRoundLength pdMask pdRaw;
    
end