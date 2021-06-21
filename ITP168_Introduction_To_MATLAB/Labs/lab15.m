%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 15 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
10/24/2016  First Draft     Michael Kyzar
%}
clear; clc;

% 1. Read in the data stored in the text file ?stats.txt?
A=importdata('stats.txt');
% 2. Calculate the average value of the data
n=length(A);
sig=sum(A);
avg=sig/n;
avgLin=ones(n,1)*avg;
% 3. Plot the data as individual data points
% 4. In the same plot, plot a horizontal line that represents the average value of the data
hold on;
plot(A, '*');
plot(avgLin);
ylabel('Exam Score')
title('Exam Scores & Average')
legend('Exam Scores','Average Score')
% 5. Plot a histogram of the data
figure();
hist(A)
ylabel('Exam Score')
title('Histogram of Exam Scores')
% (6. Label each plot appropriately)

%END SCRIPT



