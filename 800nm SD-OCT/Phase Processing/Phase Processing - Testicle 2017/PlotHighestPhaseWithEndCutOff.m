function[HighestPhaseVector]=PlotHighestPhaseWithEndCutOff(SavePhaseDiffAfterNoiseD)
%Masum 09162015

HighestPhaseVector=zeros(1,size(SavePhaseDiffAfterNoiseD,2));

%% Take only highest Phase value from a row


for(nRownumber=1:size(SavePhaseDiffAfterNoiseD,1))
    Phasevector=SavePhaseDiffAfterNoiseD(nRownumber,:);

    for(i=1:size(SavePhaseDiffAfterNoiseD,2))
        if(abs(Phasevector(i))>abs(HighestPhaseVector(i)))
            HighestPhaseVector(i)=Phasevector(i);
        end

    end %(i=1:size(SavePhaseDiffAfterNoiseD,2))
end  %for(nRownumber=1:size(SavePhaseDiffAfterNoiseD,1)

HighestPhaseVector(find(HighestPhaseVector==0))=NaN;



end

