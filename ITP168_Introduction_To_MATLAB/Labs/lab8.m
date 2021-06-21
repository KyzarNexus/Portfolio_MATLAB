%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 8 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
07/26/2016  First Draft     Michael Kyzar
%}
clear; clc;
fprintf('String Organization by Length\n');
strArray=cell(1,2);
numString=0;
string=input('Please enter a string of ''done'' to quit: ','s');
while ~strcmpi(string,'done')
    numString=numString+1;
    strArray{numString,1}=string;
    strArray{numString,2}=length(string);
    string=input('Please enter a string or ''done'' to quit:\n>>','s');
end;

%Display the Longest
if numString==0
   fprintf('No Strings Entered\n');
else
    while numString>1
        longest=strArray{1,1};
        len=strArray{1,2};
        id=1;
        for i=1:numString
            if strArray{i,2}>len
                len=strArray{i,2};
                longest=strArray{i,1};
                id=i;
            end
        end
        fprintf('%s\n',strArray{id,1});
        strArray(id,:)=[];
       numString=numString-1;
    end
    fprintf('%s \n',strArray{1,1});
end