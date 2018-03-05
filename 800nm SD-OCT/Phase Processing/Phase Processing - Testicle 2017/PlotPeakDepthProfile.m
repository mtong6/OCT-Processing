function [  ] = PlotPeakDepthProfile( pdAverageTissueLine,pnPeakRange )

    pdGraphLine = 10.0*log10(pdAverageTissueLine);title('Peak Range');
    pnX = 1 : length(pdGraphLine);
    figure, plot(pnX, pdGraphLine);
    hold on, plot(pnPeakRange, pdGraphLine(pnPeakRange), 'g'), hold off;

end

