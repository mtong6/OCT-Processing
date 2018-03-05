function[]=SaveMatlabVariable2SpecificFolder(VarName,var,nInitVol,nLastVolume,FolderLocation,dSNRThreshold_forMask)
%Masum 08312015
strfile=sprintf('SThr%d_Vol%d_to_Vol%d_%s.mat',dSNRThreshold_forMask,nInitVol,nLastVolume,VarName);
SaveVar=fullfile(FolderLocation,strfile);
save(SaveVar,'var');

end