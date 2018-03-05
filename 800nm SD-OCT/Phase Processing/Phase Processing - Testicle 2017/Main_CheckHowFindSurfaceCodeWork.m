clear all; close all;clc;

bImageShiftCheck = 1;

ddBRange = 50;
ddBOffset = 40;
pdSurfaceSettings = [50,8, 0.4, 1];  % alines, points, threshold, sink
MainVolumeOfBS=50:512;

StrFolder1 = 'M:\1310 phase data\08-19-2015\7\';

nInitVol= 1;
nVolStep =1;
nLastVolume = 1;
MeanSurface=zeros(1,nLastVolume-nInitVol+1);

for n = nInitVol:nVolStep: nLastVolume
    tic
    if (n<10)
        StrPrefix = 'I_Volume_000';
    else
        if ((9<n) && (n<100))
            StrPrefix = 'I_Volume_00';
        else
            if ((99<n) && (n<1000))
                StrPrefix = 'I_Volume_0';
            end
                        if (n>1000)
                StrPrefix = 'I_Volume_';
            end
        end
    end

    nVolNumber = n;
    StrSuffix = '.mat';
    StrFilename = sprintf('%s%s%d%s', StrFolder1, StrPrefix, nVolNumber, StrSuffix);
    disp(['loading file number' , num2str(n)]);
    load(StrFilename);
    disp('loaded.');
    pdI3DSample = (abs(pdIVolume)).^2;  
     
    nPoints = size(pdI3DSample ,1);
    nAlines = size(pdI3DSample ,2);
    nBlines = size(pdI3DSample ,3);

    StoreSurface=zeros(nAlines,nBlines);

    % Find surface for 2D-
      nBlines=50;
    for(s=50:1:nBlines)
        
    pdI=10* log10(pdI3DSample(MainVolumeOfBS,:,s));   
    Surf = FindSurface(pdI(:,:),pdSurfaceSettings,20*ones(1,size(pdI,2)));
%     
     Surf=Surf+MainVolumeOfBS(1);
     figure, plot(Surf);
    
     % plot figure    
    pddB = 10* log10(squeeze(pdI3DSample(:,:,s)));
    pddB = (253.0/ddBRange)*(ddBOffset-pddB)+256.0;
    pddB(find(pddB < 3.0  )) = 1.0;
    pddB(pddB > 256.0)       = 256.0;

    figure,imagesc((pddB(:,:)));colormap gray;title(' pdI in dB'); hold on;
    plot(Surf); title(['Surface in the Bline number before corr: ', num2str(s)]);  hold off;
    
    end
     
  
   
    SurfRefForEachVolm=floor(mean(mean(Surf(2:2045))))
    

end



















