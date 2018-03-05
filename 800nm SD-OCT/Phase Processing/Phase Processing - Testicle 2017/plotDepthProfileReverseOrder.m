function[]=plotDepthProfileReverseOrder(DepthProfilepdPeakSNR,nVolNumber)
           
           % for threshold line
           nSNRThreshold=20      %dB
           
           SNRthrLine=ones(1,size(DepthProfilepdPeakSNR,1)) .*nSNRThreshold;
           
           figure(),
            
             plot(DepthProfilepdPeakSNR,'k','LineWidth', 2);
            title([ 'Depth Profile pdPeakSNR of Volume: ',num2str(nVolNumber) ]);
            set(gca, 'ydir', 'reverse');
            view(-90,-90);xlim([0, length(DepthProfilepdPeakSNR)]);hold on;
            plot(SNRthrLine,'r','LineWidth', 2);
%             plot([length(DepthProfilepdPeakSNR); length(DepthProfilepdPeakSNR)], [4; 9], 'k',  'LineWidth', 2);hold off;
%             set(gca,'ycolor',[1 1 1]);
%             axis off;
end