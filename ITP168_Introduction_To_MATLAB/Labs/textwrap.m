function [ newString ] = textwrap( stringS, wordsPL )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 23
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
11/21/2016  First Draft     Michael Kyzar
%}
if ~ischar(stringS) || ~isrow(stringS)
    error('Input must be single row string.')
end

if ~isscalar(wordsPL)||mod(wordsPL,1)~=0||wordsPL<1
    error('Input must be scalar value 1 or greater')
end

spaceIndex=strfind(stringS,' ');
numWords=length(spaceIndex)+1;
numLine= ceil(numWords/wordsPL);

newString=stringS(1:spaceIndex(wordsPL));
newLineStart= spaceIndex(wordsPL)+1;

for i= 2:numLine-1
    nextLine=stringS(newLineStart:spaceIndex(wordsPL*i));
    newString = char(newString, nextLine);
    newLineStart= spaceIndex(wordsPL*i)+1;
end

lastLine=stringS(newLineStart:end);
newString= char(newString,lastLine);

end

