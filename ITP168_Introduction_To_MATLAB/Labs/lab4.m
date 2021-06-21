%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab4  
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
09/12/2016  First Draft     Michael Kyzar
%}
display('Temperature Converter')

%Asking for the numberical value and scale
temp=input('What temperature do you wish to convert?');
scale=input('Ok, so is this temperature in Fahrenheit or Celcius? (Input F or C)','s');
%Checking if 'temp' is not a string
switch scale
    %Creating Case for Fahrenheit to Celcius.
    case 'F'
        ftcConvert= (temp-32)*(5/9);
        fprintf('Your temperature of %.2f degrees Fahrenheit is %.2f degrees in Celcius. Have a nice day!',temp,ftcConvert);
    %Creating Case for Celcius to Fahrenheit.
    case 'C'
        ctfConvert= (9/5)*temp+32;
        fprintf('Your temperature of %.2f degrees Celcius is %.2f degrees in Fahrenheit. Have a nice day!',temp,ctfConvert);
    %Derogatory "Catch all" statement.
    otherwise
        fprintf('Wow! You really know how to type F or C... Please tell me your (correct) temperature scale.')
end;

