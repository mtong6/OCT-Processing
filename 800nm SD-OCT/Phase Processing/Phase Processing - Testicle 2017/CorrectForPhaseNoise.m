function[a,b]=CorrectForPhaseNoise(a,b)
% Masum 01272015

% a= Phase difference
% b= Noise

            for (k=1:size(a,2))
                if(a(k)<0)
                    if(abs(a(k))-b(k)<0)
                        a(k)=0;
                    end

                else
                    if((a(k)-b(k))<0)
                        a(k)=0;
                    end
                end

            end
end