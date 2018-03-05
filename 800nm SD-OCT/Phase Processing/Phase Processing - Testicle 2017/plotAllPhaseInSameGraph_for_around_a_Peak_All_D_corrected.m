function []=plotAllPhaseInSameGraph_for_around_a_Peak_All_D_corrected( SavePhaseDiffB4NoiseD,SavePhaseDiffAfterNoiseD,SaveAvgSNRD,SavePhaseNoiseD,nStartingFrame,bFinalMasking,tStart,tEnd,bPlotTimeWise,EP,title)
% Masum 0707015---modified: 07272015
%{ 
% to plot data around a selected peak point
% all data are 2D format
code for:
1. If time wise plot: go for masking and no masking.
2. If frame wise plot: go for masking and no masking.

%}

SelectedEPPoints=(tStart*10:tEnd*10);
EP=EP(:,SelectedEPPoints);

    SpecificTimeStamp=(tStart:0.1:tEnd);
    
    if(bFinalMasking==0)   % Timewise 0=No masking; 1=Masking


        % For Phase Diff B4 Noise suppression
        PhaseDiffB4Noise=SavePhaseDiffB4NoiseD(:,SelectedEPPoints);
        TitleOfGraph='   Phase Difference before Theoritical Noise suppression-No Masking';
        TitleOfGraph=strcat(title,TitleOfGraph);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffB4Noise,SpecificTimeStamp,TitleOfGraph,EP)
          
        % For Phase Diff after Noise suppression
        PhaseDiffAfterNoise=SavePhaseDiffAfterNoiseD(:,SelectedEPPoints);
        TitleOfGraph2='  Phase Difference after Theoritical Noise suppression-No Masking';
        TitleOfGraph2=strcat(title,TitleOfGraph2);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffAfterNoise,SpecificTimeStamp,TitleOfGraph2,EP)

        % For Phase Diff Before Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,SelectedEPPoints);
        TitleOfGraph4='  Theoritycal Noise with PhaseDiffB4Noise-No Masking'; %#ok<NASGU>
        TitleOfGraph4=strcat(title,TitleOfGraph4);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffB4Noise,TheoryticalNoise ,SpecificTimeStamp,TitleOfGraph4,EP); %#ok<NOPRT,NOPRT>


        % For Phase Diff after Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,SelectedEPPoints);        
        TitleOfGraph3='  Theoritycal Noise with PhaseDiffAfterNoise-No Masking'; %#ok<NASGU>
        TitleOfGraph3=strcat(title,TitleOfGraph3);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffAfterNoise,TheoryticalNoise ,SpecificTimeStamp,TitleOfGraph3,EP); %#ok<NOPRT,NOPRT>



    else

      
        % For Phase Diff B4 Noise suppression
        PhaseDiffB4Noise=SavePhaseDiffB4NoiseD(:,SelectedEPPoints);
        TitleOfGraph='   Phase Difference before Theoritical Noise suppression- Masking';
        TitleOfGraph=strcat(title,TitleOfGraph);
       %         plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffB4Noise,SpecificTimeStamp,TitleOfGraph,EP)
          
        % For Phase Diff after Noise suppression
        PhaseDiffAfterNoise=SavePhaseDiffAfterNoiseD(:,SelectedEPPoints);
        TitleOfGraph2=' Phase Diff after Noise supp-Masking';
        TitleOfGraph2=strcat(title,TitleOfGraph2);
         plotSeveralPhaseLayersTogetherInSubPlotFormat(PhaseDiffAfterNoise,SpecificTimeStamp,TitleOfGraph2,EP)


        % For Phase Diff Before Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,SelectedEPPoints);
        TitleOfGraph4='Theoritycal Noise with PhaseDiffB4Noise-Masking'; %#ok<NASGU>
        TitleOfGraph4=strcat(title,TitleOfGraph4);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffB4Noise,TheoryticalNoise ,SpecificTimeStamp,TitleOfGraph4,EP); %#ok<NOPRT,NOPRT>


        % For Phase Diff after Noise suppression and Theorytical Noise
        TheoryticalNoise=SavePhaseNoiseD(:,SelectedEPPoints);
        TitleOfGraph3='Theoritycal Noise with PhaseDiffAfterNoise-Masking'; %#ok<NASGU>
        TitleOfGraph3=strcat(title,TitleOfGraph3);
%         plotSeveralPhaseLayersTogetherInSubPlotFormat_TN(PhaseDiffAfterNoise,TheoryticalNoise ,SpecificTimeStamp,TitleOfGraph3,EP); %#ok<NOPRT,NOPRT>
        
        
    end % if(bFinalMasking==0)   % Timewise 0=No masking; 1=Masking


end