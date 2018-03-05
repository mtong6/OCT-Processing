function [pnSurface] = FindSurface(pdI, pdParameters, pnSlide)
% function [pnSurface] = FindSurface(pdI, pdParameters, pnSlide)
% bhp 20070509

[nAlineLength, nNumberAlines] = size(pdI);
nAvgAlines = pdParameters(1);
nAvgPoints = pdParameters(2);
dThreshold = pdParameters(3);
nSink      = pdParameters(4);

% initialize local array
pd = pdI;
for nAline=1:nNumberAlines;
    pd(1:pnSlide(1, nAline), nAline) = ones(pnSlide(1, nAline, 1), 1) * pd(pnSlide(1, nAline), nAline);
end % for nAline=1:nNumberAlines;

% filter
pd = imfilter(pd, ones([nAvgPoints, nAvgAlines])/(nAvgPoints*nAvgAlines), 'replicate');

% thresholding
pdMin = min(pd, [], 1);
pdMax = max(pd, [], 1);
pdThr = dThreshold*(pdMax-pdMin)+pdMin;
pd = pd - ones(size(pd, 1), 1)*pdThr;
[pnX, pnY] = find(pd > 0);
pnSurface(flipud(pnY)) = flipud(pnX);
for nAline=1:nNumberAlines;
    if (pnSurface(1, nAline) < pnSlide(1, nAline))
        pnSurface(1, nAline) = pnSlide(1, nAline);
    end
end

% apply sink
pnSurface = pnSurface + nSink;

clear nAlineLength nNumberAlines nAvgAlines nAvgPoints dThreshold nSink;
clear pd nAline pdMin pdMax pdThr pnX pnY;
