%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 6 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
07/19/2016  First Draft     Michael Kyzar
%}
clear; clc;
fprintf('Random Number Guessing Game:\n');
%Create a random value from 1 to 10 (inclusive).
randI=randi(10);
% Ask the user to guess the value from 1 to 10
guess=input('I''ve created a number from 1 to 10.\nTry to guess it!\n');
% Keep track of the number of guesses
guessNo=0;
complete=0;
while complete~=1;
    % If the user's guess is too high
    % a. Let them know that it's too high and ask again.
    if ((guess~=randI)&&(guess>randI));
        fprintf('\n%.0f is not the correct guess.\nTry guessing a lower number.\n',guess);
        guessNo=guessNo+1;
        guess=input('What is your next guess?\n');
    % If the user' guess is too low
    % a. Let them know that it's too low and ask again.
    elseif ((guess~=randI)&&(guess<randI));
        fprintf('\n%.0f is not the correct guess.\nTry guessing a higher number.\n',guess);
        guessNo=guessNo+1;
        guess=input('What is your next guess?\n');
    % If the user's guess is the random value
    % a. Let them know they guessed correctly and tell them how many tries it took.
    elseif (guess==randI);
        fprintf('Congratulations! %.0f was the correct guess!\n',guess);
        guessNo=guessNo+1;
        if guessNo==10;
            fprintf('Wow! Taking 10 times to guess a random number \nin this interval is highly improbable!\n');
        end;
        fprintf('Your total number of guesses is %.0f.\n',guessNo);
        complete=complete+1;
    end;
end;
    
%END SCRIPT

%Side note: I think I may have correctly zipped the file this time.
%Was the .zip file able to be successfuly extracted? If not, I may
%need to contact someone about this.
        

