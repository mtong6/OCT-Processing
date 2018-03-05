function [ CorrMatrixFiltered ] = FilterCorrMatrixRow( B,nCorrelationLayerToBeFiletr)
if(nCorrelationLayerToBeFiletr==1)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
    [row0 col0]= find(CorrMapVector==0);  % if col0 is empty, isempty=1;
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2))
    
CorrMapVector = B(:,i);
CorrMapVector_1=B(:,i-1);
CorrMapVector1=B(:,i+1);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end      
   
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end

end
CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==2)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0)  % if col0 is empty, isempty=1;
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-1)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end

end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==3)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-2)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==4)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-3)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==5)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0)) )
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-4)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==6)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0)) )
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-5)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;
if(nCorrelationLayerToBeFiletr==7)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     CorrMapVector7 = B(:,i+7);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-6)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);
CorrMapVector7 = B(:,i+7);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;
if(nCorrelationLayerToBeFiletr==8)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     CorrMapVector7 = B(:,i+7);
     CorrMapVector8 = B(:,i+8);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-7)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);
CorrMapVector7 = B(:,i+7);
CorrMapVector8 = B(:,i+8);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==9)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     CorrMapVector7 = B(:,i+7);
     CorrMapVector8 = B(:,i+8);
     CorrMapVector9 = B(:,i+9);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-8)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);
CorrMapVector7 = B(:,i+7);
CorrMapVector8 = B(:,i+8);
CorrMapVector9 = B(:,i+9);

[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==10)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     CorrMapVector7 = B(:,i+7);
     CorrMapVector8 = B(:,i+8);
     CorrMapVector9 = B(:,i+9);
     CorrMapVector10 = B(:,i+10);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-9)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);
CorrMapVector7 = B(:,i+7);
CorrMapVector8 = B(:,i+8);
CorrMapVector9 = B(:,i+9);
CorrMapVector10 = B(:,i+10);
[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;
if(nCorrelationLayerToBeFiletr==11)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     CorrMapVector7 = B(:,i+7);
     CorrMapVector8 = B(:,i+8);
     CorrMapVector9 = B(:,i+9);
     CorrMapVector10 = B(:,i+10);
     CorrMapVector11 = B(:,i+11);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-10)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);
CorrMapVector7 = B(:,i+7);
CorrMapVector8 = B(:,i+8);
CorrMapVector9 = B(:,i+9);
CorrMapVector10 = B(:,i+10);
 CorrMapVector11 = B(:,i+11);
[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==12)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     CorrMapVector7 = B(:,i+7);
     CorrMapVector8 = B(:,i+8);
     CorrMapVector9 = B(:,i+9);
     CorrMapVector10 = B(:,i+10);
     CorrMapVector11 = B(:,i+11);
     CorrMapVector12 = B(:,i+12);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)==0)&& (CorrMapVector12(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-11)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);
CorrMapVector7 = B(:,i+7);
CorrMapVector8 = B(:,i+8);
CorrMapVector9 = B(:,i+9);
CorrMapVector10 = B(:,i+10);
CorrMapVector11 = B(:,i+11);
CorrMapVector12 = B(:,i+12);
 
[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)==0)&&(CorrMapVector12(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==13)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     CorrMapVector7 = B(:,i+7);
     CorrMapVector8 = B(:,i+8);
     CorrMapVector9 = B(:,i+9);
     CorrMapVector10 = B(:,i+10);
     CorrMapVector11 = B(:,i+11);
     CorrMapVector12 = B(:,i+12);
     CorrMapVector13 = B(:,i+13);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)==0)&& (CorrMapVector12(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)==0)&& (CorrMapVector12(npoints)==0)&& (CorrMapVector13(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-12)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);
CorrMapVector7 = B(:,i+7);
CorrMapVector8 = B(:,i+8);
CorrMapVector9 = B(:,i+9);
CorrMapVector10 = B(:,i+10);
CorrMapVector11 = B(:,i+11);
CorrMapVector12 = B(:,i+12);
CorrMapVector13 = B(:,i+13);
 
[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)==0)&&(CorrMapVector12(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)==0)&&(CorrMapVector12(npoints)==0)&&(CorrMapVector13(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;

if(nCorrelationLayerToBeFiletr==14)
for i= 1:size(B,2)
   if (i==1)
       
     CorrMapVector = B(:,i);  
     CorrMapVector1 = B(:,i+1);
     CorrMapVector2 = B(:,i+2);
     CorrMapVector3 = B(:,i+3);
     CorrMapVector4 = B(:,i+4);
     CorrMapVector5 = B(:,i+5);
     CorrMapVector6 = B(:,i+6);
     CorrMapVector7 = B(:,i+7);
     CorrMapVector8 = B(:,i+8);
     CorrMapVector9 = B(:,i+9);
     CorrMapVector10 = B(:,i+10);
     CorrMapVector11 = B(:,i+11);
     CorrMapVector12 = B(:,i+12);
     CorrMapVector13 = B(:,i+13);
     CorrMapVector14 = B(:,i+14);
     
    [row0 col0]= find(CorrMapVector==0); 
      if(isempty(col0)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)~=0))||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)~=0))|| ((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)==0)&& (CorrMapVector12(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)==0)&& (CorrMapVector12(npoints)==0)&& (CorrMapVector13(npoints)~=0))...
                            ||((CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&& (CorrMapVector2(npoints)==0)&& (CorrMapVector3(npoints)==0)&& (CorrMapVector4(npoints)==0)&& (CorrMapVector5(npoints)==0)&& (CorrMapVector6(npoints)==0)&& (CorrMapVector7(npoints)==0)&& (CorrMapVector8(npoints)==0)&& (CorrMapVector9(npoints)==0)&& (CorrMapVector10(npoints)==0)&& (CorrMapVector11(npoints)==0)&& (CorrMapVector12(npoints)==0)&& (CorrMapVector13(npoints)==0)&& (CorrMapVector14(npoints)~=0)))
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end                    
             end
      end
      
   elseif(i>1 && i<size(B,2)-13)
       
CorrMapVector_1=B(:,i-1);   
CorrMapVector = B(:,i);
CorrMapVector1=B(:,i+1);
CorrMapVector2=B(:,i+2);
CorrMapVector3=B(:,i+3);
CorrMapVector4 = B(:,i+4);
CorrMapVector5 = B(:,i+5);
CorrMapVector6 = B(:,i+6);
CorrMapVector7 = B(:,i+7);
CorrMapVector8 = B(:,i+8);
CorrMapVector9 = B(:,i+9);
CorrMapVector10 = B(:,i+10);
CorrMapVector11 = B(:,i+11);
CorrMapVector12 = B(:,i+12);
CorrMapVector13 = B(:,i+13);
CorrMapVector14 = B(:,i+14);
 
[row col]= find(CorrMapVector==0);
 if(isempty(col)==0)     
    
                for npoints =1:1:size(CorrMapVector,1)
                    if(((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)~=0) && (CorrMapVector(npoints)==0))||((CorrMapVector_1(npoints)~=0) && (CorrMapVector1(npoints)==0) && (CorrMapVector(npoints)==0)&&(CorrMapVector2(npoints)~=0))|| ((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)==0)&&(CorrMapVector12(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)==0)&&(CorrMapVector12(npoints)==0)&&(CorrMapVector13(npoints)~=0))...
                           ||((CorrMapVector_1(npoints)~=0) && (CorrMapVector(npoints)==0) && (CorrMapVector1(npoints)==0)&&(CorrMapVector2(npoints)==0)&&(CorrMapVector3(npoints)==0)&&(CorrMapVector4(npoints)==0)&&(CorrMapVector5(npoints)==0)&&(CorrMapVector6(npoints)==0)&&(CorrMapVector7(npoints)==0)&&(CorrMapVector8(npoints)==0)&&(CorrMapVector9(npoints)==0)&&(CorrMapVector10(npoints)==0)&&(CorrMapVector11(npoints)==0)&&(CorrMapVector12(npoints)==0)&&(CorrMapVector13(npoints)==0)&&(CorrMapVector14(npoints)~=0))) 
                    CorrMapVector(npoints)=1;
                    B(npoints,i)=1;
                    end
                    
                end
 end  
 
   else
     CorrMapVector = B(:,i);  
     CorrMapVector_1 = B(:,i-1);
    [row2 col2]= find(CorrMapVector==0); 
    
      if(isempty(col2)==0) 
           for npoints =1:1:size(CorrMapVector,1)
                    if((CorrMapVector(npoints)==0) && (CorrMapVector_1(npoints)~=0))
                    CorrMapVector(npoints)=1;  
                    B(npoints,i)=1;
                    end
                    
             end   
      end
   end
end


end

CorrMatrixFiltered=B;
end

