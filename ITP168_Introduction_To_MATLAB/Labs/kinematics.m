function [ range ] = kinematics(v,ang)
%KINEMATICS Computes time for net vertical displacement of projectile to equal 0
%   Takes the arguments of velocity and degrees from the horizontal to calculate 
%   the time when a projectile from the ground again reaches this net
%   vertical displacement of zero. [UPDATE: Calculates Distance Instead]

%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 14 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/19/2016  First Draft     Michael Kyzar
%}
    
        switch nargin
        case 1
            ang=45;
            if (isnumeric(v)==true)&&(v>0)
                t = calctime(v,ang);
                range= v*cosd(ang)*t;
            else
                error('Integer is not a positive scalar');
            end
        case 2
            if (isnumeric(v)==true)&&(v>0)
               if (isnumeric(ang)==true)&&(ang>0)&&(ang<90)
                t = calctime(v,ang);
                range= v*cosd(ang)*t;
               else
                   error('Your angle alue is not a positive scalar between 0 and 90');
               end
            else
                error('Your velocity value is not a positive scalar');
            end
        case 0 
            error('No arguments entered.');
        otherwise
            error('To many arguments entered.');
        end    
end

   function[t]=calctime(v,ang)
    g=9.81;
    switch nargin
        case 1
            ang=45;
            if (isnumeric(v)==true)&&(v>0)
                t=(2*v*sind(ang))/g;
            else
                error('Integer is not a positive scalar');
            end
        case 2
            if (isnumeric(v)==true)&&(v>0)
               if (isnumeric(ang)==true)&&(ang>0)&&(ang<90)
                t=(2*v*sind(ang))/g;
               else
                   error('Your angle alue is not a positive scalar between 0 and 90');
               end
            else
                error('Your velocity value is not a positive scalar');
            end
        case 0 
            error('No arguments entered.');
        otherwise
            error('To many arguments entered.');
    end
   end

    
   
   
   