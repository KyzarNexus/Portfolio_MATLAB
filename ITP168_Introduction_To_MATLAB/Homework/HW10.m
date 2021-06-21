%{
    Michael Kyzar
    ITP 168, Spring 2016
    Homework 10 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
11/29/2016  First Draft     Michael Kyzar
%}
clear;clc

in= input('What is your input file name?','s'); out= input('What is your output file name?','s');
inputFile= fopen(in,'r'); outputFile= fopen(out,'w');

while 1
    line = fgetl(inputFile);
    if ~ischar(line), break, end
    list= regexp(line,'\[[^[]]+.\]','match');
    length=size(list,1);
    for n=1:length
        matrix=eval(list{n});
        [L, U]= ludecomp(matrix);
        stringMat=mat2str(matrix);
        stringL=mat2str(L);
        stringU=mat2str(U);
        fprintf(outputFile, ' %s : %s : %s \n',stringMat,stringL,stringU);
    end
    
end

fclose(inputFile);
fclose(outputFile);