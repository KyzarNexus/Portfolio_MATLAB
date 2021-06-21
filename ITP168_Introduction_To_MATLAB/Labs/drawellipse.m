function [ ] = drawellipse( a,b )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 16 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/26/2016  First Draft     Michael Kyzar
%}

if ~(isnumeric(a)==1 && a>0 && isscalar(a)==1);
    error('Inputs must be a numeric scalar greater than zero')
end
if ~(isnumeric(b)==1 && b>0 && isscalar(b)==1);
    error('Inputs must be a numeric scalar greater than zero')
end

ang=linspace(0,360,1000);
x=a*cosd(ang);
y=b*sind(ang);

figure; hold on;
ellipsehandle = plot(x(1),y(1));
pointhandle = plot(x(1),y(1),'*');
linehandle = plot([0,x(1)],[0,y(1)],'b-');
axis([-a a -b b]);
for i=1:1000
    set(ellipsehandle,'XData',x(1:i));
    set(ellipsehandle,'YData',y(1:i));
    set(pointhandle,'XData',x(i));
    set(pointhandle,'YData',y(i));
    set(linehandle,'XData',[0,x(i)]);
    set(linehandle,'YData',[0,y(i)]);
    drawnow; 
end
end
