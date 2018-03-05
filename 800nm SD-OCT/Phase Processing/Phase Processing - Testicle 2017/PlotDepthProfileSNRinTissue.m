function [  ] = PlotDepthProfileSNRinTissue( pdAverageDepthProfile,pnFlatteningRange )

    pdGraphLine = 10.0*log10(pdAverageDepthProfile);
    pnX = 1:length(pdGraphLine);
    figure;
    plot(pnX, pdGraphLine);
    hold on;
    plot(pnFlatteningRange, pdGraphLine(pnFlatteningRange), 'g');
    hold off; title('Average depth profile in SNR');

end

