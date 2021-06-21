%{
Michael Kyzar - 1212768013
BME 210
Homework 1
%}
% *Note: Used some of the example code for format and initial setup of the
% code
clear all; close all; clc;
% Part 2:
% Program to calculate Cardiac Output using dye dilution data
dyeData = load('DyeData_2019.txt','-ascii');
% pull out time and dye vectors from data file
D = dyeData(1,1);
t = dyeData(2:end,1); % time vector
c = dyeData(2:end,2); % concentration vector
h = t(2)-t(1); % sampling interval
n = length(t); % for generalized summation
% Initialize vector to store area under the curve and cardiac output
Area = zeros(1,3);
Q = zeros(1,3); 
% Rectangular Approximation
rA = h*sum(c);
% Trapezoid Approximation
tA = (h/2)*(c(1)+c(n))+h*sum(c);
% Simpson's Approximation
odd = c;
odd(2:2:end) = 0;
even = c;
even(1:2:end) = 0;
sA = (h/3)*( c(1) + c(n) + 4*sum(even) + 2*sum(odd) );
% Consolidating Results
Area(1) = rA; Area(2) = tA; Area(2) = sA;
Q(1) = D/Area(1); Q(2) = D/Area(2); Q(3) = D/Area(3);
fprintf('The approximations for area are as follows: \nRectangular: %.4f\nTrapezoid: %.4f\nSimpson''s: %.4f\n',rA,tA,sA)


%Graphing
figure(1)
plot(t,c,'ok')

axis([0.0 45.0 0 15])
title('Homework 1: Part 2')
xlabel('Time (s)')
ylabel('Dye Concentration (mg/L)')


% Part 4
% Pulling vectors from dataset
hemoData = load('HemodynamicData.txt','-ascii');
mesureNum = hemoData(:,1);
hemoT = hemoData(:,2);
% Pressures:
lVentP = hemoData(:,3);
aorticP = hemoData(:,4);
lVentV = hemoData(:,5);
atrialP = hemoData(:,6);
% Spline Approximation
tt = 0:0.001:0.808;
yyLVentP = spline(hemoT,lVentP,tt);
yyAorticP = spline(hemoT,aorticP,tt);
yyLVentV = spline(hemoT,lVentV,tt);
yyAtrialP = spline(hemoT,atrialP,tt);
% Graphing
figure(2)

hold on
yyaxis left
plot(tt,yyLVentP,'-k')
plot(hemoT,lVentP,'ok')

plot(tt,yyAorticP,':k')
plot(hemoT,aorticP,'sk','MarkerFaceColor','k')

plot(tt,yyAtrialP,'--k')
plot(hemoT,atrialP,'vk')

ylabel('Pressure (mmHg)')

yyaxis right
plot(tt,yyLVentV,'--k')
plot(hemoT,lVentV,'sk')

title('Homework 1: Part 4')
xlabel('Time (s)')
ylabel('Volume (mL)')
legend('Left Ventricular Pressure (Spline)','Left Ventricular Pressure','Aortic Pressure (Spline)',...
        'Aortic Pressure','Atrial Pressure (Spline)','Atrial Pressure','Left Ventricular Volume (Spline)',...
        'Left Vent Volume','location','eastoutside')




