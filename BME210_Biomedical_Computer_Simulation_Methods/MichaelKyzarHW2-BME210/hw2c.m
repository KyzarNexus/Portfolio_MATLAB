%{
Michael Kyzar
BME 210
HW 2
%}
clear; clf; clc; 
% Setting Initial Values
h = 0.001;
tRange= [0 3]; 
% Setting up Vectors
C0 = [11,11,11,0,0];
%ODE45
options = odeset('RelTol',1.0e-5,'AbsTol',1.0e-5);
[tt,CC] = ode45(@DE2,tRange,C0,options);

% Plotting
%L
subplot(3,2,1)
plot(tt,CC(:,1))
title('L: Nicotine')
xlabel('Time (min)')
ylabel('Concentration (然)')
%R
subplot(3,2,2)
plot(tt,CC(:,2))
title('R: Nicotine')
xlabel('Time (min)')
ylabel('Concentration (然)')
%D
subplot(3,2,3)
plot(tt,CC(:,3))
title('D: Nicotine')
xlabel('Time (min)')
ylabel('Concentration (然)')
%LR
subplot(3,2,4)
plot(tt,CC(:,4))
title('LR: Nicotine')
xlabel('Time (min)')
ylabel('Concentration (然)')
%LD
subplot(3,2,[5,6])
plot(tt,CC(:,5))
title('LD: Nicotine')
xlabel('Time (min)')
ylabel('Concentration (然)')