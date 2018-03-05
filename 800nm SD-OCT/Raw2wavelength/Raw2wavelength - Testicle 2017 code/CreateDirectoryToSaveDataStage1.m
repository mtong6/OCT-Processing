      
function[strFolderIntensity]=CreateDirectoryToSaveDataStage1(strData,nFolder,FolderName)
% Masum 09282015
       
        strFolderIntensity = [strData,num2str(nFolder),'\',FolderName,'\'];
        strFolderIntensity = sprintf('%s', strFolderIntensity);mkdir(strFolderIntensity);

end