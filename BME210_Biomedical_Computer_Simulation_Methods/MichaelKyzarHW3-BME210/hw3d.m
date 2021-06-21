%{
Michael Kyzar - 1212768013
BME 210: Biomedical Computer Simulation Methods
7th March 2019
hw3d
%}
clf; clear; clc;
% Initializing
load('variablesSW.mat')
load('Serror.mat')
% Solving w S & Serror
mu = linsolve(W,S);
muError = linsolve(W,Serror);
% Reshaping mu & muError
n = 50;
muEst = reshape(mu,n,n);
muErrorRes = reshape(muError,n,n);
% Reshaping Serror
% Displaying mu & muError
f1 = figure;
f2 = figure;

figure(f1);
imagesc(muEst);
colormap(gray);
figure(f2);
imagesc(muErrorRes);
colormap(gray);