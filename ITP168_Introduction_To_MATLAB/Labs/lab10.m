%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 10 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/03/2016  First Draft     Michael Kyzar
%}
clear; clc;
display('Lab10');
fprintf('Program: Here in my GarAAAAge\n');
n=0;
while n<=0
    n=input('How many vehicles are in YOUR garage??');
    if n<=0
        fprintf('That''s not a valid ''fuel unit.'' Please try again.\n');
    end
end
nNum=cell(1,n);
nMake=cell(1,n);
nModel=cell(1,n);
nYear=cell(1,n);
nSerial=cell(1,n);
fprintf('Now give me the KNAWLEDGE to organize your car(s).\n')
%Writing Stucture Values
for i=1:n
    fprintf('Vehicle %.0f\n',i);
    nNum{1,i}= strcat('Vehicle  ', num2str(i));
    nMake{1,i}= input('Make:','s') ;
    nModel{1,i}= input('Model:','s');
    nYear{1,i}= input('Year:');
    nSerial{1,i}=randi([10000,99999],1,1);
end
%Creating Structure
garageStruct=struct('Number',nNum,'Make',nMake,'Model',...
    nModel,'Year',nYear,'Serial',nSerial);
file = fopen('garage.txt','w');
for i=1:n
    fprintf(file,'%s\n', garageStruct.Number);
    fprintf(file,'%s\n', garageStruct.Make);
    fprintf(file,'%s\n', garageStruct.Model);
    fprintf(file,'%.0f\n', garageStruct.Year);
    fprintf(file,'%.0f\n', garageStruct.Serial);
    fprint(file,'***************************************');
end
fclose(file);

%End Script

