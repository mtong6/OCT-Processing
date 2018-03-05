function[CorrMapMatrix,A] = CorrMap(pdCorrMatrix)
% function[CorrMapMatrix] = CorrMap(pdCorrMatrix,nLayersToCheck,CorrThrsh)
nLayersToCheck= 3;
CorrThrsh =4.0;
%Find Depth locations of N consecutive correlation above threshold
pdCorrMatrix(find(pdCorrMatrix<CorrThrsh))=0;
pdCorrMatrix(find(pdCorrMatrix~=0))=1;
A= pdCorrMatrix;
B=0*A;
B(1:(size(B,1)-1),:)=pdCorrMatrix(2:end,:);
C=0*A;
C(1:(size(C,1)-2),:)=pdCorrMatrix(3:end,:);
D=0*A;
D(1:(size(C,1)-3),:)=pdCorrMatrix(4:end,:);

if (nLayersToCheck==2)
    MeanCorrMatrix = (A+B)/2;
end
if (nLayersToCheck==3)
    MeanCorrMatrix = (A+B+C)/3;
end
if (nLayersToCheck==4)
   MeanCorrMatrix = (A+B+C+D)/4;
end



MeanCorrMatrix(find(MeanCorrMatrix~=1))=0;

%Finding exact N depth locations corresponding to 1 match
MeanCorrMatrixB= 0*MeanCorrMatrix;
MeanCorrMatrixB(2:end,:)= MeanCorrMatrix(1:end-1,:);
MeanCorrMatrixC= 0*MeanCorrMatrix;
MeanCorrMatrixC(3:end,:)= MeanCorrMatrix(1:end-2,:);
MeanCorrMatrixD= 0*MeanCorrMatrix;
MeanCorrMatrixD(4:end,:)= MeanCorrMatrix(1:end-3,:);%
if (nLayersToCheck==2)
    MeanCorrMatrix = MeanCorrMatrix+MeanCorrMatrixB;
end
if (nLayersToCheck==3)
    MeanCorrMatrix = MeanCorrMatrix+MeanCorrMatrixB+MeanCorrMatrixC;
end

if (nLayersToCheck==4)
    MeanCorrMatrix = MeanCorrMatrix+MeanCorrMatrixB+MeanCorrMatrixC+MeanCorrMatrixD;
end
MeanCorrMatrix(find(MeanCorrMatrix>0))=1;
%For opposite color scale
% MeanCorrMatrix(find(MeanCorrMatrix==1))=10;
% MeanCorrMatrix(find(MeanCorrMatrix~=10))=1;
% MeanCorrMatrix(find(MeanCorrMatrix==10))=0;

CorrMapMatrix = MeanCorrMatrix;
end


% figure, imagesc(MeanCorrMatrix); colormap jet;
% ylabel('nLayers');
% figure, plot(pdEP(40:400));
% xlim([1 361]);
% ylabel('Voltage');

