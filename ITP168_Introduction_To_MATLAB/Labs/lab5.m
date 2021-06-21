%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 5
    kyzar@usc.edu

    Revision History
Date        Changes         Name
------------------------------
09/14/2016  First Draft     Michael Kyzar
%}

clc; clear;
%Work done as a class effort

fprintf('Lab5 \n');

%Create a vecor of values from -2 to 10 with 100 elements.
vec=randi([-2,10], 1,100);
%Create a logical array for values that are positive.
idPos=vec>0;
%Sum up the logical array to determine how many positive numbers there are.
numPos=sum(idPos);
%multiply the original array by logical array to replace non-positive
%enries with zero.
vecPos=vec.*idPos;
%Sum the opsitive numbers
sumPos=sum(vecPos);
%Calculate the average of the positive numbers.
avgPos=sumPos/numPos;
    %vecNZ=vec(idPos)
    %avgPos2=sumPos/length(vecNZ)
    %avgCheck=mean(vecNZ)

%Create a vector with only the positive elements of the arrary
vecNZ=vec(idPos);
%Compute the standard deviation of the positive number.
stdevPos=sqrt(sum((vecNZ-avgPos).^2)/numPos);
    %std1Check=std(vecNZ)
    %std2Check=std(vecNZ,1)
%Output the results to the user
fprintf('Average Value: %0.2f \n',avgPos)
fprintf('Standard Deviation: %0.2f \n',stdevPos)