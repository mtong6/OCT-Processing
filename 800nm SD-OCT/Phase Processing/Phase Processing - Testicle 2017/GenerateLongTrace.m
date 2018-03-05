function [pdLongTraceAllFiltered] =GenerateLongTrace( pdFinalPhases,nFinalFilter)

% Masum 07012015

pdLongTraceAll=reshape(pdFinalPhases, size(pdFinalPhases,1), size(pdFinalPhases,2)*size(pdFinalPhases,3));

for (i=1:1:size(pdLongTraceAll,1))
    LongTrace = imfilter(pdLongTraceAll(i,:), ones([1,nFinalFilter])/nFinalFilter, 'replicate');
    pdLongTraceAllFiltered(i,:)=LongTrace;
end

 

end