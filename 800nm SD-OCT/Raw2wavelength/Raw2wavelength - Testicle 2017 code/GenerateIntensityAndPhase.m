
function[pdI,pdPhase]=GenerateIntensityAndPhase(pdZPCorrected,nAlineLength)

% Masum 04/27/2016

pdProfile = fft(pdZPCorrected);

% figure, plot(abs(pdProfile));
% keyboard;
%Intensity
pdI=20*log10(abs(pdProfile(1:round(nAlineLength/4), :)));
%Phase
pdPhase=angle(pdProfile(1:round(nAlineLength/4), :));

end