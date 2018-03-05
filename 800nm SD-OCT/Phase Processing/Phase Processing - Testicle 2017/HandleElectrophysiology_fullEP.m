function[SaveEP]=HandleElectrophysiology_fullEP(EP,nAlineNumber,nFrameNumber,nVolume)

% Masum 08302015

EP1= EP*1e6;                                                              %  converting V to uV
SaveEP = EP1(((nVolume-1)*nAlineNumber*nFrameNumber+1):(nVolume*nAlineNumber*nFrameNumber));

end
