function [ pdFlattenedSNR,pdFlattenedPhase,MaskEartquake] =DoFlattenAndFindMEQ( pdFlattenedSNR,pdFlattenedPhase,pdTissueSNR,pnFlatteningRange,nFlattenFilter )
% Modified: 09152015

    pdWorkingSNR = imfilter(10.0*log10(pdTissueSNR(pnFlatteningRange,:,:)), ones([nFlattenFilter,1])/nFlattenFilter, 'replicate');
   
    bCheckCrossCorr=0;   
    
    if(bCheckCrossCorr)
  % Just to show how cross corr work
    nFrameToBeAnalyzed=1;
    nAlineToBeAnalyzed=822;
    RefLine=mean(pdWorkingSNR(:,:,nFrameToBeAnalyzed), 2); 
    figure,subplot(121), plot(pnFlatteningRange,RefLine,'k', 'LineWidth', 2); title(['ref avg Aline of frame : ', num2str(nFrameToBeAnalyzed)]);set(gca, 'ydir', 'reverse');
        view(-90,-90);ylim([0 ,30]);
        xlim([min(pnFlatteningRange), max(pnFlatteningRange)]);
    subplot(122), plot(pnFlatteningRange,pdWorkingSNR(:,nAlineToBeAnalyzed,nFrameToBeAnalyzed),'k', 'LineWidth', 2); title('Any A line');set(gca, 'ydir', 'reverse');
        view(-90,-90);xlim([min(pnFlatteningRange), max(pnFlatteningRange)]);ylim([0 ,30]);
    figure, imagesc(pdWorkingSNR(:,:,nFrameToBeAnalyzed));colormap gray;
    end   %if(bCheckCrossCorr)
    


    nMidLength = round(0.5*size(pdWorkingSNR,1));
    
    MaskEartquake=zeros(1, size(pdFlattenedSNR,2)*size(pdFlattenedSNR,3));    % correct for earthquake movement
    
    for nFrame = 1 : size(pdFlattenedSNR,3)
      pdReferenceLine = mean(pdWorkingSNR(:,:,nFrame), 2);     
      pdReferenceFFT = fft(pdReferenceLine);
        for nAline = 1 : size(pdFlattenedSNR,2)
            pdCurrentLine = pdWorkingSNR(:,nAline,nFrame);
            pdCurrentFFT = fft(pdCurrentLine);
            pdCross = fftshift(ifft(pdReferenceFFT.*conj(pdCurrentFFT)));
            [dMax, nIndex] = max(pdCross((nMidLength-nFlattenFilter):(nMidLength+nFlattenFilter)));  
             nShift = (nIndex+(nMidLength-nFlattenFilter)-1) - nMidLength-1;                                
            pdFlattenedSNR(:,nAline,nFrame) = circshift(pdFlattenedSNR(:,nAline,nFrame), [nShift,0]);
            pdFlattenedPhase(:,nAline,nFrame) = circshift(pdFlattenedPhase(:,nAline,nFrame), [nShift,0]);
            % store earthquake shift
            MaskEartquake((nFrame-1)*size(pdWorkingSNR,2)+nAline)=nShift;           
%             (MaskEartquake<1)==1;                                                %logical 0 or 1;
                                           
        end % for nFrame = 1 : size(pdFlattenedSNR,2)
    end % for nFrame = 1 : size(pdFlattenedSNR,3)
    
     if(bCheckCrossCorr)
    figure, plot(MaskEartquake((nFrameToBeAnalyzed-1)* size(pdFlattenedSNR,2)+1:nFrameToBeAnalyzed*size(pdFlattenedSNR,2)));
     end

     clear pdTissueSNR pdWorkingSNR pdReferenceImage pdReferenceLine pdReferenceFFT nFrame nAline pdCurrentLine pdCurrentFFT pdCross dMax nIndex;

end

