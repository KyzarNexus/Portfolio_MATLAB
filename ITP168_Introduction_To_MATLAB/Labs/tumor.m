%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 17 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/31/2016  First Draft     Michael Kyzar
%}

function [ ] = tumor( m, n )
%TUMOR Create a graph of the tumor model based on input parameters n and m
%   
if ~(m>0&&isscalar(m)==true)
    error('m is not a positive scalar')
end
if ~(m>0&&isscalar(m)==true)
    error('n is not a positive scalar')
end

thetaR= linspace(0,2*pi,150);
phiR= linspace(0,pi,150);
[theta, phi]=meshgrid(thetaR,phiR);

p=1+(1/5).*sin(m.*theta).*sin(n.*phi);

X=p.*sin(phi).*cos(theta);
Y=p.*sin(phi).*sin(theta);
Z=p.*cos(phi);

surf(X,Y,Z)

end

