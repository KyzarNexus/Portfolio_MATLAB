%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 20 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
11/09/2016  First Draft     Michael Kyzar
%}
clear; clc;

v_t= @(t) -3*t.^2+30.*t;
time=0:.01:.01;
vel= [v_t(time(1)),v_t(time(2))];
area=trapz(time,vel);
n=2;
while area>0
    time=[time,time(n)+0.01];
    n=n+1;
    vel=[vel,v_t(time(n))];
    area=trapz(time,vel);
end
plot(time, vel,'m-')
title('Velocity Profile')
xlabel('Time (s)')
ylabel('Velocity (m/s)')
ax = gca;
ax.XAxisLocation = 'origin'; %Changed Axis Location to better reflect illustration of volume. 