%{
Michael Kyzar - 1212768013
BME 210: Biomedical Computer Simulation Methods
7th March 2019
hw3c
%}
clear; clc;
% Opening Data
load('variablesAB.mat')

% LU Decomposition
[L,U] = hw3a(A)

% Forwards/Backwards Substitution Solving

x = hw3b(L,U,B)