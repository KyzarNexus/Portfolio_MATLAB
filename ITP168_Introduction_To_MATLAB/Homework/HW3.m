%{
    Michael Kyzar
    ITP 168, Spring 2016
    Homework 3 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
07/21/2016  First Draft     Michael Kyzar
%}
%Clear previous variables and input
clear; clc;
%Create Price Table
nameT={'Laugh Box Chocolate','Colored Syrup-Laden Sugar Crystals','Sugary Pirated MP3 Files','Jay''s Chips','Rainbow Peas'};
priceT=[25 48 99 54 88];
%Diplay Menu
fprintf('Vending Machine Simulator 2016\n');
fprintf('******************************\n');
fprintf('Choose from the following:\n\n');
fprintf('1.Laugh Box Chocolate\n2.Colored Syrup-Laden Sugar Crystals\n');
fprintf('3.Sugary Pirated MP3 Files\n4.Jay''s Chips\n5.Rainbow Peas\n>>');
choice=input('');
while (choice > 5);
    choice=input('Please choose a valid number.\n>>');
end;
while (priceT(choice)~=0);
    %Print Selection
    fprintf('Selection: %.0f.%s\nPrice:$0.%.0f\n',choice,nameT{1,choice},priceT(choice));
    fprintf('You submit $1.00\n');
    %Calculates Change After Pause
    change=100-priceT(choice);
    fprintf('Your total change is $0.%.0f',change);
    %Part 4: Determine Quarters, Dimes, Nickels, & Pennies
    %(Used the floor function for this)
    nQ=floor(change/25);
    change=mod(change,nQ*25);
    nD=floor(change/10);
    change=mod(change,nD*10);
    nN=floor(change/5);
    change=mod(change,nN*5);
    nP=change;
    fprintf('\nQuarters:%i\nDimes:%i\nNickels:%i\nPennies:%i\n',nQ,nD,nN,nP);
    break;
end;
   %END SCRIPT

