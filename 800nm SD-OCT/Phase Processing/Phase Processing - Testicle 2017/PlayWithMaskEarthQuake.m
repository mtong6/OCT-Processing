function[]=PlayWithMaskEarthQuake(MaskEartquake,nAlineNumber,nStartingFrame)
%Masum 08262015

%      nStartingFrame=100;
     SelectedMask=MaskEartquake(1+(nAlineNumber*(nStartingFrame-1)):nAlineNumber*nStartingFrame);
     NumberOfNoMovemntPoints=size(find(SelectedMask==0),2)     
     figure, plot(SelectedMask);
     title(['MEQ-  FN:', num2str(nStartingFrame),'  and No Movement:', num2str(NumberOfNoMovemntPoints)]);
     axis tight;





end

