function[]=SaveMatlabVariable2SpecificFolderPh(VarName,Phase,nVolume,FolderLocation)
%Masum 11192015

if (nVolume < 10)
    strIFile = sprintf('_000%d',nVolume);
    
elseif ((nVolume > 9) && (nVolume < 100))
    strIFile = sprintf('_00%d',nVolume);

elseif ((nVolume > 99) && (nVolume < 1000))
    strIFile = sprintf('_0%d',nVolume);

else
    strIFile = sprintf('_%d',nVolume);

end

FileName=sprintf('%s_%s.mat',VarName,strIFile);
SaveVar=fullfile(FolderLocation,FileName);
save(SaveVar,'Phase');

end