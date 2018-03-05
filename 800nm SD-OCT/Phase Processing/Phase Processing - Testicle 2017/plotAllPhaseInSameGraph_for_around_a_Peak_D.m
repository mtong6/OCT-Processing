function []=plotAllPhaseInSameGraph_for_around_a_Peak_D( SavePhaseDiffB4NoiseD,SavePhaseDiffAfterNoiseD,SaveAvgSNRD,SavePhaseNoiseD,nStartingFrame,bFinalMasking,tStart,tEnd,bPlotTimeWise,EP,title)
% Masum 06224015
%{ 
% to plot data around a selected peak point
% all data are 2D format
code for:
1. If time wise plot: go for masking and no masking.
2. If frame wise plot: go for masking and no masking.

%}

SelectedEPPoints=(tStart:tEnd)*10;
EP=EP(:,SelectedEPPoints);

nNumberOfFrameToBeplotted=3;


if (bPlotTimeWise==1)     % 1=Plot specific time wise, 0=Frame wise

    SpecificTimeStamp=(tStart:tEnd);
    if(bFinalMasking==0)   % Timewise 0=No masking; 1=Masking


        % For Phase Diff B4 Noise suppression
        PhaseDiffB4Noise=SavePhaseDiffB4NoiseD(:,SpecificTimeStamp*10);
        TitleOfGraph='   Phase Difference before Theoritical Noise suppression-No Masking';
        TitleOfGraph=strcat(title,TitleOfGraph);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffB4Noise,SpecificTimeStamp,TitleOfGraph,EP)
          
        % For Phase Diff after Noise suppression
        PhaseDiffAfterNoise=SavePhaseDiffAfterNoiseD(:,SpecificTimeStamp*10);
        TitleOfGraph2='  Phase Difference after Theoritical Noise suppression-No Masking';
        TitleOfGraph2=strcat(title,TitleOfGraph2);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffAfterNoise,SpecificTimeStamp,TitleOfGraph2,EP)

        % For Phase Diff after Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,SpecificTimeStamp*10);
        TitleOfGraph3='  Theoritycal Noise with PhaseDiffAfterNoise-No Masking'; %#ok<NASGU>
        TitleOfGraph3=strcat(title,TitleOfGraph3);
        plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffAfterNoise,TheoryticalNoise ,SpecificTimeStamp,TitleOfGraph3,EP); %#ok<NOPRT,NOPRT>

        % For Phase Diff Before Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,SpecificTimeStamp*10);
        TitleOfGraph4='  Theoritycal Noise with PhaseDiffB4Noise-No Masking'; %#ok<NASGU>
        TitleOfGraph4=strcat(title,TitleOfGraph4);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffB4Noise,TheoryticalNoise ,SpecificTimeStamp,TitleOfGraph4,EP); %#ok<NOPRT,NOPRT>


    else

      
        % For Phase Diff B4 Noise suppression
        PhaseDiffB4Noise=SavePhaseDiffB4NoiseD(:,SpecificTimeStamp*10);
        TitleOfGraph='   Phase Difference before Theoritical Noise suppression- Masking';
        TitleOfGraph=strcat(title,TitleOfGraph);
       %         plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffB4Noise,SpecificTimeStamp,TitleOfGraph,EP)
          
        % For Phase Diff after Noise suppression
        PhaseDiffAfterNoise=SavePhaseDiffAfterNoiseD(:,SpecificTimeStamp*10);
        TitleOfGraph2='Phase Difference after Theoritical Noise suppression-Masking';
        TitleOfGraph2=strcat(title,TitleOfGraph2);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffAfterNoise,SpecificTimeStamp,TitleOfGraph2,EP)

        % For Phase Diff after Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,SpecificTimeStamp*10);
        TitleOfGraph3='Theoritycal Noise with PhaseDiffAfterNoise-Masking'; %#ok<NASGU>
        TitleOfGraph3=strcat(title,TitleOfGraph3);
        plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffAfterNoise,TheoryticalNoise ,SpecificTimeStamp,TitleOfGraph3,EP); %#ok<NOPRT,NOPRT>

        % For Phase Diff Before Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,SpecificTimeStamp*10);
        TitleOfGraph4='Theoritycal Noise with PhaseDiffB4Noise-Masking'; %#ok<NASGU>
        TitleOfGraph4=strcat(title,TitleOfGraph4);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffB4Noise,TheoryticalNoise ,SpecificTimeStamp,TitleOfGraph4,EP); %#ok<NOPRT,NOPRT>
        
        
    end % if(bFinalMasking==0)   % Timewise 0=No masking; 1=Masking




else  % for if (bPlotTimeWise==1)  

    TimeStamp=(((nStartingFrame-1)*size(SavePhaseDiffB4NoiseD,2)/100)+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(SavePhaseDiffB4NoiseD,2)/100)*0.1;
    if(bFinalMasking==0)   % No time wise 0=No masking; 1=Masking


        % For Phase Diff B4 Noise suppression
        PhaseDiffB4Noise=SavePhaseDiffB4NoiseD(:,((nStartingFrame-1)*size(SavePhaseDiffB4NoiseD,2)/100)+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(SavePhaseDiffB4NoiseD,2)/100);

        TitleOfGraph='Phase Difference before Theoritical Noise suppression-No Masking';
        plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffB4Noise,TimeStamp,TitleOfGraph,EP)

        % For Phase Diff after Noise suppression
        PhaseDiffAfterNoise=SavePhaseDiffAfterNoiseD(:,((nStartingFrame-1)*size(SavePhaseDiffB4NoiseD,2)/100)+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(SavePhaseDiffB4NoiseD,2)/100);
        TitleOfGraph2='Phase Difference after Theoritical Noise suppression-No Masking';
        plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffAfterNoise,TimeStamp,TitleOfGraph2,EP)

        % For Phase Diff after Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,((nStartingFrame-1)*size(SavePhaseDiffB4NoiseD,2)/100)+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(SavePhaseDiffB4NoiseD,2)/100);
        TitleOfGraph3='Theoritycal Noise with PhaseDiffAfterNoise-No Masking'; %#ok<NASGU>
        plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffAfterNoise,TheoryticalNoise ,TimeStamp,TitleOfGraph3,EP); %#ok<NOPRT,NOPRT>




    else

        % For Phase Diff B4 Noise suppression
        PhaseDiffB4Noise=SavePhaseDiffB4NoiseD(:,((nStartingFrame-1)*size(SavePhaseDiffB4NoiseD,2)/100)+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(SavePhaseDiffB4NoiseD,2)/100);
        PhaseDiffB4Noise(find(PhaseDiffB4Noise==0))=NaN;
        TitleOfGraph='Phase Difference before Theoritical Noise suppression-Masking';
        plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffB4Noise,TimeStamp,TitleOfGraph)

        % For Phase Diff after Noise suppression
        PhaseDiffAfterNoise=SavePhaseDiffAfterNoiseD(:,((nStartingFrame-1)*size(SavePhaseDiffB4NoiseD,2)/100)+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(SavePhaseDiffB4NoiseD,2)/100);
        PhaseDiffAfterNoise(find(PhaseDiffAfterNoise==0))=NaN;
        TitleOfGraph2='Phase Difference after Theoritical Noise suppression-Masking';
        plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffAfterNoise,TimeStamp,TitleOfGraph2)

        % For Phase Diff after Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,((nStartingFrame-1)*size(SavePhaseDiffB4NoiseD,2)/100)+1:(nStartingFrame+nNumberOfFrameToBeplotted)*size(SavePhaseDiffB4NoiseD,2)/100);
        TheoryticalNoise(find(TheoryticalNoise==0))=NaN;
        TitleOfGraph3='Theoritycal Noise with PhaseDiffB4Noise-Masking'; %#ok<NASGU>
        plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffB4Noise,TheoryticalNoise ,TimeStamp,TitleOfGraph3); %#ok<NOPRT,NOPRT>



    end  %if(bFinalMasking==0)   % No time wise 0=No masking; 1=Masking



end  % (bPlotTimeWise==1)     % 1=Plot specific time wise, 0=Frame wise


end