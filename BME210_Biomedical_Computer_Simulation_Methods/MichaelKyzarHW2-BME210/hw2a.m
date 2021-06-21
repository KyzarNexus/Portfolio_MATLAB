%{
Michael Kyzar
BME 210
HW 2
%}
clear; clf; clc; 
% Setting Initial Values
t0 = 0; t1 = 1/60; h = 0.0001;
n = round(((t1-t0)/h)+1);
t = linspace(t0,t1,n);

% Setting up Vectors
C = zeros(5,n);
C(1,1) = 11;  C(2,1) = 11;  C(3,1) = 11;  C(4,1) = 0;  C(5,1) = 0;
rk1(1:5) = 0; rk2(1:5) = 0;
% Setting up RK2 loop
for i = 1:(n-1)
rk1 = h*DE1(0,C(:,i));
rk2 = h*DE1(0,C(:,i)+rk1/2);
C(1,i+1) = C(1,i)+rk2(1); 
C(2,i+1) = C(2,i)+rk2(2); 
C(3,i+1) = C(3,i)+rk2(3);
C(4,i+1) = C(4,i)+rk2(4);
C(5,i+1) = C(5,i)+rk2(5);
end
% Plotting
%L
subplot(3,2,1)
plot(t,C(1,:))
title('L(t): RK2 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')
%R
subplot(3,2,2)
plot(t,C(2,:))
title('R(t): RK2 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')
%D
subplot(3,2,3)
plot(t,C(3,:))
title('D(t):  RK2 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')
%LR
subplot(3,2,4)
plot(t,C(4,:))
title('LR(t): RK2 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')
%LD
subplot(3,2,[5,6])
plot(t,C(5,:))
title('LD(t): RK2 Solution')
xlabel('Time (min)')
ylabel('Concentration (然)')







