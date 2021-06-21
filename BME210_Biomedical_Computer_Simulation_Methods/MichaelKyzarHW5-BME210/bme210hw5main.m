%{
Michael Kyzar
BME 210
HW #5
15th April 2019
%}

%% Part 2: Simulation Study 1
% Initializing Variables
clear; clc; clf;
N = 100; 
a1 = 5; a2 = 10;
b1 = 10000; b2 = 20000;
c1 = 0; c2 = 0;
DTb = 0.6;
ND = 60; NSIM = 20;
NH = 99; NI = 0; NC = 1; NHI = 0;

% Setting up Record
rNH = zeros(ND,NSIM); rNH(1,:) = NH; 
rNI = zeros(ND,NSIM); rNI(1,:) = NI;
rNC = zeros(ND,NSIM); rNC(1,:) = NC;
rNHI = zeros(ND,NSIM); rNHI(1,:) = NHI;

for sim = 1:NSIM % Trial Replication
    NH = 99; NI = 0; NC = 1; NHI = 0;
    % Initializing Subpopulations
    % Healthy and Not Immune
    M1 = zeros(NH,1);
    IM1 = zeros(NH,1);
    % Infected
    M2 = -floor((a2-a1+1)*rand(NI,1))-a1;
    IM2 = zeros(NI,1);
    % Contageous
    M3 = floor((b2-b1+1)*rand(NC,1))+b1;
    IM3 = zeros(NC,1);
    % Healthy and Immune
    M4 = zeros(NHI,1);
    IM4 = -floor((c2-c1+1)*rand(NHI,1))-c1;
    % Combining Sets
    M = [M1' M2' M3' M4']';
    IM = [IM1' IM2' IM3' IM4']';
    
    for t = 2:ND % Sample Period Loop
        % Randomly Expose Population
        for meet = 1:N/2
            DT = floor(rand + DTb);
            if DT == 1
                I = floor(N*rand) + 1;
                J = floor(N*rand) + 1;
                if M(I) > 0 && M(J) == 0 && IM(J) >= 0
                    M(J) = -floor((a2-a1+1)*rand)-a1;
                end
                if M(J) > 0 && M(I) == 0 && M(J) >= 0
                    M(I) = -floor((a2-a1+1)*rand)-a1;
                end
            end
        end
        % Recording Results
        rNI(t,sim) = sum(M<0); % Infected
        rNC(t,sim) = sum(M>0); % Contagious
        rNHI(t,sim) = sum((M==0) & (IM < 0)); % Healthy and immune
        rNH(t,sim) = sum((M==0) & (IM >=0)); % Healthy and not immune
        % Updating Health and Disease Status
        for i = 1:N
            if M(i) == 0 % Healthy for both terms
                IM(i) = IM(i) + 1;
            elseif M(i) > 0 
                M(i) = M(i) - 1;
                if M(i) == 0 % Updating once counted down
                    IM(i) = -floor((c2-c1+1)*rand) - c1;
                end
            elseif M(i) < 0
                M(i) = M(i) + 1;
                if M(i) == 0 % Updating once counted down
                    M(i) = floor((b2-b1+1)*rand)+b1;
                end
            end            
        end
    end
end

tspan = 1:ND;
for i = 1:NSIM % NH
    h1 = plot(tspan,rNH(:,i),'b');
    hold on
end
for i = 1:NSIM % NI
    h2 = plot(tspan,rNI(:,i),'m');
end
for i = 1:NSIM % NC
    h3 = plot(tspan,rNC(:,i),'r');
end
for i = 1:NSIM % NHI
    h4 = plot(tspan,rNHI(:,i),'g');
end

title('Spread of Disease over Time')
xlabel('Time (days)')
ylabel('Number Affected')
legend([h1 h2 h3 h4],'Healthy (NH)','Infected (NI)','Contagious (NC)','Immune (NHI)');
hold off
%% Part 3
%% Simulation Study 2
% Initializing Variables
clear; clc; close all;
N = 1000; 
a1 = 4; a2 = 9;
b1 = 13; b2 = 15;
c1 = 6; c2 = 16;
DTb = 0.6;
ND = 500; NSIM = 100;
NH = 999; NI = 0; NC = 1; NHI = 0;

% Setting up Record
rNH = zeros(ND,NSIM); rNH(1,:) = NH; 
rNI = zeros(ND,NSIM); rNI(1,:) = NI;
rNC = zeros(ND,NSIM); rNC(1,:) = NC;
rNHI = zeros(ND,NSIM); rNHI(1,:) = NHI;

for sim = 1:NSIM % Trial Replication
    NH = rNH(1,1); NI = rNI(1,1); NC = rNC(1,1); NHI = rNHI(1,1);
    % Initializing Subpopulations
    % Healthy and Not Immune
    M1 = zeros(NH,1);
    IM1 = zeros(NH,1);
    % Infected
    M2 = -floor((a2-a1+1)*rand(NI,1))-a1;
    IM2 = zeros(NI,1);
    % Contageous
    M3 = floor((b2-b1+1)*rand(NC,1))+b1;
    IM3 = zeros(NC,1);
    % Healthy and Immune
    M4 = zeros(NHI,1);
    IM4 = -floor((c2-c1+1)*rand(NHI,1))-c1;
    % Combining Sets
    M = [M1' M2' M3' M4']';
    IM = [IM1' IM2' IM3' IM4']';
    
    for t = 2:ND % Sample Period Loop
        % Randomly Expose Population
        for meet = 1:N/2
            DT = floor(rand + DTb);
            if DT == 1
                I = floor(N*rand) + 1;
                J = floor(N*rand) + 1;
                if M(I) > 0 && M(J) == 0 && IM(J) >= 0
                    M(J) = -floor((a2-a1+1)*rand)-a1;
                end
                if M(J) > 0 && M(I) == 0 && M(J) >= 0
                    M(I) = -floor((a2-a1+1)*rand)-a1;
                end
            end
        end
        % Recording Results
        rNI(t,sim) = sum(M<0); % Infected
        rNC(t,sim) = sum(M>0); % Contagious
        rNHI(t,sim) = sum((M==0) & (IM < 0)); % Healthy and immune
        rNH(t,sim) = sum((M==0) & (IM >=0)); % Healthy and not immune
        % Updating Health and Disease Status
        for i = 1:N
            if M(i) == 0 % Healthy for both terms
                IM(i) = IM(i) + 1;
            elseif M(i) > 0 
                M(i) = M(i) - 1;
                if M(i) == 0 % Updating once counted down
                    IM(i) = -floor((c2-c1+1)*rand) - c1;
                end
            elseif M(i) < 0
                M(i) = M(i) + 1;
                if M(i) == 0 % Updating once counted down
                    M(i) = floor((b2-b1+1)*rand)+b1;
                end
            end            
        end
    end
end
tCut = 500;
tspan = 1:tCut;
tFin = ND;
nBins = 10;
subplot(2,2,1)
for i = 1:NSIM % NH
    h1 = plot(tspan,rNH(1:tCut,i),'b');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Healthy (NH)')
hold off
subplot(2,2,2)
for i = 1:NSIM % NI
    h2 = plot(tspan,rNI(1:tCut,i),'m');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Infected (NI)')
hold off
subplot(2,2,3)
for i = 1:NSIM % NC
    h3 = plot(tspan,rNC(1:tCut,i),'r');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Contagious (NC)')
hold off
subplot(2,2,4)
for i = 1:NSIM % NHI
    h4 = plot(tspan,rNHI(1:tCut,i),'g');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Immune (NHI)')
hold off
sgtitle('Number of Affected over Time')
% Generating Histogram
figure
subplot(2,2,1) % NH
histogram(rNH(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Healthy (NH)')
subplot(2,2,2) % NI
histogram(rNI(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Infected (NI)')
subplot(2,2,3) % NC
histogram(rNC(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Contagious (NC)')
subplot(2,2,4) % NHI
histogram(rNHI(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Immune (NHI)')
sgtitle('Distribution of Endstates for All Simulations')
%% Simulation Study 3
% Initializing Variables
clear; clc; close all;
N = 1000; 
a1 = 4; a2 = 9;
b1 = 2; b2 = 15;
c1 = 6; c2 = 16;
DTb = 0.6;
ND = 500; NSIM = 100;
NH = 499; NI = 0; NC = 1; NHI = 500;

% Setting up Record
rNH = zeros(ND,NSIM); rNH(1,:) = NH; 
rNI = zeros(ND,NSIM); rNI(1,:) = NI;
rNC = zeros(ND,NSIM); rNC(1,:) = NC;
rNHI = zeros(ND,NSIM); rNHI(1,:) = NHI;

for sim = 1:NSIM % Trial Replication
    NH = rNH(1,1); NI = rNI(1,1); NC = rNC(1,1); NHI = rNHI(1,1);
    % Initializing Subpopulations
    % Healthy and Not Immune
    M1 = zeros(NH,1);
    IM1 = zeros(NH,1);
    % Infected
    M2 = -floor((a2-a1+1)*rand(NI,1))-a1;
    IM2 = zeros(NI,1);
    % Contageous
    M3 = floor((b2-b1+1)*rand(NC,1))+b1;
    IM3 = zeros(NC,1);
    % Healthy and Immune
    M4 = zeros(NHI,1);
    IM4 = -floor((c2-c1+1)*rand(NHI,1))-c1;
    % Combining Sets
    M = [M1' M2' M3' M4']';
    IM = [IM1' IM2' IM3' IM4']';
    
    for t = 2:ND % Sample Period Loop
        % Randomly Expose Population
        for meet = 1:N/2
            DT = floor(rand + DTb);
            if DT == 1
                I = floor(N*rand) + 1;
                J = floor(N*rand) + 1;
                if M(I) > 0 && M(J) == 0 && IM(J) >= 0
                    M(J) = -floor((a2-a1+1)*rand)-a1;
                end
                if M(J) > 0 && M(I) == 0 && M(J) >= 0
                    M(I) = -floor((a2-a1+1)*rand)-a1;
                end
            end
        end
        % Recording Results
        rNI(t,sim) = sum(M<0); % Infected
        rNC(t,sim) = sum(M>0); % Contagious
        rNHI(t,sim) = sum((M==0) & (IM < 0)); % Healthy and immune
        rNH(t,sim) = sum((M==0) & (IM >=0)); % Healthy and not immune
        % Updating Health and Disease Status
        for i = 1:N
            if M(i) == 0 % Healthy for both terms
                IM(i) = IM(i) + 1;
            elseif M(i) > 0 
                M(i) = M(i) - 1;
                if M(i) == 0 % Updating once counted down
                    IM(i) = -floor((c2-c1+1)*rand) - c1;
                end
            elseif M(i) < 0
                M(i) = M(i) + 1;
                if M(i) == 0 % Updating once counted down
                    M(i) = floor((b2-b1+1)*rand)+b1;
                end
            end            
        end
    end
end
tCut = 500;
tspan = 1:tCut;
tFin = ND;
nBins = 10;
subplot(2,2,1)
for i = 1:NSIM % NH
    h1 = plot(tspan,rNH(1:tCut,i),'b');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Healthy (NH)')
hold off
subplot(2,2,2)
for i = 1:NSIM % NI
    h2 = plot(tspan,rNI(1:tCut,i),'m');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Infected (NI)')
hold off
subplot(2,2,3)
for i = 1:NSIM % NC
    h3 = plot(tspan,rNC(1:tCut,i),'r');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Contagious (NC)')
hold off
subplot(2,2,4)
for i = 1:NSIM % NHI
    h4 = plot(tspan,rNHI(1:tCut,i),'g');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Immune (NHI)')
hold off
sgtitle('Number of Affected over Time')

% Generating Histogram
figure
subplot(2,2,1) % NH
histogram(rNH(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Healthy (NH)')
subplot(2,2,2) % NI
histogram(rNI(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Infected (NI)')
subplot(2,2,3) % NC
histogram(rNC(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Contagious (NC)')
subplot(2,2,4) % NHI
histogram(rNHI(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Immune (NHI)')
sgtitle('Distribution of Endstates for All Simulations')
%% Simulation Study 4 
% Initializing Variables
clear; clc; close all;
N = 1000; 
a1 = 4; a2 = 9;
b1 = 13; b2 = 15;
c1 = 6; c2 = 16;
DTb = 0.6;
ND = 500; NSIM = 100;
NH = 999; NI = 0; NC = 1; NHI = 0;

% Setting up Record
rNH = zeros(ND,NSIM); rNH(1,:) = NH; 
rNI = zeros(ND,NSIM); rNI(1,:) = NI;
rNC = zeros(ND,NSIM); rNC(1,:) = NC;
rNHI = zeros(ND,NSIM); rNHI(1,:) = NHI;

for sim = 1:NSIM % Trial Replication
    NH = rNH(1,1); NI = rNI(1,1); NC = rNC(1,1); NHI = rNHI(1,1);
    % Initializing Subpopulations
    % Healthy and Not Immune
    M1 = zeros(NH,1);
    IM1 = zeros(NH,1);
    % Infected
    M2 = -floor((a2-a1+1)*rand(NI,1))-a1;
    IM2 = zeros(NI,1);
    % Contageous
    M3 = floor((b2-b1+1)*rand(NC,1))+b1;
    IM3 = zeros(NC,1);
    % Healthy and Immune
    M4 = zeros(NHI,1);
    IM4 = -floor((c2-c1+1)*rand(NHI,1))-c1;
    % Combining Sets
    M = [M1' M2' M3' M4']';
    IM = [IM1' IM2' IM3' IM4']';
    
    for t = 2:ND % Sample Period Loop
        % Randomly Expose Population
        for meet = 1:N/2
            DT = floor(rand + DTb);
            if DT == 1
                I = floor(N*rand) + 1;
                J = floor(N*rand) + 1;
                if M(I) > 0 && M(J) == 0 && IM(J) >= 0
                    M(J) = -floor((a2-a1+1)*rand)-a1;
                end
                if M(J) > 0 && M(I) == 0 && M(J) >= 0
                    M(I) = -floor((a2-a1+1)*rand)-a1;
                end
            end
        end
        % Recording Results
        rNI(t,sim) = sum(M<0); % Infected
        rNC(t,sim) = sum(M>0); % Contagious
        rNHI(t,sim) = sum((M==0) & (IM < 0)); % Healthy and immune
        rNH(t,sim) = sum((M==0) & (IM >=0)); % Healthy and not immune
        % Updating Health and Disease Status
        for i = 1:N
            if M(i) == 0 % Healthy for both terms
                IM(i) = IM(i) + 1;
            elseif M(i) > 0 
                M(i) = M(i) - 1;
                if M(i) == 0 % Updating once counted down
                    IM(i) = -floor((c2-c1+1)*rand) - c1;
                end
            elseif M(i) < 0
                M(i) = M(i) + 1;
                if M(i) == 0 % Updating once counted down
                    M(i) = floor((b2-b1+1)*rand)+b1;
                end
            end            
        end
    end
end
tCut = 500;
tspan = 1:tCut;
tFin = ND;
nBins = 10;
subplot(2,2,1)
for i = 1:NSIM % NH
    h1 = plot(tspan,rNH(1:tCut,i),'b');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Healthy (NH)')
hold off
subplot(2,2,2)
for i = 1:NSIM % NI
    h2 = plot(tspan,rNI(1:tCut,i),'m');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Infected (NI)')
hold off
subplot(2,2,3)
for i = 1:NSIM % NC
    h3 = plot(tspan,rNC(1:tCut,i),'r');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Contagious (NC)')
hold off
subplot(2,2,4)
for i = 1:NSIM % NHI
    h4 = plot(tspan,rNHI(1:tCut,i),'g');
    hold on
end
xlabel('Time (Days)')
ylabel('Number Currently Immune (NHI)')
hold off
sgtitle('Number of Affected over Time')

% Generating Histogram
figure
subplot(2,2,1) % NH
histogram(rNH(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Healthy (NH)')
subplot(2,2,2) % NI
histogram(rNI(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Infected (NI)')
subplot(2,2,3) % NC
histogram(rNC(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Contagious (NC)')
subplot(2,2,4) % NHI
histogram(rNHI(tFin,:),nBins)
ylabel('Frequency')
xlabel('Number Immune (NHI)')
sgtitle('Distribution of Endstates for All Simulations')
