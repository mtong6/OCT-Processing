close all; clear all; clc;

% load('F:\testicles\20x raw data\3d_3\1\Stage01\pdIVolume__0001.mat')
% 
% for n=283:444
% depthmean = n:n;
% enface = mean(pdIVolume(depthmean,:,:),1);
% enface = squeeze(enface);
% enface = imfilter(squeeze(enface), [30 3]);
% imagesc(-enface), colormap(gray);
% % imagesc(squeeze(-enface), [-105 -50]), colormap(gray);
% % imagesc(squeeze(-enface)), colormap(gray);
% % keyboard;
% title(num2str(n));
% saveas(gcf, ['F:\testicles\20x raw data\3d_3\1\Stage01\imageenface_', num2str(n), '.png'], 'png');
% 
% end



load('F:\testicles\20x raw data\3d_2\1\Stage01\pdIVolume__0001.mat')

for n=50:250
depthmean = n:n;
enface = mean(pdIVolume(depthmean,:,:),1);
enface = squeeze(enface);
enface = imfilter(squeeze(enface), [30 3]);
imagesc(-enface, [-3200 -1300]), colormap(gray);
% imagesc(squeeze(-enface), [-105 -50]), colormap(gray);
% imagesc(squeeze(-enface)), colormap(gray);
% keyboard;
title(num2str(n));
saveas(gcf, ['F:\testicles\20x raw data\3d_3\1\Stage01\imageenface_', num2str(n), '.png'], 'png');

end


% depthmean = 400:450;
% enface = mean(pdIVolume(depthmean,:,:),1);
% % imagesc(squeeze(-enface), [-85 -60]), colormap(gray);
% imagesc(squeeze(-enface)), colormap(gray);
% title(num2str(n));


%% emptry
% load('F:\testicles\20x raw data\3d_4\1\Stage01\pdIVolume__0001.mat')
% 
% for n=250:350
% depthmean = n:n;
% enface = mean(pdIVolume(depthmean,:,:),1);
% enface = squeeze(enface);
% % enface = imfilter(squeeze(enface), [30 3]);
% imagesc(-enface), colormap(gray);
% title(num2str(n));
% saveas(gcf, ['F:\testicles\20x raw data\3d_4\1\Stage01\imageenface_', num2str(n), '.png'], 'png');
% 
% end


% 
% depthmean = 400:450;
% enface = mean(pdIVolume(depthmean,:,:),1);
% % imagesc(squeeze(-enface), [-85 -60]), colormap(gray);
% imagesc(squeeze(-enface)), colormap(gray);
% title(num2str(n));


% figure, imagesc(pdIVolume(:,:,1));
% imagesc(pdIVolume(:,:,100));
