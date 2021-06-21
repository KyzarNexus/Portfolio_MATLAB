function [ ] = wordhist( inputStr )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%{
    Michael Kyzar
    ITP 168, Fall 2016
    Lab 24 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
11/28/2016  First Draft     Michael Kyzar
%}
row=size(inputStr,1);
if row>1
    fprintf('You inputted %0.f strings. \n',row)
end
for ind=1:row
    cellArr=regexp(inputStr(ind,:),'\w+','match');
    fprintf('String %0.f \n',ind);
    numWords=size(cellArr,2);
    for ind2=1:numWords
        word=cellArr{ind2};
        if strcmp(word,'')
            continue;
        end
        occurences=1;
        for ind3=ind2+1:numWords
            if strcmp(word,cellArr{ind3})
                occurences=occurences+1;
                cellArr{ind3}='';
            end
        end
        fprintf('%s: %0.f\n',word, occurences);
    end
end
    
end

