%{
Michael Kyzar
BME 210
HW 2
%}
clear; clf; clc; 
% Setting Initial Values
h = 0.0001;
tRange= [0:h:1/60]; 
n = round(((tRange(2)-tRange(1)/h)+1));
% Setting up Vectors
L(1:n) = 0; R(1:n) = 0; D(1:n) = 0; LR(1:n) = 0; LD(1:n) = 0;
L0 = 11;  R0 = 11;  D0 = 11;  LR0 = 0; LD0 = 0;
C0 = [11,11,11,0,0];
%ODE45
options = odeset('RelTol',1.0e-5,'AbsTol',1.0e-5);
[tt,CC] = ode45(@DE1,tRange,C0,options);

% Plotting
%L
subplot(3,2,1)
plot(tt,CC(:,1))
title('L: ODE45 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')
%R
subplot(3,2,2)
plot(tt,CC(:,2))
title('R: ODE45 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')
%D
subplot(3,2,3)
plot(tt,CC(:,3))
title('D:  ODE45 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')
%LR
subplot(3,2,4)
plot(tt,CC(:,4))
title('LR: ODE45 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')
%LD
subplot(3,2,[5,6])
plot(tt,CC(:,5))
title('LD: ODE45 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')