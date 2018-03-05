function [ output_args ] = Untitled12( pdFinalPhases, )
nFinalFilter = 7;
pdLongTrace = zeros([1, size(pdFinalPhases,2)*size(pdFinalPhases,3)]);
pdLongMask = pdLongTrace;
for nFrame = 1 : size(pdFinalPhases, 3)
    pdLongTrace(1, ((nFrame-1)*size(pdFinalPhases,2)+1):(nFrame*size(pdFinalPhases,2))) = pdFinalPhases(nDepth,:,nFrame);
    pdLongMask (1, ((nFrame-1)*size(pdFinalPhases,2)+1):(nFrame*size(pdFinalPhases,2))) = pdMaskDiff   (nDepth,:,nFrame);
end
pdLongTrace = imfilter(pdLongTrace, ones([1,nFinalFilter])/nFinalFilter, 'replicate');
plot(pdLongTrace);

end

