function[SurfRef]=FindSurfacePostion(nFrameNumber,nDepthAutoCorrelation,pdIVolume,pdSurfaceSettings,ddBRange,ddBOffset)       
% f=figure();
%Masum 09112015
for(s=1:1:nFrameNumber)   %nFrameNumber

            pdI=10* log10(pdIVolume(nDepthAutoCorrelation:end,:,s));
            Surf = FindSurface(pdI(:,:),pdSurfaceSettings,20*ones(1,size(pdI,2)));%
            Surf=Surf+nDepthAutoCorrelation;

%             figure, plot(Surf);
%             % plot figure
            pddB = 10* log10(squeeze(pdIVolume(:,:,s)));
            pddB = (253.0/ddBRange)*(ddBOffset-pddB)+256.0;
            pddB(find(pddB < 3.0  )) = 1.0;
            pddB(pddB > 256.0)       = 256.0;

        SurfRef1(s)=floor(mean(mean(Surf(2:2045))));           
% figure(f),imagesc((pddB(:,:)));colormap gray;title(' pdI in dB'); hold on;
%             plot(Surf); title(['Surface in the Bline number before corr: ', num2str(s)]);  hold off;
% 
%          pause(.2)
        end
        
       SurfRef=floor(mean(SurfRef1)); 
end