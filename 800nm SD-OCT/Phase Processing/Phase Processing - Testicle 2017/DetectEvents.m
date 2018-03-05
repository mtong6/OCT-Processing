
function [NumberofEvent]=DetectEvents(th,a)
% Masum 03152015
ab=abs(a);
event=find(ab>th);
consecutive=diff(event);

if(length(consecutive)>1)
    
    nevent=0;

    for(i=1:1:length(consecutive)-1)

        if(consecutive(i)==1)

            if((consecutive(i)==1) && (consecutive(i+1)~=1))
                nevent=nevent+1;
            else
                nevent=nevent;
            end
        end

    end %for(i=1:1:length(consecutive)-1)
    
    % take care of last digit
    if( consecutive(end)==1)
        NumberofEvent=nevent+1;
    else
        NumberofEvent=nevent;
    end %if( consecutive(end)==1)

else
    NumberofEvent=0;
end %(length(consecutive)>0)

end