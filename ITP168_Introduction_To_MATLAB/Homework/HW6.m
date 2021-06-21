%{
    Michael Kyzar
    ITP 168, Spring 2016
    Homework 6 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/13/2016  First Draft     Michael Kyzar
%}
clear; clc;
%Creating cipher key
ciph='DRIUSYAQBWTEZNLPMOCVHGFJXK';
alph='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
lenalph=length(alph);
%Opening Document
fileID=fopen('encrypt.txt','w');
check='no';
%Introduction
fprintf('Hello! Welcome to Enigma Simulator 2016!\n');
%Encrypting
while ~strcmpi('done',check);
    word=input('Enter a word or phrase for encryption or ''done'' to quit:','s');
    check=word;
    nword='';
    lenword=length(word);
    if ~strcmpi('done',word)
   for i=1:lenword
       for j=1:lenalph
           if strcmpi(word(i),alph(j))==true
               word(i)=ciph(j);
           end
       end
   end
   fprintf(fileID,'%s\n',word);
    end
end
fprintf('Information successfully encrypted. See ''encrypt.txt'' for encryption.\n');














