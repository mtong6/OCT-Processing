function [ ] = PlotDepthProfile( pdAverageDepthProfile,pnTissueRange,pnNoiseRange )

    pdGraphLine = 10.0*log10(pdAverageDepthProfile);
    pnX = 1:length(pdGraphLine);
    figure;
    plot(pnX, pdGraphLine);
    hold on;
    plot(pnTissueRange, pdGraphLine(pnTissueRange), 'r');
    plot(pnNoiseRange, pdGraphLine(pnNoiseRange), 'g');
    hold off;
    title('average I (dB)');

end

