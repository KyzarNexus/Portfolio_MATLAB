%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 19  
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
11/07/2016  First Draft     Michael Kyzar
%}

g=32.2;
trajData = importdata('traj.txt','w');
T_0= 0:10:520;                  deltaT_0=diff(T_0);
T_1= 0:10:510;                  deltaT_1=diff(T_1);
T_2= 0:10:500;
Y_0= trajData.';                deltaY_0=diff(Y_0);
Y_1= deltaY_0./deltaT_0;        deltaY_1=diff(Y_1);
Y_2= (deltaY_1)./deltaT_1;
Y_2g=Y_2/g;

subplot(3,1,1),plot(T_0,Y_0)
title('Atlantis Shuttle Launch Data')
xlabel('Time (s)')
ylabel('Altitude (ft)')
axis([0 600 0 4*10^(5)])

subplot(3,1,2),plot(T_1,Y_1)
xlabel('Time (s)')
ylabel('Velocity (ft/s)')
axis([0 600 -5000 5000])

subplot(3,1,3),plot(T_2,Y_2g)
xlabel('Time (s)')
ylabel('Acceleration (g)')
axis([0 600 -2 2])


















