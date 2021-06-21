%{
    Michael Kyzar
    ITP 168, Spring 2016
    Homework 2
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
07/16/2016  First Draft     Michael Kyzar
%}
%Clearing all previous input
clear; clc;

display('Economic Pain Simulator 2016:');
% Part 1: Set Up Arrays
% Create a vector with 6 values to hold the maximum income for each tax
% bracket.
incBrac=[9225 28225 53300 98550 222200 1700];
% Create a 7 element vector to hold the tax percent for each tax bracket.
taxPer=[0.1 0.15 0.25 0.28 0.33 0.35 0.396];

% Part 2: Get input
% Prompt the user for their monthly salary for 2015 one month at a time. 

display('Please enter your income for the following months:');
jan= input('January:');
feb= input('Febrary:');
mar= input('March:');
apr= input('April:');
may= input('May:');
jun= input('June:');
jul= input('July:');
aug= input('August:');
sep= input('September:');
oct= input('October:');
nov= input('November:');
dec= input('December:');

% Store these answers in avector holding the user?s monthly income.
monInc=[jan feb mar apr may jun jul aug sep oct nov dec];
 
% Part 3: Calculate total income
% Compute their annual income
annInc=sum(monInc);
fprintf('Your annual income is $%.2f \n',annInc);

% Part 4: Determine taxes 
% Determine how much income the user has in that tax bracket. Any income
% beyond the maximum for a tax bracket spills over to the next tax bracket.
id1=[1 0 0 0 0 0];
id2=[1 1 0 0 0 0];
id3=[1 1 1 0 0 0];
id4=[1 1 1 1 0 0];
id5=[1 1 1 1 1 0];
id6=[1 1 1 1 1 1];
brac1= annInc*taxPer(1);
brac2= sum(incBrac.*id1.*taxPer(1:6))+((annInc-sum(id1.*incBrac))*taxPer(2));
brac3= sum(incBrac.*id2.*taxPer(1:6))+((annInc-sum(id2.*incBrac))*taxPer(3));
brac4= sum(incBrac.*id3.*taxPer(1:6))+((annInc-sum(id3.*incBrac))*taxPer(4));
brac5= sum(incBrac.*id4.*taxPer(1:6))+((annInc-sum(id4.*incBrac))*taxPer(5));
brac6= sum(incBrac.*id5.*taxPer(1:6))+((annInc-sum(id5.*incBrac))*taxPer(6));
brac7= sum(incBrac.*id6.*taxPer(1:6))+((annInc-sum(id6.*incBrac))*taxPer(7));
    
% Based on the bracket?s income, apply the taxation rate for that bracket
% to the income that falls within that bracket. Add that amount to the
% overall taxes the user will be paying. Any income that falls beyond the
% 6th tax bracket is taxed at the maximum tax level.
if (annInc<=9225);
    tax=brac1;
elseif ((annInc>=9226)&&(annInc<=37450));
    tax=brac2;
elseif((annInc>=37451)&&(annInc<=90750));
    tax=brac3;
elseif((annInc>=90751)&&(annInc<=189300));
    tax=brac4;
elseif((annInc>=189301)&&(annInc<=411500));
    tax=brac5;
elseif((annInc>=411501)&&(annInc<=413200));
    tax=brac6;
else
    tax=brac7;
end;

%Display the total tax amount to the user.
fprintf('The government will steal a total amount of $%.2f \n',tax);
% Also calculate and display the user?s effective tax rate (should be
% displayed as a decimal, not a whole number) (The effective tax rate is
% the total taxed divided by the total income.)
eTaxRate=(tax/annInc)*100;
fprintf('Your effective tax rate is %.2f percent. \n',eTaxRate);
display('Have a nice day and remember, taxation is theft! :)');
%END SCRIPT
%*Disclaimer, I do not personally hold anti-taxation views
%*This was simply a satirically themed script.


















