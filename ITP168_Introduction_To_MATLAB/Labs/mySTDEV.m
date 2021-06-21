%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 12
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/12/2016  First Draft     Michael Kyzar
%}

function [stDEV]= mySTDEV(X)
%MYSTDEV Calculates Standard Devation
% Takes the number of arguments n in a given matrix and takes the standard 
% deviation of thsee values using the equation stDEV=sqrt((xi-avg)^2/n)
N=length(X);
avg=sum(X)/N;
Xn=(X-avg);
Xn2=Xn.^2;
sumXn=sum(Xn2);
stDEV=sqrt((sumXn)/N);
end

