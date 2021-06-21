%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 9 
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
----------------------------------------
07/28/2016  First Draft     Michael Kyzar
%}
clear;clc;
%Creation of structures of structures of structures.
%Create Affiliate Structure
uscAffiliate= struct('Student',[],'Faculty',[]);
% Create Student Structure
sName={'Artemis Asimov','Elizabeth Shard','David Sarif'};
uscID={1212768013 179361073 740279836};
gpa={4.0 3.98 3.89};
email={'artasimov@usc.edu','elshard@usc.edu','davsarif@usc.edu'};
uscAffiliate.Student=struct('Name',sName,'USCID',uscID,'GPA',gpa,'Email',email);
% Create Faculty Strucutre
fName={'Cave Johnson' 'Adam Jensen' 'Hugh Darrow'};
employeeID={314159265 168392680 037495190};
rating={2.78 3.57 3.89};
email={'cavej@usc.edu' 'ajensen@usc.edu' 'hughdarr@usc.edu'};
uscAffiliate.Faculty= struct('Name',fName,'EmployeeID',employeeID,'Rating',rating,'Email',email);
%Directory Menu
consent=true;
while consent==true
    fprintf('USC AFFILIATE DIRECTORY\n');
    fprintf('***********************\n');
    fprintf('Please choose a directory:(Case-Sensitive)\nStudent\nFaculty\n');
    choice=input(' ','s');
    %Creating 1 if statement to encompass all choices
    if strcmp(choice,'Student')||strcmp(choice,'Faculty')
        num=length(uscAffiliate.(choice));
        %To accomodate for deviation in catagory names:
        if strcmp(choice,'Student');
            id= 'USC';
            idsel='USCID';
            score= 'GPA';
        else strcmp(choice,'Faculty');
            id= 'Employee';
            idsel='EmployeeID';
            score= 'Rating';
        end;
        for i=1:num
            fprintf('\n%s %0.0f: %s',choice, i, uscAffiliate.(choice)(i).Name);
        end;
        userFlag=true;
        while userFlag==true
            option=input('\nPlease choose your subject number:');
            if option>num||option<1
                fprint('Invalid Choice. Please Choose Again.');
            else
                fprintf('Name: %s\n', uscAffiliate.(choice)(option).Name);
                fprintf('%s ID: %.0f\n',id,uscAffiliate.(choice)(option).(idsel));
                fprintf('%s: %.2f\n',score,uscAffiliate.(choice)(option).(score));
                fprintf('Email: %s',uscAffiliate.(choice)(option).Email);
                userFlag=false;
            end;
        end;
        repeat=input('\nLook through the directory again? (y/n)','s');
        if ~strcmpi(repeat,'y');
            consent=false;
        end;
        clc;
    else
        clc;
        fprintf('Invalid response. Please give a valid response.\n');
    end;
end;

