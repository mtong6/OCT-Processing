function [pdLongTraceAll] =GenerateLongTrace_InitailTest( pdFinalPhases,nFinalFilter,nStartingFrame,bInitialTest)

% Masum 07012015

pdLongTraceAll=reshape(pdFinalPhases, size(pdFinalPhases,1), size(pdFinalPhases,2)*size(pdFinalPhases,3));

% for (i=1:1:size(pdLongTraceAll,1))
%     LongTrace = imfilter(pdLongTraceAll(i,:), ones([1,nFinalFilter])/nFinalFilter, 'replicate');
%     pdLongTraceAllFiltered(i,:)=LongTrace;
% end

%    if(bInitialTest)
%      pdLT3D=reshape(pdLongTraceAll,size(pdFinalPhases,1), size(pdFinalPhases,2),size(pdFinalPhases,3)); 
%      size(pdLT3D)
%      TitleOfGraph='Final step(after phase filter)b4 delp';
%      plotAllPhaseInSameGraph( pdLT3D,nStartingFrame,TitleOfGraph);
%      end
% 



end