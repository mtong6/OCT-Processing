function[SaveEP]=HandleElectrophysiology(EP1,nAlineNumber,nFrameNumber,nVolume,nAlineGap,n,nInitVol)
%  SaveEP=HandleElectrophysiology(EP1,nAlineMEA,nFrameNumber,nVolume,ceil(nAlineGap/R_OCTbyMEA),n,nInitVol);
% Masum 06242015

 %             EP1 = EP1 - mean(EP1);                                         % normalizing by subtraction
        %             EP1 = FilterNoiseFrequencies(EP1, SamplingRate, NoiseFrequencies, FilterParamters(1), FilterParamters(2), FilterParamters(3), FilterParamters(4), FilterParamters(5), FilterParamters(6));
         EP1 = EP1*1e6;                                          %  converting V to uV

        %% Final plot
        EP = EP1(((nVolume-1)*nAlineNumber*nFrameNumber+1):(nVolume*nAlineNumber*nFrameNumber));
        EP1=zeros(1,(nAlineNumber-nAlineGap)*nFrameNumber);
        %     EP1(1:1022)=EP (1:1022);
        for(m=1:1:nFrameNumber)
            EP1((m-1)*(nAlineNumber-nAlineGap)+1:(nAlineNumber-nAlineGap)*m)=EP( (m-1)*(nAlineNumber)+1 : nAlineNumber*m-nAlineGap);
        end
%         SaveEP((n-nInitVol)*nFrameNumber*(nAlineNumber-nAlineGap)+1:(n-nInitVol+1)*nFrameNumber*(nAlineNumber-nAlineGap))=EP1;
  SaveEP=EP1;

         
        
        

end
