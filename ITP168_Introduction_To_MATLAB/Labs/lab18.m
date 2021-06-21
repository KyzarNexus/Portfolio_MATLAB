%{
    Michael Kyzar
    ITP 168, Spring 2016
    Lab 18  
    kyzar@usc.edu

    Revision History
Date        Changes         Programmer
------------------------------
11/02/2016  First Draft     Michael Kyzar
%}
clear;clc;
rawData=importdata('brainhead.txt');
m20t46=[]; m46p=[]; f20t46=[]; f46p=[];
nRow=size(rawData,1);
for i=1:nRow
    if rawData(i,1)==1
        if rawData(i,2)==1
            m20t46=[m20t46;rawData(i,3),rawData(i,4)];
        elseif rawData(i,2)==2
            m46p=[m46p;rawData(i,3),rawData(i,4)];
        end
    elseif rawData(i,1)==2
        if rawData(i,2)==1
            f20t46=[f20t46;rawData(i,3),rawData(i,4)];
        elseif rawData(i,2)==2
            f46p=[f46p;rawData(i,3),rawData(i,4)];
        end
    end 
end
x1=m20t46(:,2); x2=m46p(:,2); x3=f20t46(:,2); x4=f46p(:,2);
y1=m20t46(:,1); y2=m46p(:,1); y3=f20t46(:,1); y4=f46p(:,1);
p1=polyfit(x1,y1,1); p2=polyfit(x2,y2,1); p3=polyfit(x3,y3,1); p4=polyfit(x4,y4,1);
xFitRan1=linspace(min(x1),max(x1),100); xFitRan2=linspace(min(x2),max(x2),100);
xFitRan3=linspace(min(x3),max(x3),100); xFitRan4=linspace(min(x4),max(x4),100);
fit1=polyval(p1,xFitRan1); fit2=polyval(p2,xFitRan2);
fit3=polyval(p3,xFitRan3); fit4=polyval(p4,xFitRan4);
figure; %hold on
subplot(2,2,1), plot(x1,y1,'k*',xFitRan1,fit1,'b--')
xlabel('Brain Mass (gram)')
ylabel('Head Size (cm^{3})')
title('Male 20-46')
axis tight
hold off
hold on
subplot(2,2,2), plot(x2,y2,'k*',xFitRan2,fit2,'b--')
xlabel('Brain Mass (gram)')
ylabel('Head Size (cm^{3})')
title('Male 46+')
axis tight
hold off
hold on
subplot(2,2,3), plot(x3,y3,'k*',xFitRan3,fit3,'b--')
xlabel('Brain Mass (gram)')
ylabel('Head Size (cm^{3})')
title('Female 20-46')
axis tight
hold off
hold on
subplot(2,2,4),plot(x4,y4,'k*',xFitRan4,fit4,'b--')
xlabel('Brain Mass (gram)')
ylabel('Head Size (cm^{3})')
title('Female 46+')
axis tight
hold off
