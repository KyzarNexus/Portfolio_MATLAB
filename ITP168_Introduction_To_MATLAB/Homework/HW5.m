%{
    Michael Kyzar
    ITP 168, Spring 2016
    Homework 5 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/06/2016  First Draft     Michael Kyzar
10/07/16    Add./Rev.       Michael Kyzar
%}
clear; clc;
fprintf('Shape Analyzer 2016\n');
Shape=struct();
n=true;
while n==true
    %Getting Input for structure element creation.
    fprintf('Please enter (''y''/''n'') for the following prompts:\n')
    cirIn=input('Would you like to create a circle?','s');
    triIn=input('Would you like to create a triangle?','s');
    sqrIn=input('Would you like to create a square?','s');
    %Creating Structure Elements.
    if strcmp(cirIn,'y')==true
        Shape.Circle= ...
        struct('Name',{'Circle'},'Radius',randi([1 10]),'Center',[randi([-100 100]), randi([100 100])],'Area',[]);
    end
    if strcmp(triIn,'y')==true
        side1=randi([1 10]);
        side2=randi([1 10]);
        side3=sqrt((side1)^2+(side2)^2);
        Shape.Triangle= ...
        struct('Name',{'Triangle'},'SideLength',[side1,side2,side3],'Center',[randi([-100 100]), randi([-100 100])],'Area',[]);
    end
    if strcmp(sqrIn,'y')==true
        side=randi([1 10]);
        Shape.Square= ...
        struct('Name',{'Square'},'SideLength',[side,side],'Center',[randi([-100 100]), randi([-100 100])],'Area',[]);
    end
%     checking cases and performing calculations.

%     % Surely there must be a better way ¯\_(?_?)_/¯ 
%     % (This seems too repetitive. Is there a better way to do this?)
    
    %Checking case for all three shapes
% *********************************************************************************************
    if     (strcmp(cirIn,'y')==true)&& ...
           (strcmp(sqrIn,'y')==true)&& ...
           (strcmp(triIn,'y')==true) 
      while true %Used to Condense Code in Editor
       name1=Shape.Circle.Name;
       name2=Shape.Triangle.Name;
       name3=Shape.Square.Name; 
       %Calculating distance
       fprintf('Let''s calculate the distances between two of these shapes.\n')
       fprintf('%s\n%s\n%s\n',name1,name2,name3);
       q1=1;
       while q1==1
           a1=input('Choose a shape:','s');
           if false==(strcmp(a1,name1)||strcmp(a1,name2)||strcmp(a1,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q1=0;
           end
       end
       q2=1;
       while q2==1
           a2=input('Choose another shape:','s');
           if false==(strcmp(a2,name1)||strcmp(a2,name2)||strcmp(a2,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q2=0;
           end
       end
       P1=Shape.(a1).Center;
       P2=Shape.(a2).Center;
       dist=sqrt((P1(1,1)-P2(1,1))^2+(P1(1,2)-P2(1,2))^2);
       fprintf('The total distance between the two shapes is %.3f\n',dist);
       %Calculating Area Ratio
       fprintf('Let''s calculate the ratio between two of these shapes.\n')
       fprintf('%s\n%s\n%s\n',name1,name2,name3);
       q1=1;
       while q1==1
           a1=input('Choose a shape:','s');
           if false==(strcmp(a1,name1)||strcmp(a1,name2)||strcmp(a1,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q1=0;
           end
       end
       q2=1;
       while q2==1
           a2=input('Choose another shape:','s');
           if false==(strcmp(a2,name1)||strcmp(a2,name2)||strcmp(a2,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q2=0;
           end
       end
       if true==strcmp(a1,name1)
           A1=pi()*(Shape.Circle.Radius)^2;
       elseif true==strcmp(a1,name2)
           A1=.5*(Shape.Triangle.SideLength(1))*(Shape.Triangle.SideLength(2));
       else true=strcmp(a1,name3);
           A1=(Shape.Square.Sidelength(1))^2;
       end
       if true==strcmp(a2,name1)
           A2=pi()*(Shape.Circle.Radius)^2;
       elseif true==strcmp(a2,name2)
           A2=.5*(Shape.Triangle.SideLength(1))*(Shape.Triangle.SideLength(2));
       else true=strcmp(a2,name3);
           A2=(Shape.Square.SideLength(1))^2;
       end
       aRatio=A1/A2;
       fprintf('The area ratio between the two shapes is %.3f',aRatio);
       n=false; %Loop Closure\
       break
      end
      
    %Checking cases for two shapes
% *********************************************************************************************
    elseif (strcmp(cirIn,'y')==true)&& ...
           (strcmp(sqrIn,'y')==false)&& ...
           (strcmp(triIn,'y')==true)
       while true %Used to Condense Code in Editor
       name1=Shape.Circle.Name;
       name2=Shape.Triangle.Name; 
       %Calculating distance
       fprintf('Let''s calculate the distances between two of these shapes.\n')
       fprintf('%s\n%s\n',name1,name2);
       q1=1;
       while q1==1
           a1=input('Choose a shape:','s');
           if false==(strcmp(a1,name1)||strcmp(a1,name2))
               fprintf('Please type a valid shape name:\n');
           else
               q1=0;
           end
       end
       q2=1;
       while q2==1
           a2=input('Choose another shape:','s');
           if false==(strcmp(a2,name1)||strcmp(a2,name2))
               fprintf('Please type a valid shape name:\n');
           else
               q2=0;
           end
       end
       P1=Shape.(a1).Center;
       P2=Shape.(a2).Center;
       dist=sqrt((P1(1,1)-P2(1,1))^2+(P1(1,2)-P2(1,2))^2);
       fprintf('The total distance between the two shapes is %.3f\n',dist);
       %Calculating Area Ratio
       fprintf('Let''s calculate the ratio between two of these shapes.\n')
       fprintf('%s\n%s\n',name1,name2);
       q1=1;
       while q1==1
           a1=input('Choose a shape:','s');
           if false==(strcmp(a1,name1)||strcmp(a1,name2))
               fprintf('Please type a valid shape name:\n');
           else
               q1=0;
           end
       end
       q2=1;
       while q2==1
           a2=input('Choose another shape:','s');
           if false==(strcmp(a2,name1)||strcmp(a2,name2))
               fprintf('Please type a valid shape name:\n');
           else
               q2=0;
           end
       end
       if true==strcmp(a1,name1)
           A1=pi()*(Shape.Circle.Radius)^2;
       elseif true==strcmp(a1,name2)
           A1=.5*(Shape.Triangle.SideLength(1))*(Shape.Triangle.SideLength(2));
       else
       end
       if true==strcmp(a2,name1)
           A2=pi()*(Shape.Circle.Radius)^2;
       elseif true==strcmp(a2,name2);
           A2=.5*(Shape.Triangle.SideLength(1))*(Shape.Triangle.SideLength(2));
       else
       end
       aRatio=A1/A2;
       fprintf('The area ratio between the two shapes is %.3f',aRatio);
       n=false; %Loop Closure\
       break
      end
    elseif (strcmp(cirIn,'y')==true)&& ...
           (strcmp(sqrIn,'y')==true)&& ...
           (strcmp(triIn,'y')==false)
       while true %Used to Condense Code in Editor
       name1=Shape.Circle.Name;
       name3=Shape.Square.Name; 
       %Calculating distance
       fprintf('Let''s calculate the distances between two of these shapes.\n')
       fprintf('%s\n%s\n',name1,name3);
       q1=1;
       while q1==1
           a1=input('Choose a shape:','s');
           if false==(strcmp(a1,name1)||strcmp(a1,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q1=0;
           end
       end
       q2=1;
       while q2==1
           a2=input('Choose another shape:','s');
           if false==(strcmp(a2,name1)||strcmp(a2,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q2=0;
           end
       end
       P1=Shape.(a1).Center;
       P2=Shape.(a2).Center;
       dist=sqrt((P1(1,1)-P2(1,1))^2+(P1(1,2)-P2(1,2))^2);
       fprintf('The total distance between the two shapes is %.3f\n',dist);
       %Calculating Area Ratio
       fprintf('Let''s calculate the ratio between two of these shapes.\n')
       fprintf('%s\n%s\n',name1,name3);
       q1=1;
       while q1==1
           a1=input('Choose a shape:','s');
           if false==(strcmp(a1,name1)||strcmp(a1,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q1=0;
           end
       end
       q2=1;
       while q2==1
           a2=input('Choose another shape:','s');
           if false==(strcmp(a2,name1)||strcmp(a2,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q2=0;
           end
       end
       if true==strcmp(a1,name1)
           A1=pi()*(Shape.Circle.Radius)^2;
       elseif true==strcmp(a1,name3);
           A1=(Shape.Square.SideLength(1))^2;
       else
       end
       if true==strcmp(a2,name1)
           A2=pi()*(Shape.Circle.Radius)^2;
       elseif true==strcmp(a2,name3);
           A2=(Shape.Square.SideLength(1))^2;
       else
       end
       aRatio=A1/A2;
       fprintf('The area ratio between the two shapes is %.3f',aRatio);
       n=false; %Loop Closure\
       break
      end
    elseif (strcmp(cirIn,'y')==false)&& ...
           (strcmp(sqrIn,'y')==true)&& ...
           (strcmp(triIn,'y')==true)
       while true %Used to Condense Code in Editor
       name2=Shape.Triangle.Name;
       name3=Shape.Square.Name; 
       %Calculating distance
       fprintf('Let''s calculate the distances between two of these shapes.\n')
       fprintf('%s\n%s\n',name2,name3);
       q1=1;
       while q1==1
           a1=input('Choose a shape:','s');
           if false==(strcmp(a1,name2)||strcmp(a1,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q1=0;
           end
       end
       q2=1;
       while q2==1
           a2=input('Choose another shape:','s');
           if false==(strcmp(a2,name2)||strcmp(a2,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q2=0;
           end
       end
       P1=Shape.(a1).Center;
       P2=Shape.(a2).Center;
       dist=sqrt((P1(1,1)-P2(1,1))^2+(P1(1,2)-P2(1,2))^2);
       fprintf('The total distance between the two shapes is %.3f\n',dist);
       %Calculating Area Ratio
       fprintf('Let''s calculate the ratio between two of these shapes.\n')
       fprintf('%s\n%s\n',name2,name3);
       q1=1;
       while q1==1
           a1=input('Choose a shape:','s');
           if false==(strcmp(a1,name2)||strcmp(a1,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q1=0;
           end
       end
       q2=1;
       while q2==1
           a2=input('Choose another shape:','s');
           if false==(strcmp(a2,name2)||strcmp(a2,name3))
               fprintf('Please type a valid shape name:\n');
           else
               q2=0;
           end
       end
       if true==strcmp(a1,name2)
           A1=.5*(Shape.Triangle.SideLength(1))*(Shape.Triangle.SideLength(2));
       else true=strcmp(a1,name3);
           A1=(Shape.Square.Sidelength(1))^2;
       end
       if true==strcmp(a2,name2)
           A2=.5*(Shape.Triangle.SideLength(1))*(Shape.Triangle.SideLength(2));
       else true=strcmp(a2,name3);
           A2=(Shape.Square.SideLength(1))^2;
       end
       aRatio=A1/A2;
       fprintf('The area ratio between the two shapes is %.3f',aRatio);
       n=false; %Loop Closure\
       break
       end
       
       %Checking cases of one shapes
% *********************************************************************************************
    elseif (strcmp(cirIn,'y')==true)&& ...
           (strcmp(sqrIn,'y')==false)&& ...
           (strcmp(triIn,'y')==false)
       fprintf('Wow... You created a circle. Good job.');
       n=false;
    elseif (strcmp(cirIn,'y')==false)&& ...
           (strcmp(sqrIn,'y')==true)&& ...
           (strcmp(triIn,'y')==false)
       fprintf('Wow... You created a square. Good job.');
       n=false;
    elseif (strcmp(cirIn,'y')==false)&& ...
           (strcmp(sqrIn,'y')==false)&& ...
           (strcmp(triIn,'y')==true)
       fprintf('Wow... You created a triangle. Good job.');
       n=false;
    %Checking cases of no shape
    elseif (strcmp(cirIn,'y')==false)&& ...
           (strcmp(sqrIn,'y')==false)&& ...
           (strcmp(triIn,'y')==false);
       fprintf('No shapes created.\n');
       n=false;
    else
    end
end