function [ ] = PlotAverageSNRinTissue( pdAverageImage,pnFlatteningRange )

    figure, imagesc(-10.0*log10(pdAverageImage)), colormap(gray), title('average SNR within tissue');
    hold on;
    pnX = [1, size(pdAverageImage,2)];
    pdGraphLine = [min(pnFlatteningRange), min(pnFlatteningRange)];
    plot(pnX, pdGraphLine, 'g');
    pdGraphLine = [max(pnFlatteningRange), max(pnFlatteningRange)];
    plot(pnX, pdGraphLine, 'g');
    hold off;

end

