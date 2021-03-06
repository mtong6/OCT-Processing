function [ VariaceOfPhase,VariaceOfPhaseFiltered,pdLongTraceAllFiltered ] =CalculateWeightedVariaceOfPhase ( pdFinalPhases,pdMaskDiff,nFinalFilter,nStdFilter,... 
    nRangeOfDataSet1,nRangeOfDataSet2,nRangeOfDataSet3,nFrametoBePloted,nDepthRange )

pdLongTraceAll=reshape(pdFinalPhases, size(pdFinalPhases,1), size(pdFinalPhases,2)*size(pdFinalPhases,3));
pdLongMaskAll=reshape(pdMaskDiff, size(pdMaskDiff,1), size(pdMaskDiff,2)*size(pdMaskDiff,3));

pdLongTraceAllFiltered=pdLongTraceAll*0;

for (i=1:1:size(pdLongTraceAll,1))
  LongTrace = imfilter(pdLongTraceAll(i,:), ones([1,nFinalFilter])/nFinalFilter, 'replicate');  
   pdLongTraceAllFiltered(i,:)=LongTrace; 
end

% PhaseSquare=pdLongTraceAllFiltered.*pdLongTraceAllFiltered;
% NumPhaseDiffSq= sum(PhaseSquare .*pdLongMaskAll);
% DenoMask=sum(pdLongMaskAll);
% 
% VariaceOfPhase=NumPhaseDiffSq./DenoMask;
% % figure, plot(VariaceOfPhase);title('Unfiltered Variace Of Phase');
% VariaceOfPhaseFiltered=imfilter(VariaceOfPhase,ones([1,nStdFilter])/nStdFilter, 'replicate');
% % figure, plot(VariaceOfPhaseFiltered);
VariaceOfPhase=0;
VariaceOfPhaseFiltered=0;
% size(pdLongTraceAllFiltered)
pdLongTraceAllFiltered3D=permute(reshape(pdLongTraceAllFiltered.',size(pdLongTraceAllFiltered,2)./100,size(pdLongTraceAllFiltered,1),[]),[2 1 3]);
% size(pdLongTraceAllFiltered3D)

%   plotAllPhaseInSameGraph( pdLongTraceAllFiltered3D,nRangeOfDataSet1,nRangeOfDataSet2,nRangeOfDataSet3,nFrametoBePloted)
  
%   plotAllPhaseInSameGraphCustomized( pdLongTraceAllFiltered3D,nRangeOfDataSet1,nRangeOfDataSet2,nRangeOfDataSet3,nFrametoBePloted,nDepthRange)
%     permute(reshape(a.',4,5,[]),[2 1 3]);

end