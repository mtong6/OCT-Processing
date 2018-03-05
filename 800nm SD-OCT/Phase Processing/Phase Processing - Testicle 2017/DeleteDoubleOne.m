function[B_c]=DeleteDoubleOne(B)
% Masum 10/07/2016

   
B_c=B;
for i= 1:size(B,2);
    
    
    %% for first point
    
    if (i==1)
        CorrMapVector = B(i);
        CorrMapVector1 = B(i+1);
        CorrMapVector2 = B(i+2);
        
        if(CorrMapVector(1)==1)
            
            
            [rowF colF]= find(CorrMapVector==0);  % if col0 is empty, isempty=1;
            %         keyboard;
            if(isempty(colF)==0)
                %                 disp('First point is 0, do nothing'); % if 0,0 or 0,1
            else
                %                 disp('First point is 1,');
                
                if((CorrMapVector1(1)==0) && (CorrMapVector2(1)==0) || (CorrMapVector1(1)==0) && (CorrMapVector2(1)==1) || (CorrMapVector1(1)==1) && (CorrMapVector2(1)==0) )  % if  100,101,110
                    B_c(i)=0; B_c(i+1)=0;
                end
                
                
                
            end %if(isempty(col0)==1)            %
            
        end %if(CorrMapVector_1(1)==0)
        
    end%  if (i==1)
    
    
    %% last point of the data
    
    if (i==length(B))
        CorrMapVector = B(i);
        CorrMapVector_1 = B(i-1);
        CorrMapVector_2 = B(i-2);
        
        
        [rowL colL]= find(CorrMapVector==0) ; % if col0 is empty, isempty=1;
        %         keyboard;
        if(isempty(colL)==0)
            %             disp('First point is 0, do nothing'); % if 0,0 or 1,0
            if(  (CorrMapVector_2(1)==0) &&  (CorrMapVector_1(1)==1) &&(CorrMapVector(1)==0)  )  % if  010
                B_c(i-1)=0;
            end
            
            
        else
            %             disp('First point is 1,');
            
            if(   (CorrMapVector_2(1)==0) &&  (CorrMapVector_1(1)==0) &&(CorrMapVector(1)==1)|| (CorrMapVector_2(1)==0) &&  (CorrMapVector_1(1)==1) &&(CorrMapVector(1)==1)  )  % if  011,011
                B_c(i)=0;B_c(i-1)=0;
            end
            
            
        end %if(isempty(col0)==1)
        
    end %     if (i==length(B))
    
    
    %% in betweeen first & last point
    if ((i>1) && (i<length(B)-1))
        
        CorrMapVector_1 = B(i-1);
        CorrMapVector = B(i);
        CorrMapVector1 = B(i+1);
        CorrMapVector2 = B(i+2);
        
        if(CorrMapVector_1(1)==0)
            
            
            [rowM colM]= find(CorrMapVector==0);  % if col0 is empty, isempty=1;
            %         keyboard;
            if(isempty(colM)==0)
                %                 disp('First point is 0, do nothing');
                
                if( (CorrMapVector1(1)==1) && (CorrMapVector2(1)==0)) % 0,0,1,0
                    B_c(i+1)=0;
                    
                end
                
                
            else
                %                 disp('First point is 1,');
                
                if(( (CorrMapVector(1)==1) && (CorrMapVector1(1)==0) && (CorrMapVector2(1)==0)  ) ||  ( (CorrMapVector(1)==1) && (CorrMapVector1(1)==0) && (CorrMapVector2(1)==1)  ) ||  ( (CorrMapVector(1)==1) && (CorrMapVector1(1)==1) && (CorrMapVector2(1)==0)  )  )  % if 0,1,0,0  & 0 1 0 1 & 0110
                    
                    B_c(i)=0;B_c(i+1)=0;
                end
                
            end %if(isempty(col0)==1)
            %
            
        end %if(CorrMapVector_1(1)==0)
        
        
        
        
        if(CorrMapVector_1(1)==1)
            
            
            [rowM colM]= find(CorrMapVector==0);  % if col0 is empty, isempty=1;
            %         keyboard;
            if(isempty(colM)==0)
                %                 disp('First point is 0, do nothing');
                
                if( (CorrMapVector1(1)==1) && (CorrMapVector2(1)==0)) % 1,0,1,0
                    B_c(i+1)=0;
                    
                else
                    %                     disp('First point is 1,');
                    
                    if( ( (CorrMapVector(1)==1) && (CorrMapVector1(1)==0) && (CorrMapVector2(1)==0)  ) ||  ( (CorrMapVector(1)==1) && (CorrMapVector1(1)==0) && (CorrMapVector2(1)==1)  )  )  % if 1100,1101
                        
                        B_c(i-1)=0;B_c(i)=0;
                    end
                    
                end
                
            end %if(isempty(col0)==1)
            %
            
        end %if(CorrMapVector_1(1)==0)
        
        
    end %if ((i>=1) && (i<=length(B)))
    
end %for i= 1:size(B,2)

    
end