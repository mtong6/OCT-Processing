
function[pdLinear]=DoWavelengthCalibration(pdWavelength,pdZP)
% Masum 04/27/2016


pdK = (2.0*pi) ./ pdWavelength;
dKMin = min(pdK);
dKMax = max(pdK);
pdLinK = transpose((0:size(pdK,1)-1)/(size(pdK,1)-1)*(dKMax-dKMin)+dKMin);
clear pdWavelength dKMin dKMax;

pdLinear = interp1(pdK, pdZP, pdLinK, 'pchip', 'extrap');

end