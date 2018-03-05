
function[]=ComboDelphiB4AfterMaskSNR(SavePhaseDiffB4NoiseD1,SavePhaseDiffB4NoiseD2,SavePhaseDiffB4NoiseD3,SavePhaseDiffB4NoiseD4,...
    SavePhaseDiffB4NoiseD5,SavePhaseDiffB4NoiseD6,SavePhaseDiffB4NoiseD7,SavePhaseDiffB4NoiseD8,SaveAvgSNRD1,SaveAvgSNRD2,SaveAvgSNRD3,SaveAvgSNRD4,SaveAvgSNRD5,SaveAvgSNRD6,SaveAvgSNRD7,SaveAvgSNRD8,nInitVol,nLastVolume,...
    x,SaveEP,SaveMaskForEarthquake,SavePhaseNoiseD1,SavePhaseNoiseD2,SavePhaseNoiseD3,SavePhaseNoiseD4,SavePhaseNoiseD5,SavePhaseNoiseD6,SavePhaseNoiseD7,...
    SavePhaseNoiseD8,nAlineGap,nFinalFilter,delp,nVolNumber,SavePhaseDiffAfterNoiseD1,SavePhaseDiffAfterNoiseD2,SavePhaseDiffAfterNoiseD3,...
    SavePhaseDiffAfterNoiseD4,SavePhaseDiffAfterNoiseD5,SavePhaseDiffAfterNoiseD6,SavePhaseDiffAfterNoiseD7,SavePhaseDiffAfterNoiseD8)
%Masum 06162015

c='k';
figure;
subplot(511),plot(x,SavePhaseDiffB4NoiseD1); xlim([ min(x),max(x)]);title(['D1: AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter),...
    '  Del P: ', num2str(delp),'  Volume: ',num2str(nVolNumber) ]);% ylim([0 8e-4]);
hold on, plot(x,SavePhaseNoiseD1,'r'); hold on, plot(x,-SavePhaseNoiseD1,'r');hold off;
subplot(512),plot(x,SavePhaseDiffAfterNoiseD1,c); xlim([ min(x),max(x)]);
subplot(513), plot(x,SaveMaskForEarthquake, 'k');xlim([ min(x),max(x)]);
subplot(514), plot(x,SaveEP); xlim([ min(x),max(x)]);    %ylim([-150 150]);title('EP');
subplot(515), plot(x,SaveAvgSNRD1); xlim([ min(x),max(x)]);ylim([10 35]);title('Avg SNR');


figure;
subplot(511),plot(x,SavePhaseDiffB4NoiseD2); xlim([ min(x),max(x)]);title(['D2: AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),'  Volume: ',num2str(nVolNumber) ]);% ylim([0 8e-4]);
hold on, plot(x,SavePhaseNoiseD2,'r'); hold on, plot(x,-SavePhaseNoiseD2,'r');hold off;
subplot(512),plot(x,SavePhaseDiffAfterNoiseD2,c); xlim([ min(x),max(x)]);
subplot(513), plot(x,SaveMaskForEarthquake, 'k');xlim([ min(x),max(x)]);
subplot(514), plot(x,SaveEP); xlim([ min(x),max(x)]);    %ylim([-150 150]);title('EP');
subplot(515), plot(x,SaveAvgSNRD2); xlim([ min(x),max(x)]);ylim([10 35]);title('Avg SNR');


figure;
subplot(511),plot(x,SavePhaseDiffB4NoiseD3); xlim([ min(x),max(x)]);title(['D3: AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),'  Volume: ',num2str(nVolNumber) ]);% ylim([0 8e-4]);
hold on, plot(x,SavePhaseNoiseD3,'r'); hold on, plot(x,-SavePhaseNoiseD3,'r');hold off;
subplot(512),plot(x,SavePhaseDiffAfterNoiseD3,c); xlim([ min(x),max(x)]);
subplot(513), plot(x,SaveMaskForEarthquake, 'k');xlim([ min(x),max(x)]);
subplot(514), plot(x,SaveEP); xlim([ min(x),max(x)]);    %ylim([-150 150]);title('EP');
subplot(515), plot(x,SaveAvgSNRD3); xlim([ min(x),max(x)]);ylim([10 35]);title('Avg SNR');

figure;
subplot(511),plot(x,SavePhaseDiffB4NoiseD4); xlim([ min(x),max(x)]);title(['D4: AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),'  Volume: ',num2str(nVolNumber) ]);% ylim([0 8e-4]);
hold on, plot(x,SavePhaseNoiseD4,'r'); hold on, plot(x,-SavePhaseNoiseD4,'r');hold off;
subplot(512),plot(x,SavePhaseDiffAfterNoiseD4,c); xlim([ min(x),max(x)]);
subplot(513), plot(x,SaveMaskForEarthquake, 'k');xlim([ min(x),max(x)]);
subplot(514), plot(x,SaveEP); xlim([ min(x),max(x)]);    %ylim([-150 150]);title('EP');
subplot(515), plot(x,SaveAvgSNRD4); xlim([ min(x),max(x)]);ylim([10 35]);title('Avg SNR');

figure;
subplot(511),plot(x,SavePhaseDiffB4NoiseD5); xlim([ min(x),max(x)]);title(['D5: AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),'  Volume: ',num2str(nVolNumber) ]);% ylim([0 8e-4]);
hold on, plot(x,SavePhaseNoiseD5,'r'); hold on, plot(x,-SavePhaseNoiseD5,'r');hold off;
subplot(512),plot(x,SavePhaseDiffAfterNoiseD5,c); xlim([ min(x),max(x)]);
subplot(513), plot(x,SaveMaskForEarthquake, 'k');xlim([ min(x),max(x)]);
subplot(514), plot(x,SaveEP); xlim([ min(x),max(x)]);    %ylim([-150 150]);title('EP');
subplot(515), plot(x,SaveAvgSNRD5); xlim([ min(x),max(x)]);ylim([10 35]);title('Avg SNR');

figure;
subplot(511),plot(x,SavePhaseDiffB4NoiseD6); xlim([ min(x),max(x)]);title(['D6: AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),'  Volume: ',num2str(nVolNumber) ]);% ylim([0 8e-4]);
hold on, plot(x,SavePhaseNoiseD6,'r'); hold on, plot(x,-SavePhaseNoiseD6,'r');hold off;
subplot(512),plot(x,SavePhaseDiffAfterNoiseD6,c); xlim([ min(x),max(x)]);
subplot(513), plot(x,SaveMaskForEarthquake, 'k');xlim([ min(x),max(x)]);
subplot(514), plot(x,SaveEP); xlim([ min(x),max(x)]);    %ylim([-150 150]);title('EP');
subplot(515), plot(x,SaveAvgSNRD6); xlim([ min(x),max(x)]);ylim([10 35]);title('Avg SNR');

figure;
subplot(511),plot(x,SavePhaseDiffB4NoiseD7); xlim([ min(x),max(x)]);title(['D7: AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),'  Volume: ',num2str(nVolNumber) ]);% ylim([0 8e-4]);
hold on, plot(x,SavePhaseNoiseD7,'r'); hold on, plot(x,-SavePhaseNoiseD7,'r');hold off;
subplot(512),plot(x,SavePhaseDiffAfterNoiseD7,c); xlim([ min(x),max(x)]);
subplot(513), plot(x,SaveMaskForEarthquake, 'k');xlim([ min(x),max(x)]);
subplot(514), plot(x,SaveEP); xlim([ min(x),max(x)]);    %ylim([-150 150]);title('EP');
subplot(515), plot(x,SaveAvgSNRD7); xlim([ min(x),max(x)]);ylim([10 35]);title('Avg SNR');

figure;
subplot(511),plot(x,SavePhaseDiffB4NoiseD8); xlim([ min(x),max(x)]);title(['D8: AlineGap: ', num2str(nAlineGap),' Filter Size: ', num2str(nFinalFilter), '  Del P: ', num2str(delp),'  Volume: ',num2str(nVolNumber) ]);% ylim([0 8e-4]);
hold on, plot(x,SavePhaseNoiseD8,'r'); hold on, plot(x,-SavePhaseNoiseD8,'r');hold off;
subplot(512),plot(x,SavePhaseDiffAfterNoiseD8,c); xlim([ min(x),max(x)]);
subplot(513), plot(x,SaveMaskForEarthquake, 'k');xlim([ min(x),max(x)]);
subplot(514), plot(x,SaveEP); xlim([ min(x),max(x)]);    %ylim([-150 150]);title('EP');
subplot(515), plot(x,SaveAvgSNRD8); xlim([ min(x),max(x)]);ylim([10 35]);title('Avg SNR');
end
