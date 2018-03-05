function [y_td_filtered] = FilterNoiseFrequencies(y_td_unfiltered, SamplingRate, NoiseFrequencies, BandHalfWidth, LowPassCutOff, nSegmentSize, bFilterMethod, bHammingOn, bShowFigure)
% Shahid 03-07-2013

%% For Preserving the original length of input and zero-padding
nOrigLength = length(y_td_unfiltered);
nNewLength = 2^nextpow2(nOrigLength);
y_td_unfiltered_newL = (1:nNewLength)*0;
y_td_unfiltered_newL(1:nOrigLength) = y_td_unfiltered;

%% Preparing for filtering to be done in chunk (one segment at a time)
% removing specified frequencies and applying a low pass filter

nNumberofSegment = round(nNewLength/nSegmentSize);

nPaddingFactor = 1;


for nSegment = 1:nNumberofSegment
    
    y_td_temp = zeros(1, nSegmentSize*nPaddingFactor);
    
    nStart = (nSegment-1)*nSegmentSize + 1;
    nEnd = nSegment*nSegmentSize;
    
    y_td_temp(1:nSegmentSize) = y_td_unfiltered_newL(nStart:nEnd);
    [y_td_temp y_fd_temp] = RemoveSelectedFreq(y_td_temp, SamplingRate, NoiseFrequencies, BandHalfWidth, bFilterMethod, bHammingOn, bShowFigure);
    
    if(LowPassCutOff~=0)
        [y_td_temp] = LowPassFilter(y_td_temp, SamplingRate, LowPassCutOff, bShowFigure);
    end
    
    
    y_td_temp(nSegmentSize+1:end) = [];
    y_td_unfiltered_newL(nStart:nEnd) = y_td_temp;   
    clear y_td_temp;
end

%% removing the padded zeros and restoring the original length
y_td_filtered = y_td_unfiltered_newL(1:nOrigLength);


