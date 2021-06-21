%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 3 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
07/09/2016  First Draft     Michael Kyzar
%}

x=valArray(1,:);
xBar=sum(x)/8;
xDiff=x-xBar;

y=valArray(2,:);
yBar=sum(y)/8;
yDiff=y-yBar;

xyDiff=(xDiff.*yDiff);
sumXYDiff=sum(xyDiff);
%----------------------------------------
xDiffSquare=xDiff.*xDiff;
xDiffSquareSum=sum(xDiffSquare);

yDiffSquare=yDiff.*yDiff;
yDiffSquareSum=sum(yDiffSquare);

xyDiffSquareSum=yDiffSquareSum*xDiffSquareSum;
SqrxyDiffSquareSum=sqrt(xyDiffSquareSum);

sltn=sumXYDiff/SqrxyDiffSquareSum;

fprintf('%.2f',sltn)
