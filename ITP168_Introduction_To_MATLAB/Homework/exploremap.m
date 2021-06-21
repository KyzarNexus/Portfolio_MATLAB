function exploremap()
%EXPLOREMAP is an interactive 3D map of the main Hawaiian islands
% The EXPLOREMAP function takes in no inputs and returns no outputs
% It loads longitude, lattitude, and elevation data, creates a boundary
% box, and plots a surface which represents a section of overall terrain
% map. The terrain map is drawn in a subplot below the surface plot and
% shows the overall terrain along with the boundary lines that translate to
% the boundaries of the surface plot. Have fun...
%{
    Michael Kyzar
    ITP 168, Spring 2016
    HW 9  
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
11/16/2016  First Draft     Michael Kyzar
%}
%{
Side Note: If you would like an easier way to check whether the surface
plot matches up with contour and the blue box, 
uncomment the following:    32,92-108
and comment the following:  
%}

%load data
load('HW9.mat')
%we now have access to the variables X,Y ELEV

% % % Temp Test:
% ELEV(182:188,50:56)=10000;

earthRad=6371000;
%calculate the differences between each element in X and Y
dX=diff(X);
dY=diff(Y);

%create a vector of zeros
xMeter=zeros(1,335);
yMeter=zeros(230,1);

%calculate the values of the X and Y vectors in METERS
for n= 2:335 
    xMeter(n)=xMeter(n-1)+earthRad*tand(dX(n-1));
end
for b= 2:230
    yMeter(b)=yMeter(b-1)+earthRad*tand(dY(b-1));
end
%find dimensions of the ELEV variable to determine the number of rows and
%columns
[nRowGrid, nColGrid]= size(ELEV);
%determine boundary box size
bS=50;
%give starting and ending X and Y points
xBound=1:bS;
yBound=1:bS;
%build grid
[xGrid,yGrid]=meshgrid(xMeter,yMeter);
[xBGrid,yBGrid]=meshgrid(xBound,yBound);

%determine how many points to shift when we move
xShift=10;
yShift=10;
%create the vectors for the boundary box (two elements in each)
topX=[xMeter(xBound(1)),xMeter(xBound(bS))];    topY=[yMeter(yBound(bS)),yMeter(yBound(bS))];
botX=[xMeter(xBound(1)),xMeter(xBound(bS))];    botY=[yMeter(yBound(1)),yMeter(yBound(1))];
lefX=[xMeter(xBound(1)),xMeter(xBound(1))];     lefY=[yMeter(yBound(1)),yMeter(yBound(bS))];
rigX=[xMeter(xBound(bS)),xMeter(xBound(bS))];   rigY=[yMeter(yBound(1)),yMeter(yBound(bS))];
%plot first grid (use the value of the boundary box size)
posX=xMeter(xBGrid);
posY=yMeter(yBGrid);
posZ=ELEV(xBound,yBound);

subplot(2,1,1) 
surface=surf(posX,posY,posZ);
axis equal
%call subplot and plot the surface
%set the axis to equal

%call subplot and plot the contour and the boundary box
subplot(2,1,2) 
contour(xGrid,yGrid,ELEV,10)
hold on
lplot=plot(lefX,lefY,'b-');
rplot=plot(rigX,rigY,'b-');
tplot=plot(topX,topY,'b-');
bplot=plot(botX,botY,'b-');
hold off


% % subplot(2,2,1) 
% % surface=surf(posX,posY,posZ);
% % axis equal
% % %call subplot and plot the surface
% % %set the axis to equal
% % 
% % %call subplot and plot the contour and the boundary box
% % subplot(2,2,2) 
% % contour(xGrid,yGrid,ELEV,10)
% % hold on
% % lplot=plot(lefX,lefY,'b-');
% % rplot=plot(rigX,rigY,'b-');
% % tplot=plot(topX,topY,'b-');
% % bplot=plot(botX,botY,'b-');
% % hold off
% % subplot(2,2,3:4)
% % surf(xGrid,yGrid,ELEV)


%don't touch this stuff
set(gcf,'KeyPressFcn',@callback);
set(gcf,'CurrentCharacter','n');
while (true)
    choose = get(gcf,'CurrentCharacter');
    switch choose
        case 's'
            %the user wants to move south
            %write code here
            if(yBound(bS)+yShift)>nRowGrid
                yBound=(nRowGrid-bS+1):(nRowGrid);
            else
                yBound=yBound+yShift;
            end   
            %stop writing code here
        case 'w'
            %the user wants to move north
            %write code here
            if(yBound(1)-yShift)<1
                yBound=1:bS;
            else
                yBound=yBound-yShift;
            end
            %stop writing code here
        case 'a'
            %the user wants to move west
            %write code here
            if(xBound(bS)+xShift)>nColGrid
                xBound=(nColGrid-bS+1):(nColGrid);
            else
                xBound=xBound+xShift;
            end
            %stop writing code here
        case 'd'
            %the user wants to move east
            %write code here
            if(xBound(1)-xShift)<1
                xBound=1:bS;
            else
                xBound=xBound-xShift;
            end
            %stop writing code here
        case 'q'
            %user quits
            break;
    end
    set(gcf,'CurrentCharacter','n');
    %continue writing code here
    %calculate NEW boundary box X and Y values (for all 4 lines)
    
    % % For 3D Graph
    [xBGrid, yBGrid]=meshgrid(xBound,yBound);
    posX=xMeter(xBGrid);
    posY=yMeter(yBGrid);
    posZ=ELEV(yBound,xBound);
    % % For Contour Plot
    topX=[xMeter(xBound(1)),xMeter(xBound(bS))];    topY=[yMeter(yBound(bS)),yMeter(yBound(bS))];
    botX=[xMeter(xBound(1)),xMeter(xBound(bS))];    botY=[yMeter(yBound(1)),yMeter(yBound(1))];
    lefX=[xMeter(xBound(1)),xMeter(xBound(1))];     lefY=[yMeter(yBound(1)),yMeter(yBound(bS))];
    rigX=[xMeter(xBound(bS)),xMeter(xBound(bS))];   rigY=[yMeter(yBound(1)),yMeter(yBound(bS))];
    %use set function to set XData and YData for the boundary lines and the
    %surface plot

    set(surface,'XData',posX);  set(surface,'YData',posY);  set(surface,'ZData',posZ);
    
    set(tplot,'XData',topX);    set(tplot,'YData',topY);
    set(bplot,'XData',botX);    set(bplot,'YData',botY);
    set(lplot,'XData',lefX);    set(lplot,'YData',lefY);
    set(rplot,'XData',rigX);    set(rplot,'YData',rigY);
    
    hold off
    
    %call drawnow function
    drawnow;
end
end

%don't touch any of this.
function callback(hObject, callbackdata)

end

