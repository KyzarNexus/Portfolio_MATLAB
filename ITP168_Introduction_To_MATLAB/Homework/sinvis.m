function [ ] = sinvis( simLen )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if ~((nargin == 1) && (mod(simLen,1) == 0) && (simLen > 0))
    error('The input must be a single, positive, integer value.');
end
figure; 
%Figure Info: Circle 
r=1;
rDomain=linspace(0,2*pi,300);
cirX=r*cos(rDomain);  cirY=r*sin(rDomain);
cirPlot=plot(cirX,cirY,'b-'); hold on
cycle=linspace(0,2*pi*simLen,1000*simLen);%1000*simLen used to account for decreasing precision as simLen increases.
%Figure Info: Sin Wave 
SinYVal=zeros(1,1000*simLen); SinXVal=zeros(1,1000*simLen);
sinVal(1)=sin(0);
sinPlot=plot(0,0,'c.');
%Figure Info: Radial Line~
radX=zeros(1,2);
radX(1,1)=0;    radX(1,2)=cycle(1);
radY=zeros(1,2);
radY(1,1)=sinVal(1);    radY(1,2)=sinVal(1);
radPlot=plot(radX,radY,'k-');
%Figure Info: Horizontal Line~
horX=zeros(1,2);    horX(1,1)=0;    horX(1,2)=cycle(1);
horY=zeros(1,2); horY(1,1)=sinVal(1); horY(1,2)=sinVal(1);
horPlot=plot(horX,horY,'r--');
%Figure Infor: Single Point
xLoc=SinXVal(1);  yLoc=sinVal(1);
ponPlot=plot(xLoc,yLoc,'k*');
%Graph Qualities Initial
axis([-2 2 -2 2]);
title('Sine Visualization')
xlabel('X (radians)')
ylabel('Sin(X)')
hold off
%Animation
for i1=1:1000*simLen
    %Graph Qualities
    axis([(-2+cycle(i1)) (2+cycle(i1)) -2 2]); 
    % %Updated Locations
    %Circle
    for i2 = 1:300
        cirX(i2)=cos(rDomain(i2))+cycle(i1);
    end
    set(cirPlot,'XData',cirX);  set(cirPlot,'YData',cirY);
    %Sin
    SinXVal(i1)=cycle(i1);    SinYVal(i1)=sin(cycle(i1));
    set(sinPlot,'XData',SinXVal);      set(sinPlot,'YData',SinYVal);
    %Rad
    radX(1,1)=cycle(i1);    radX(1,2)=cycle(i1)+cos(cycle(i1));
    radY(1,2)=SinYVal(i1);
    set(radPlot,'XData',radX);  set(radPlot,'YData',radY);
    %Hor
    horX(1,1)=cycle(i1); horX(1,2)=cycle(i1)+cos(cycle(i1));
    horY(1,1)=SinYVal(i1); horY(1,2)=SinYVal(i1);    
    set(horPlot,'XData',horX);    set(horPlot,'YData',horY);
    %Pon
    px=cycle(i1);
    py=SinYVal(i1);
    set(ponPlot,'XData',px);      set(ponPlot,'YData',py);
   
    drawnow; 
end

end

