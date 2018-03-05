function[B_c]=DeleteSingleOne(B)
%Masum 10/07/2016


    B_c=B;
    for i= 1:size(B,2)
        
        
        %% for first point
        
        if (i==1)
            CorrMapVector = B(:,i);
            CorrMapVector1 = B(:,i+1);
            [row0 col0]= find(CorrMapVector==0);  % if col0 is empty, isempty=1;
            %         keyboard;
            if(isempty(col0)==0)
                %             disp('First point is 0, do nothing'); % if 0,0 or 0,1
                
            else
                %             disp('First point is 1,');
                
                if((CorrMapVector(1)==1) && (CorrMapVector1(1)==0))  % if 1,0
                    B_c(i)=0;
                end % if 1,0
                
            end %if(isempty(col0)==1)
            
        end%  if (i==1)
        
        %% last point of the data
        
        if (i==length(B))
            CorrMapVector = B(i);
            CorrMapVector_1 = B(i-1);
            [rowL colL]= find(CorrMapVector==0);  % if col0 is empty, isempty=1;
            %         keyboard;
            if(isempty(colL)==0)
%                 disp('First point is 0, do nothing'); % if 0,0 or 1,0
            else
%                 disp('First point is 1,');
                
                if((CorrMapVector(1)==1) && (CorrMapVector_1(1)==0))  % if 1,1 or 0,1
                    B_c(i)=0;
                end
                
            end %if(isempty(col0)==1)
            
        end %     if (i==length(B))
        
        
        %% in betweeen first & last point
        
        if ((i>1) && (i<length(B)))
            
            
            CorrMapVector = B(i);
            CorrMapVector_1 = B(i-1);
            CorrMapVector1 = B(i+1);
            
            if(CorrMapVector_1(1)==0)
                
                
                
                [rowM colM]= find(CorrMapVector==0);  % if col0 is empty, isempty=1;
                %         keyboard;
                if(isempty(colM)==0)
%                     disp('First point is 0, do nothing'); % if 0,0 or 0,1
                else
%                     disp('First point is 1,');
                    
                    if((CorrMapVector(1)==1) && (CorrMapVector1(1)==0))  % if 1,0
                        B_c(i)=0;
                    end
                    
                end %if(isempty(col0)==1)
                %
                
            end %if(CorrMapVector_1(1)==0)
            
        end %if ((i>=1) && (i<=length(B)))
        
    end %for i= 1:size(B,2)
    
end