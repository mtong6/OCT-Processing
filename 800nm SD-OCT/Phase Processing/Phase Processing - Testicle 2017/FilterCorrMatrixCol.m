function [ FilterCorrMatrix ] = FilterCorrMatrixCol(B,nCorrDepthsToBeFiltered )

if(nCorrDepthsToBeFiltered==1)
for i= 1:size(B,1)
   if (i==1)
       
     CorrMapVector = B(i,:);  
     CorrMapVector1 = B(i+1,:);
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,2)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))
                    CorrMapVector(npoints)=1;
                    B(i,npoints)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,1))
    
CorrMapVector = B(i,:);
CorrMapVector_1=B(i-1,:);
CorrMapVector1=B(i+1,:);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,2)
                    if((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0))
                    CorrMapVector(npoints)=1;
                    B(i,npoints)=1;
                    end
                    
                end
 end      
   
   else
     CorrMapVector = B(i,:);  
     CorrMapVector_1 = B(i-1,:);
    [row2 col2]= find(CorrMapVector==0); 
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,2)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(i,npoints)=1;
                    end
                    
             end   
      end
   end
end

end
FilterCorrMatrix =B;

if(nCorrDepthsToBeFiltered==2)
for i= 1:size(B,1)
   if (i==1)
       
     CorrMapVector = B(i,:);  
     CorrMapVector1 = B(i+1,:);
     CorrMapVector2 = B(i+2,:);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,2)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(i,npoints)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,1)-1)
       
CorrMapVector_1=B(i-1,:);   
CorrMapVector = B(i,:);
CorrMapVector1=B(i+1,:);
CorrMapVector2=B(i+2,:);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,2)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(i,npoints)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(i,:);  
     CorrMapVector_1 = B(i-1,:);
    [row2 col2]= find(CorrMapVector==0); 
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,2)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(i,npoints)=1;
                    end
                    
             end   
      end
   end
end

end

FilterCorrMatrix=B;

if(nCorrDepthsToBeFiltered==3)
for i= 1:size(B,1)
   if (i==1)
       
     CorrMapVector = B(i,:);  
     CorrMapVector1 = B(i+1,:);
     CorrMapVector2 = B(i+2,:);
     CorrMapVector3 = B(i+3,:);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,2)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(i,npoints)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,1)-2)
       
CorrMapVector_1=B(i-1,:);   
CorrMapVector = B(i,:);
CorrMapVector1=B(i+1,:);
CorrMapVector2=B(i+2,:);
CorrMapVector3=B(i+3,:);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,2)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(i,npoints)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(i,:);  
     CorrMapVector_1 = B(i-1,:);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,2)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(i,npoints)=1;
                    end
                    
             end   
      end
   end
end


end

FilterCorrMatrix=B;

end






