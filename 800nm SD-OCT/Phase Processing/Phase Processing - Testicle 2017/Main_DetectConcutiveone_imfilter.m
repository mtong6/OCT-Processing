% masum 10/08/2016

clc;clear all;close all;

%% pamameters

nFilterLength=2;
fThreshold=0.6;

%% Data & porcess
Phase=[1 1 1 0 0 0 0 0 0  1 1 0 0 1 0 1 0 0 0 0 1 1 0 0 0 0 0 0 1 0 1 1 1 1 0 0 0 0 0 0 1 1 0 0 1 0 1 0 1 1 0 0 0 0 1 1 0 0 1 0 1];

PhaseFilt=imfilter(Phase,ones(1,nFilterLength)/nFilterLength,'replicate');
figure,
plot(Phase,'k');hold on;
plot(PhaseFilt,'r');hold on;

PhaseFilt(find(PhaseFilt<fThreshold))=0;

figure,
plot(Phase,'k');hold on;
plot(PhaseFilt,'b');hold off;
ylim([-0.1 1.1])