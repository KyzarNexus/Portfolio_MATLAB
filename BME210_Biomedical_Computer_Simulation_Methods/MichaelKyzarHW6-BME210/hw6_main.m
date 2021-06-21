%{
Michael Kyzar
BME 210: Biomedical Computer Simulation Methods
Due Date: April 26th
Submitted: [Insert Submission Date]
Revision History:
Date        Changes                 
------------------------------------
4-21-2019   Parameter & Mesh Setup
4-25-2019   Deleted Everything and Finished Simulation
4-26-2019   Wrote in the requirements after simulation.
%}
%{
Note: I added the potential to continuously graph the function as a surface
plot in the comments of the program. Just uncomment it to get a better
picture of how the concentration dynamically changes over time. 
%}
clear; clf; clc;

% FTCS approximation to the Fick's diffussion equation used to describe
% concentration transfer.

% Initializing equation presets:
alpha = 0.25; dh = 0.5; D = 6.8;
dt = alpha*(dh^2)/D; dt = round(dt,2); % I can't get an even number 
                                       % if the time div is a bit off.
Ci = 2.6; % Concentration Input
% Creating Time Domain
tspan = 0:dt:120;

% Setting up // TheGrid: A Digital Frontier(TM)
dim = 30;
x = -dim:dh:dim;
y = -dim:dh:dim;
[X,Y] = meshgrid(x,y);
z = zeros(length(x),length(y),length(tspan)); 

center0 = [((length(x)-1)/2+1),((length(y)-1)/2+1),1];
z(center0) = Ci; 

% Implementing 2D FTCS Approximation
    % Indexing Setup
i = 2:(length(x)-1);
j = 2:(length(y)-1);
t = 1:(length(tspan)-1);
    % Approximating
%{
% Some sort of auto-updating plot
% From looking at it, it gives a general idea of where to go in the HW.
figure(1)
s = surf(X,Y,z(:,:,1));
light              
lighting gouraud    
axis([-30 30 -30 30 0 3])
%}
for tindex = t
    z(i,j,tindex+1) = ...
        z(i,j,tindex)*(1-4*alpha) + ...
        alpha*(z(i+1,j,tindex)+z(i-1,j,tindex)+z(i,j+1,tindex)+z(i,j-1,tindex));
    % Updating Z with boundary conditions
    z(:,1,tindex+1) = 0;                          % Left
    z(:,length(y),tindex+1) = 0;                  % Right
    z(1,:,tindex+1) = 0;                          % Up
    z(length(x),:,tindex+1) = 0;                  % Down
    z(((length(x)-1)/2+1),((length(y)-1)/2+1),tindex+1) = Ci; % Center
    % Updating Plot:
    %{
    s.ZData = z(:,:,tindex+1);
    pause(0.00001) % Warning, I think the program slows down over time w
                   % this. 
    %}
end
% Report the dt used for the solution:
fprintf('The calculated time displacement is: %.2f hours\n',dt)

% Record the concentration at all grid points at the following times only: 
% t = 15, 30, 120 hours
Ct15 = z(:,:,tspan==15);
Ct30 = z(:,:,tspan==30);
Ct120 = z(:,:,tspan==120);

%{
Record the concentration 6 mm and 12 mm away from the implant at each
time step (12 mm is the distance from the implant to the macula).
%} 
C6mm  = z(x==6,y==0,:); C6mm = C6mm(:)'; % Okay, but why does this make a 
                                         % 1x1xn array? 
C12mm = z(x==12,y==0,:); C12mm = C12mm(:)'; % Ctnslice doesn't seem to 
                                            % have this problem

% Display the concentration values at 6 mm and 12 mm from the implant for 
% t = 120 h.
fprintf('The 120 hr concentration at 6mm is: %.2f ug/g\n',C6mm(end))
fprintf('The 120 hr concentration at 12mm is: %.2f ug/g\n',C12mm(end))
%{ 
% Testing for macular dosage stability
fprintf('%.2f\n',(C12mm(tspan==120)-C12mm(tspan==60))/C12mm(tspan==120)*100)
if ((C12mm(tspan==120)-C12mm(tspan==60))/C12mm(tspan==120))<= 0.05
    fprintf('Stable Macula\n')
else
    fprintf('Unstable Macular\n')
end
%}
% In a single figure, plot the concentration for a cross-section of your 
% grid going across the origin (e.g.,y = 0, -30 mm ? x ? 30 mm) at times 
% 15h, 30h, and 120h. Label each plot line (MATLAB function legend).
Ct15slice = z(:,y==0,tspan==15);
Ct30slice = z(:,y==0,tspan==30);
Ct120slice = z(:,y==0,tspan==120);
figure(1)
plot(x,Ct15slice); hold on
plot(x,Ct30slice);
plot(x,Ct120slice); hold off
title('Concentrations for 15, 30, & 120 Hours')
xlabel('X Position (mm)')
ylabel('Concentration (ug/g)')
legend('15 Hours','30 Hours','120 Hours')
% In a single figure, plot the concentration as a function of time at 6 mm 
% and 12 mm away from the
% implant. Label each line (MATLAB function legend).
figure(2)
plot(tspan,C6mm); hold on
plot(tspan,C12mm); hold off
title('Concentration vs. Time for 6mm & 12mm from Injection Site')
xlabel('Time (hrs)')
ylabel('Concentration(ug/g)')
legend('Distance: 6 mm','Distance: 12 mm')
% Plot the ratio ?(12 mm)/?(6 mm) as a function of time, for 1h ? t ?120h
figure(3)
plot(tspan,(C12mm./C6mm))
title('Ratio between of C12mm/C6mm over Time')
xlabel('Time (hrs)')
ylabel('Ratio: C12mm/C6mm)')
% Make a mesh plot of the concentration at t = 120h (use MATLAB function 
% mesh; if you haven?t done so already, you will need to define vectors 
% with the x and y coordinates of the mesh so that your plot has the 
% correct x and y coordinates).
figure(4)
mesh(X,Y,z(:,:,end))
axis([-dim dim -dim dim 0 3])
title('Mesh plot for the concentration distribution at 120 hours')
xlabel('X Position (mm)')
ylabel('Y Position (mm)')
zlabel('Concentration (ug/g)')
