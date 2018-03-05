function[pdRaw]=ReadRawDatData(strFile,nOffset,nNumberAlines,nAlineLength)

% Masum 04/27/2016

% fp = fopen(strFile, 'r', 'l');
% nStatus = fseek(fp, nOffset, 'bof');
% pdArray = fread(fp, nNumberAlines*nAlineLength, 'uint8');
% pdRaw = reshape(pdArray, nAlineLength, nNumberAlines);


nAlineLength  = 4096;
nNumberAlines = 2048;
nOffset = 2048;
fp = fopen(strFile, 'r', 'l');
nStatus = fseek(fp, nOffset, 'bof');
pdArray = fread(fp, nNumberAlines*nAlineLength, 'uint8');
pdRaw = reshape(pdArray, nAlineLength, nNumberAlines);
% close fp;

end