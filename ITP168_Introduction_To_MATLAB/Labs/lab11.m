%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 11
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/05/2016  First Draft     Michael Kyzar
%}
% 1. Which of the following loops has the most chance of running infinitely?
%   c. While Loop
% 2. Which of the following is a reserved word in MATLAB?
%   c. Break
% 3. A switch statement uses _______ to make decisions.
%   b. Cases
% 4. Assume A is a cell array. A{3,21} is an example of ________.
%   b. Cell Indexing
% 5. A structure stores data in _________.
%   b. Fields
% 1. Assume A is a cell array of size 2 rows, 2 columns. Write a single line of code that will delete the
% first column in A, resizing A to be 2 rows, 1 column.
% Page 2 of 3
% A(:,2)=[]
% 2. What would the following lines of code produce in the command window?
% myValue = 10.79883;
% fprintf('The value is: %010.2f\n',myValue);
% OUTPUT: 'The value is: 0000010.80'
% 3. Assume you are given an array A, which contains numerical values and is sized at 3 rows, 4
% columns. Write a single line of code which will assign the values in the last column to a column
% vector, B.
% B=A(:,4)
% 4. How does the importdata() function and the dlmread() function differ in terms of the kinds of
% information they can import?
% 'dlmread' can import data that has been delimited, while 'importdata' cannot
% 1. What are the key differences between a For Loop and a While Loop? Write a simple For Loop
% and a simple While Loop and indicate the parts to each loop as defined in the slides.
% A while loop has the potential to repeat indefinitely
% A for loop has less of a chance of this and cannot be used to check input
% while ~strcmp(wow)='yes'
%     wow=input('Do you have a doge?','s')
% end
% w=0
% for i=1:10
%     w=i+w
% end  
% 2. How can we print a cell array using fprintf()?
% You cannot print a cell array by itself. 
% 1. What does the following script file output to the command window?
% counter = 1;
% product = 1;
% while (counter < 5)
% product = product * counter;
% fprintf('New value = %.0f\n',product);
% counter = counter + 2;
% end;
% OUTPUT: 'New value = 1 \n New value = 3'
% Rewrite the while loop as a for loop
% 2. Follow Script Instructions
clear; clc;
display('Academic Doomsday Calculator');
name=input('What is your name?','s');
labper=-1;
while (labper<0)||(labper>100)
    labper=input('Please enter your lab percentage:');
end
partper=-1;
while partper<0||partper>100
    partper=input('Please enter your participation percentage:');
end
assper=-1;
while assper<0||assper>100
    assper=input('Please enter your assignment percentage:');
end
midper=-1;
while midper<0||midper>100
    midper=input('Please enter your midterm percentage:');
end
lab=labper*.075;
part=partper*.025;
ass=assper*.125;
mid=midper*.25;
total=lab+part+ass+mid;
totalper=(total/47.5)*100;
fprintf('%.s:%.2f',name,totalper);
