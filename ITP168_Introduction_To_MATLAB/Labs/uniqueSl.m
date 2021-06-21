function [ x ] = uniqueSl( A, b )
%UNTITLED Takes square matrix A and vector b w/ same # of rows as A and
%solves for the following equation: Ax=b
%   Detailed explanation goes here
%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 21  
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
11/14/2016  First Draft     Michael Kyzar
%}
% Ax=b
[row, col]=size(A);
if ~(isnumeric(A(:,:)))
    error('The values in A are not numeric')
end
if ~(length(b)==row)
    error('The # of rows of b are not equal to the # columns of A')
end
if ~(rank(A)==rank([A, b]))
    error('The rank of A is not equal to the contatination rank of A & b')
end
if ~(row==col)
    error('A is not a square matrix')

end
if (rank(A)==rank([A b]))&&(rank([A, b])==col)
    x=A\b;
else
    display('There is no unique solution')
end

end

