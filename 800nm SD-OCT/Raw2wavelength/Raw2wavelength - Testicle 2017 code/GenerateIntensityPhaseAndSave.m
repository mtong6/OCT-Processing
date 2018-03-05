function[]=GenerateIntensityPhaseAndSave(pnDataFileNumber,FileList,nOffset,nNumberAlines,nAlineLength,nRoundLength,bFlip,pdWavelength,pdDispersion,...
    bDispersion,nFolder ,strFolder,nVol,bSave2HD,FolderLocation)

% Masum 04/27/2016
close all;
%% set up figure windows
[f1,f2,f3]=GenerateInitialFig();
%% calculation
nFrame=1;

for nFileNumber = pnDataFileNumber;
    
    if(FileList(nFileNumber).bytes==FileList(1).bytes)
        strFilename = sprintf('%s%s',strFolder,FileList(nFileNumber).name);
    else
        strFilename = sprintf('%s%s',strFolder,FileList(nFileNumber-1).name);
    end
    
    disp(strFilename)
    %% Read raw .dat files
    [pdRaw]=ReadRawDatData(strFilename,nOffset,nNumberAlines,nAlineLength);
    
    
     pdRaw=pdRaw(:,1026:end); % for single camera
%     figure,plot(pdRaw);
%     keyboard;
    %% round off ends
    [pdRounded]=Apodization(pdRaw,nRoundLength);
    
%     figure,plot(pdRounded);
%     keyboard;
    
    %% make sure the array goes from high wavelengths on left to low wavelengths on right
    [pdRaw]=FlipIfRequired(pdRounded,bFlip);
    
    %% zero-pad arrays
    nWavelengthPaddingFactor = length(pdWavelength) / size(pdRaw, 1);
    [pdZP]=ZeropaddingOfRawData(pdRaw,nWavelengthPaddingFactor);
    %% apply wavelength calibration
    [pdLinear]=DoWavelengthCalibration(pdWavelength,pdZP);
%     xx=abs(fft(pdLinear(:,:)));
% %     
%     figure,imagesc(10*log10(xx(1:512,:)));
%     keyboard;
    %% apply dispersion
    if(bDispersion)
        pdZPCorrected = pdLinear .* repmat(exp(i*pdDispersion), [1, size(pdLinear,2)]);
    else
        pdZPCorrected = pdLinear ;
    end
    
    %% Generate intensity and phase
    [pdI,pdPhase]=GenerateIntensityAndPhase(pdZPCorrected,nAlineLength);
    
    Intensity3D(:,:,nFileNumber)=pdI;
     Phase3D(:,:,nFileNumber)=pdPhase;
%     keyboard
%    fs=figure(f1), imagesc(-pdI(200:700,:),[-75 -60]), colormap(gray);title(sprintf('Intensity in Frame number : %.d from Vol: %d ', nFrame,nVol));
    fs = figure(f1), imagesc(-pdI(200:700,:), [-100 -50]), colormap(gray); title(sprintf('Intensity in Frame number : %.d from Vol: %d ', nFrame,nVol));
%   fs = figure(f2), imagesc(-pdI(200:700,:)[-95 -50]), colormap(gray);title(sprintf('Intensity in Frame number : %.d from Vol: %d ', nFrame,nVol));

%      keyboard;
    
     %   figure(f2), imagesc(pdPhase), colormap(gray);title(sprintf('Phase in Frame number : %.d from Vol: %d ', nFrame,nVol));
  %  figure(f3),plot(mean(pdI(:,:),2)), colormap(gray);title(sprintf('DP in Frame number : %.d from Vol: %d ', nFrame,nVol));axis tight;
    
    drawnow;
    saveas(fs,[FolderLocation, num2str(nFileNumber), ' cross.jpeg']);
    nFrame=nFrame+1;
%   %  keyboard;
end % for nFileNumber = pnDataFileNumber;
% 
if(bSave2HD)
    VarName='pdIVolume';
    SaveMatlabVariable2SpecificFolderI(VarName,Intensity3D,nVol,FolderLocation)  ;
    
    VarName='pdPhaseVolume';
    SaveMatlabVariable2SpecificFolderPh(VarName,Phase3D,nVol,FolderLocation)
    
    clear Intensity3D Phase3D;
    disp(['Vol: ',num2str(nVol),' saved successfully'])
end


end