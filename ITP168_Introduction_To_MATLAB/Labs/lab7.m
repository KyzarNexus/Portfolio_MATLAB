%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 7 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
07/21/2016  First Draft     Michael Kyzar
%}
clear; clc;
%Asking user for matrix dimensions
 
nRow=input('Please enter your number of rows:');
nCol=input('Please enter your number of columns:');
%Checking dimention paramaters (Non-integers not considered).
while (nRow<=0)
    fprintf('Please enter a valid input.\n');
    nRow=input('Please enter your number of rows:');
end;
while (nCol<=0)
    fprintf('Please enter a valid input.\n');
    nRow=input('Please enter your number of rows:');
end;
myArr=zeros(nRow,nCol);
%adding values to the function
for (rIndex=1:nRow);
    for(cIndex=1:nCol);
        fprintf('Please input a value for (%.0f,%.0f).',rIndex,cIndex);
        myArr(rIndex,cIndex)=input('');
    end;
end;
%Displaying final matrix
fprintf('Your created matrix is as follows:');
myArr

        
