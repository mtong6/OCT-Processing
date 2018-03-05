close all;clear all;clc;

%% set up wavelength interpolation
load Calibration.mat;
%  figure, plot(pdWavelength)
pdK = (2.0*pi) ./ pdWavelength;
dKMin = min(pdK);
dKMax = max(pdK);
pdLinK = transpose((0:size(pdK,1)-1)/(size(pdK,1)-1)*(dKMax-dKMin)+dKMin);
clear pdWavelength dKMin dKMax;
% figure, plot(pdLinK)
% keyboard;

%% load dispersion file
load Dispersion.mat;


%% load test file
strDirectory = 'S:\All\Masum\Primary code for 800 system\1\';
strDirectory2 = 'E:\New 800 code\dispersion\1\';
pstrDirectory = dir(strDirectory);

% keyboard;
%% set up figure windows
scrsz = get(groot,'ScreenSize');
nY = 3;
nBottom = 50;
nTop = 90;
nX = 5;
nLeft = 10;
nRight = 10;
nHeight = scrsz(4)-nBottom;
nWidth = scrsz(3)-nLeft;
fAbs = figure('Position',[nLeft+0*nWidth/nX nBottom+2*nHeight/3 nWidth/nX-nRight nHeight/nY-nTop]);
fAng = figure('Position',[nLeft+1*nWidth/nX nBottom+2*nHeight/3 nWidth/nX-nRight nHeight/nY-nTop]);
clear scrsz nY nBottom nTop nX nLeft nRight nHeight nWidth;

% keyboard;
for nFile = 3 :3 % length(pstrDirectory)
    
    strSubFile = pstrDirectory(nFile).name;
    strSubFile(end-3:end) = [];
    
    strFile = sprintf('%s%s.dat', strDirectory, strSubFile)
    
    nAlineLength  = 4096;
    nNumberAlines = 1024;
    nOffset = 2048;
    fp = fopen(strFile, 'r', 'l');
    nStatus = fseek(fp, nOffset, 'bof');
    pdArray = fread(fp, nNumberAlines*nAlineLength, 'uint8');
    pdRaw = reshape(pdArray, nAlineLength, nNumberAlines);
    pdRaw(:, 1:2) = [];
        figure, plot(pdRaw);
        figure, imagesc(pdRaw(:,1025:end));
         keyboard;
    nWavelengthPaddingFactor = length(pdK) / size(pdRaw, 1)
    clear strFile nAlineLength nNumberAlines nOffset fp nStatus pdArray;
    % keyboard;
    
    %% round off ends
    nRoundLength = 16;
    pdMask = zeros([size(pdRaw, 1), 1]);
    pdMask(nRoundLength:end-nRoundLength+1) = 1;
    pdMask(1     :     nRoundLength) = 0.5*(1.0-cos((pi/nRoundLength)*(0:nRoundLength-1)));
    pdMask(end-nRoundLength+1 : end) = 0.5*(1.0+cos((pi/nRoundLength)*(0:nRoundLength-1)));
    pdRounded = pdRaw .* repmat(pdMask, [1, size(pdRaw, 2)]);
    clear nRoundLength pdMask pdRaw;
    
    
    %% make sure the array goes from high wavelengths on left to low wavelengths on right
    bFlip = 1;
    if (bFlip)  pdRaw = flipud(pdRounded);  else;  pdRaw = pdRounded;  end;
    clear bFlip pdRounded;
    
    
    %% zero-pad arrays
    pdFFT = fft(pdRaw);
    nMidLength = round(size(pdRaw, 1)/2 + 1);
    pdFFT(nMidLength,:) = 0.5*pdFFT(nMidLength,:);
    pdZPFFT = zeros([nWavelengthPaddingFactor*size(pdFFT, 1), size(pdFFT, 2)]);
    pdZPFFT(1:nMidLength,:) = pdFFT(1:nMidLength,:);
    pdZPFFT(end-nMidLength+2:end,:) = pdFFT(end-nMidLength+2:end,:);
    pdZP = nWavelengthPaddingFactor * ifft(pdZPFFT);
    clear pdRaw pdFFT nMidLength pdZPFFT;
    
    
    %% apply wavelength calibration
    pdLinear = interp1(pdK, pdZP, pdLinK, 'pchip', 'extrap');
    clear pdZP;
    
  keyboard;  
    %% apply dispersion
    pdZPCorrected = pdLinear .* repmat(exp(i*pdDispersion), [1, size(pdLinear,2)]);
    %     keyboard;
    
    %% examine results
    pdProfile = fft(pdZPCorrected);
    pdLine = mean(abs(pdProfile), 2);
    figure(fAbs), imagesc(20*log10(abs(pdProfile(1:2048, :)))), colormap(gray);
    figure(fAng), imagesc((angle(pdProfile(1:1024, :)))), colormap(gray);
    title(strSubFile);
    pdLine1 = pdLine(1:2048);
    drawnow;
    keyboard;
    %% Noise
    pdNoise = (abs(pdProfile(1000:1500, :)));
    
    dNoise = 10*log10(mean(mean(pdNoise)));
    
    
    strFile = sprintf('%s%s.mat', strDirectory2, strSubFile);
    pdComplex = pdProfile(78:177,:);
    %     save(strFile, 'pdComplex');
    %     clearvars -except pdK pdDispersion pdLinK pstrDirectory strDirectory strDirectory2 fAbs fAng;
    
end
