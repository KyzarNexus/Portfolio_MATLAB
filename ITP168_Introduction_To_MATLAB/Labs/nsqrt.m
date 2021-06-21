function [ sqRt ] = nsqrt( x,y,z )
%NSQRT Takes the first value and approximates the square root using
%newton's method. The second value is the intial guess. The third
%(optional) is the number of iterations. If no third variable is submitted,
%10 is used by default. 
%   Detailed explanation goes here
%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 21
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
11/16/2016  First Draft     Michael Kyzar
%}
switch nargin
    case 1
        error('Not enough arguments')
    case 2
        noit=10;
        jac = 2*y; %build Jacobian
        %calculate f0
        f0 = y^2-x;
        for iters = 1:noit
        delta = -f0/jac; %solve for deltaX and deltaY
        %update x0 and y0
        y = y + delta;
        %recalculate jacobian and f0
        jac = 2*y;
        f0 = y^2-x;
        fprintf('sqrt(X): %.3f\n',y);
        end;
             
    case 3
        noit=z;
        jac = 2*y; %build Jacobian
        %calculate f0
        f0 = y^2-x;
        for iters = 1:noit
        delta = -f0/jac; %solve for deltaX and deltaY
        %update x0 and y0
        y = y + delta;
        %recalculate jacobian and f0
        jac = 2*y;
        f0 = y^2-x;
        end;
        fprintf('sqrt(X): %.4f\n',y);       
    otherwise
        error('Too many arguments')
end

end

