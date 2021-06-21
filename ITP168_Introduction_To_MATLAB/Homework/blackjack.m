%{
    Michael Kyzar
    ITP 168, Spring 2016
    Homework 7 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
10/21/2016  First Draft     Michael Kyzar
10/26/2016  Fin Functions   Michael Kyzar
10/26/2016  Tstng Fnctns    Michael Kyzar
10/27/2016  Make BJ Funct.  Michael Kyzar
10/27/2016  Debugging BJ    Michael Kyzar
%}

function [] = blackjack( deckNo )
%BLACKJACK1 Plays a classic game of blackjack with the user
%   The Input is the number of decks with which the user wants to play. 

% 1. Check the input;a. It should be a single, positive, integer value. If it is not, produce an error
if ~((nargin == 1) && (mod(deckNo,1) == 0) && (deckNo > 0))
    error('Number of decks must be a single, positive, integer value.');
end
fprintf('Welcome to blackjack!\n')
% 2. Create the deck(s)
deck=initdeck(deckNo);
% 3. Shuffle the deck(s)
sDeck=shuffle(deck);
% a. Keep track of the number of cards for the player
pHand=struct('Suit',[],'Value',[],'Number',[]);
% a. Keep track of the number of cards for the dealer
dHand=struct('Suit',[],'Value',[],'Number',[]);
% 4. Deal two cards to the player?s hand
[ pHand(1), sDeck ] = dealcard( sDeck );
[ pHand(2), sDeck ] = dealcard( sDeck );
% 5. Deal two cards to the dealer?s hand
[ dHand(1), sDeck ] = dealcard( sDeck );
[ dHand(2), sDeck ] = dealcard( sDeck );
% 6. Print the cards for the player
fprintf('Your cards are:\n');
printcard(pHand)
% 7. Print the first card for the dealer (the dealer never reveals his second card until it?s his turn)
fprintf('The dealer''s first card is:\n');
printcard(dHand(1))
% 8. Print the score for the player
pScore=calcscore(pHand);
dScore=calcscore(dHand);
fprintf('Your current score is %.0f\n',pScore)
% 9. Determine if anyone has reached ?Blackjack?
% a. If so, announce the winner and end the function
% 10. Determine if there was a ?Push?
% a. If so, announce the push and end the functionpWin
pWin=(pScore==21 && dScore<21);
dWin=(pScore<21 && dScore==21);
push=(pScore==21 && dScore==21);
if pWin
    fprintf('Blackjack! You win!\n')
    return
elseif dWin
    fprintf('The dealer has blackjack. You lose!\n')
    return
elseif push
    fprintf('You both have blackjack. Push.\n')
    return
end
choice='none';
% 11. Ask the player to hit or stand
% 13. If the player stands, move on to the dealer
pHanLen=numel(pHand);
while ~(strcmp('stand',choice)==true)
    choice=input('Do you choose to hit or stand? (''hit'' or ''stand'')','s');
    fprintf('\n')
    if strcmp('hit',choice)==true
% 12. If the player hits, deal the player a card
% b. Update the number of cards the player has
        [ pHand(pHanLen+1), sDeck ] = dealcard( sDeck );
% a. Print the card that was dealt
        fprintf('You have been dealt:\n');
        printcard(pHand(pHanLen+1))
% c. Calculate the player's new score   
        pHanLen=numel(pHand);
        pScore=calcscore(pHand);
        for w=1:pHanLen
            if (pScore>21)&&(strcmp('Ace',pHand(w).Value))
            pScore=pScore-10;
            end
        end
        fprintf('Your new score is %.0f\n',pScore)
    end
% d. If the player?s score is above 21, they lose. Announce the loser and end the function
    if pScore>21
        fprintf('Bust! You lose!\n')
        return
% e. If the player?s score is 21 or below, and they have 5 cards, they win. Announce the
% winner and end the function
    elseif (pScore<=21) && numel(pHand)==5
        fprintf('21 or (below and you have 5 cards). You win!\n')
        return
    end
% f. If the player?s score is 21 or below and they have less than 5 cards, go back to Step 11
end
% 14. Print both of the dealer?s cards
fprintf('The dealer has the following cards:\n')
printcard(dHand)
% 15. Print the dealer?s score
fprintf('The score for the dealer is: %.0f\n',dScore)
dHanLen=numel(dHand);
check=0;
while check==0
% 16. If the dealer's score is below 17, hit
    if dScore<17
% b. Update the number of cards the dealer has
        [ dHand(dHanLen+1), sDeck ] = dealcard( sDeck );
% a. Print the card that was dealt
        fprintf('The dealer has been dealt:\n');
        printcard(dHand(dHanLen+1))
% c. Calculate the dealer?s new score
        dScore=calcscore(dHand);
        dHanLen=numel(dHand);
        for w=1:dHanLen
            if (dScore>21)&&(strcmp('Ace',dHand(w).Value))
            dScore=dScore-10;
            end
        end
        fprintf('The dealer''s new score is: %.0f\n',dScore);
    elseif dScore>=17
        check=1;
    end

    if dScore>21
% d. If the dealer?s score is above 21, they lose. Announce the loser and end the function
% e. If the dealer?s score is 21 or below, and they have 5 cards, they win. Announce the
% winner and end the function
        fprintf('The dealer has busted! They lose!\n')
        return
    elseif ((dScore<=21 && numel(dHand)==5)||dScore==21)&&(pScore<dScore)
        fprintf('The dealer has gone to 21 (above the player) or lasted 5 hands without going over! They win!\n')
        return
    % f. If the dealer?s score is 21 or below and they have less than 5 cards, go back to Step 16.
    end
end

% 17. Check to see who won
% 18. Announce the winner, then end the function
pWin2=(pScore>dScore);
dWin2=(dScore>pScore);
push2=(pScore==dScore);
if pWin2
    fprintf('You have the highest score! You win!\n')
    return
elseif dWin2
    fprintf('The dealer has the highest score! You lose!\n')
    return
elseif push2
    fprintf('You both tie! How uneventful!')
end

end %~

function [Card] = initdeck(deckNo)
%INITDECK Creates a structure for the amount of decks created. 
%   Input is the total number of decks created and the output is a
%   structure array of decks constructed.

%Condition Check
if ~((nargin == 1) && (mod(deckNo,1) == 0) && (deckNo > 0));
    error('Number of decks must be a single, positive, integer value.');
end

%Deck Identity
%While Condenser
Suit={...
        'Hearts', 'Harts', 'Hearts', 'Hearts', 'Hearts', 'Hearts', 'Hearts', ...
        'Hearts', 'Hearts', 'Hearts', 'Hearts', 'Hearts', 'Hearts', ...
        'Spades', 'Spades', 'Spades', 'Spades', 'Spades', 'Spades', 'Spades', ...
        'Spades', 'Spades', 'Spades', 'Spades', 'Spades', 'Spades', ...
        'Clubs', 'Clubs','Clubs','Clubs', 'Clubs', 'Clubs', 'Clubs', ...
        'Clubs', 'Clubs', 'Clubs', 'Clubs', 'Clubs', 'Clubs',...
        'Diamonds', 'Diamonds', 'Diamonds', 'Diamonds', 'Diamonds', 'Diamonds', 'Diamonds', ...
        'Diamonds', 'Diamonds', 'Diamonds', 'Diamonds', 'Diamonds', 'Diamonds', ...
        };
Value={...
        '2','3','4','5','6','7','8','9','10','King','Queen','Jack','Ace',...
        '2','3','4','5','6','7','8','9','10','King','Queen','Jack','Ace',...
        '2','3','4','5','6','7','8','9','10','King','Queen','Jack','Ace',...
        '2','3','4','5','6','7','8','9','10','King','Queen','Jack','Ace',...
        };
Number={...
        2,3,4,5,6,7,8,9,10,10,10,10,11,...
        2,3,4,5,6,7,8,9,10,10,10,10,11,...
        2,3,4,5,6,7,8,9,10,10,10,10,11,...
        2,3,4,5,6,7,8,9,10,10,10,10,11,...
        };
    
Card=struct('Suit',Suit,'Value',Value,'Number',Number);
Card=repmat(Card,1,deckNo);

end %Tested

function [sCard] = shuffle(Card)
%SHUFFLE Randomly selects a card and switches that value with another card.
%   The input is the original card structure and the output is the shuffled
%   card structure.
numCard=numel(Card);
if ~((isstruct(Card)==true) && (numCard>=52))
    error('Input is not a structure array whose number of elements is 52+'); 
end

for i=1:3000 
    %rng
    r=randi(numCard,2,1);
    temp1=Card(r(1,1)).Suit;
    temp2=Card(r(1,1)).Value;
    temp3=Card(r(1,1)).Number;
    %Switch 1
    Card(r(1,1)).Suit=Card(r(2,1)).Suit;
    Card(r(1,1)).Value=Card(r(2,1)).Value;
    Card(r(1,1)).Number=Card(r(2,1)).Number;
    %Switch 2
    Card(r(2,1)).Suit=temp1;
    Card(r(2,1)).Value=temp2;
    Card(r(2,1)).Number=temp3;   
    sCard=Card;
end
end %Tested

function [ dCard, Card ] = dealcard( Card )
%DEALCARD Takes the first element of the deck structure and returns a card
%structure and the deck structure that is without that card.
%   
if ~(isstruct(Card)==true)
    error('Input is not a structure array'); 
end
dCard=struct('Suit',Card(1).Suit,'Value',Card(1).Value,'Number',Card(1).Number);
Card(1)=[];

end %Tested

function [score] = calcscore( Hand )
%CALCSCORE Summary of this function goes here
%   Detailed explanation goes here

if ~(isstruct(Hand)==true)
    error('Input is not a structure array');
end
q=numel(Hand);
score=0;
for j=1:q
    num=Hand(j).Number;
    score=score+num;
end
    
end %Tested

function [] = printcard( CardStruct )
%PRINTCARD Prints the inputted card structure
%   example (King of Spades)
if ~(isstruct(CardStruct)==true)
    error('Input is not a structure array'); 
end
n=numel(CardStruct);
for i=1:n
    fprintf('%s of %s\n',CardStruct(i).Value,CardStruct(i).Suit)
end

end %Tested

%{
Side note:
This project was hell...and I enjoyed it :')

Also, I've noticed that as the number of decks increases, the cards become
less and less shuffled. Perhaps this could be solved by creating a
function that has the total amount of card switches dependent upon the
total amount of decks present.
%}


