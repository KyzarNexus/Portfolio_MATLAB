%{
    Michael Kyzar
    ITP 168, Spring 2016
    Homework 4 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
09/30/2016  First Draft     Michael Kyzar
%}
clear;clc;
% Part 1: Menu System
% Present the menu system to the user.
fprintf('Please choose from the following options:\n');
fprintf('1. Series Approx. for sin(x)\n2. Series Approx for cos(x)\n'); 
fprintf('3. Series Approx for e^(x)\n4. Fibonacci Sequence\n5. Quit\n');
choice= input('Choose (1-5):');
cont=1;
while cont==1
    switch choice
% Part 2: Series Approximation of Sine
% Ask the user for the radian value they are trying to evaluate sine at
% Ask the user for the number of iterations used to approximate (this is your k value)
% If the k value is less than 1, ask for another value that is at least 1 or higher
% Once the user has given you adequate values, sum up all of the values to approximate the sine function.
        case 1 %Series Approx for sin(x)
            x=input('At which value of x are you approximating sin(x)?');
            k=.5;
            while k<1
                k=input('How many terms do you wish to use for your approximation?');
            end;
            syms n
            f = ((-1)^(n-1)/(factorial(2*n-1)))*x^(2*n-1);
            V = subs(f, n, 1:k);
            sinSum = sum(V);
            fprintf('sin(%.3f)=%.3f\n',x,sinSum);
            cont=0;
% Part 3: Series Approximation of Cosine
% Ask the user for the radian value they are trying to evaluate cosine at
% Ask the user for the number of iterations used to approximate (this is your k value)
% If the k value is less than 1, ask for another value that is at least 1 or higher
% Once the user has given you adequate values, sum up all of the values to approximate the cosine function
% Present the results to the user and be sure to include your original values. For example: 
        case 2 %Series Approximation of Cosine
            x=input('At which value of x are you approximating cos(x)?');
            k=.5;
            while k<1
                k=input('How many terms do you wish to use for your approximation?');
            end;
            syms n
            f = ((-1)^(n-1)/(factorial(2*n-2)))*x^(2*n-2);
            V = subs(f, n, 1:k);
            cosSum = sum(V);
            fprintf('cos(%.3f)=%.3f\n',x,cosSum);
            cont=0;
% Part 4: Series Approximation of E
% Ask the user for the x value
% Ask the user for the number of iterations used to approximate (this is your k value)
% If the k value is less than 1, ask for another value that is at least 1 or higher
% Once the user has given you adequate values, sum up all the values to approximate the exponential function
% Present the results to the user and be sure to include your original values. For example:
        case 3 %Series Approximation of e^(x)
            x=input('At which value of x are you approximating e^(x)?');
            k=.5;
            while k<1
                k=input('How many terms do you wish to use for your approximation?');
            end;
            syms n
            f = ((x)^(n-1)/(factorial(n-1)));
            V = subs(f, n, 1:k);
            eSum = sum(V);
            fprintf('e^(%.3f)=%.3f\n',x,eSum);
            cont=0;
% Part 5: Fibonacci Sequence
% Ask the user for the number of Fibonacci numbers to print out
% If that number is less than 1, ask them again for a number that is at least 1 or higher
% Print out the sequence of numbers, for example:
        case 4 %Fibonacci Sequence
            no=.5;
            while no<1
                no=input('How many Fibonacci numbers do you want?');
            end;
            seq=zeros(1,no);
            switch no
                case 1
                    seq(1)=1;
                otherwise
                    seq(1)=1;
                    seq(2)=2;
            end;
            i=3;
            while i <= no
                seq(i)=seq(i-2)+seq(i-1);
                i=i+1;
            end;
            fprintf('Your sequence of the first %.0f terms is as follows:',no);
            fprintf('\n%g\n',seq);
            break;
        case 5 % If the user chooses to quit, end the program.
            cont=0;
        otherwise
% If the user gives any other option other than those listed, let them know that their input is
% invalid and present the menu again. 
            fprintf('Please choose a valid option\n')
            fprintf('1. Series Approx. for sin(x)\n2. Series Approx for cos(x)\n'); 
            fprintf('3. Series Approx for e^(x)\n4. Fibonacci Sequence\n5. Quit\n');
            choice= input('Choose (1-5):');
    end;
end;
fprintf('Have a nice day!\n');
% END SCRIPT (And Have a Nice Day!)