
%Masum
%Test detection of consecutive 1

clc;clear all;close all;
%parameters
nConsecutiveLength=2;

%% Input data

%test data
B=[1 1 0 0 0 0 1  0 1 1 1 0 0 1 1 1  1 0  0 1 1];

[B_c]=DetectConsecutiveOne(B,nConsecutiveLength)

