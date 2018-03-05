function [  ] =PlotAverageIntensity( pdAverageImage,pnTissueRange,pnNoiseRange )
    figure;
    imagesc(-10.0*log10(pdAverageImage)), colormap(gray), title('average I of all images');
    hold on;
    pnX = [1, size(pdAverageImage,2)];
    pdGraphLine = [min(pnTissueRange), min(pnTissueRange)];
    plot(pnX, pdGraphLine, 'r');
    pdGraphLine = [max(pnTissueRange), max(pnTissueRange)];
    plot(pnX, pdGraphLine, 'r');
    pdGraphLine = [min(pnNoiseRange), min(pnNoiseRange)];
    plot(pnX, pdGraphLine, 'g');
    pdGraphLine = [max(pnNoiseRange), max(pnNoiseRange)];
    plot(pnX, pdGraphLine, 'g');
    hold off;

end

