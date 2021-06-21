%{
    Michael Kyzar
    ITP 168, Spring 2016
    Assignment:  
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
09/09/2016  First Draft     Michael Kyzar
%}

disp('Auto Loan Calculator')
%Part 1: Determining Principle
pPrice=input('Please enter the purchase price of the car:');
dwnPay=input('Please enter your down payment as a percentage of the purchase price (Eg. 10% is 10):')/100;
princ= pPrice*(1-dwnPay);
fprintf('You need to borrow $%d. ',princ);

%Part 2: Monthly Payments
%Asking for apr and the loan length.
apr=100\input('Please enter the APR (Eg. 3% is 3):');
len=input('Please enter the length of the loan in years:');

%Calculating the monthly payments by splitting up into numerator and
%denominator.
monPNum=(princ*(apr/12));
monPDen=1-(1+apr/12)^(-len*12);
monPay=monPNum/monPDen;
lifePay=monPay*12*len;

%Stating monthly payment and total payment over life of loan.
fprintf('Your monthly payment is %.2f and you need to pay %.2f over the life of the loan.',monPay,lifePay)

%END SCRIPT

