% STIMANALYSIS Creates an overlapping graph of pulse and records results.
%   Input: None. It pulls it's data from the file 'PulseGraphQueue'
%   Action: Opens each .abf file, determines where to cut the data, and
%   plots an overlap of each selected data for each file.
%   Output: An overlapped plot for all inputted files.
%   Special Notes: 
%   -Requires the functions abfload.m and pvpmod.m to open '.abf' files.
%   -Requires the function fftf.m to perform a fourier analysis.
%   -Do NOT run this function when in the folder 'PulseGraphQueue'.
%    It will not work under that situation.
%   -It is recommended that the stimulus order (250 µA, 300µA, etc.) be in
%   sequential file order. Please rename the files so that they go in
%   sequential file order alphabetically.

%{ 
--------------------------------------------------------------------------
Changelog:
M. Kyzar  5/14/2019   
-Created initial functionality for graphing the raw data
M. Kyzar 5/22/2019
-Added functionality for CAP normalized amplitude and rudimentary latency
to onset calculations
M. Kyzar 5/28/2019
-Refined latency to onset calculations by using a local minimum test for an
fft filter of the signal. 
M. Kyzar 5/29/2019
-Combined Control and Experimental Analysis into the same function, adding
FFT analysis in addition to the previous latency calculations.
-Added graph overlays for CAP and latency graphs.
M. Kyzar 6/3/2019
- Added statistical analysis
- Cleaned up sloppy file import method.
- Started work on a generalized program to get the processed data one needs
in this context. 
M. Kyzar 6/19/2019
- Function almost finalized
- Added a couple more graphing features
--------------------------------------------------------------------------   
Potential Improvements:
-Possibly determine best type of data to use for each graph by
 measuring the resulting peak in an offset region from the stimulation.
-Adjust for different sampling rates.
-May need to include color customization later.
-Possibly determine best type of data to use for each graph by
 measuring the resulting peak in an offset region from the stimulation.
-Creating a better slicing method that maintains a good aspect ratio for
data visualization. 
-Better labeling method for each mV trial. (& descendent legend labels)
--------------------------------------------------------------------------
%}
%% Initializing (Variables for plot formatting and data slicing) 
% Clearing & Setting up variables
clear; clc; clf; 
upFrame = 1600; % Positive offset from stimulus. 
% Can be modified for sampling rate change.
downFrame = 50; % Negative offset from stimulus.
cutStim = 60;
% Can be modified for sampling rate change
% Graphing Preferences:
rawDomain = [1 6 10 11 12 13]';
titleSize = 30;
labelSize = 20;
gcaSize = 15;
legendEntries = {'250 \muA','300\muA','350 \muA','400 \muA','450 \muA','500 \muA'};
stimIntensity = [ 250 300 350 400 450 500];
linewidth = 2;

% If you want, you can modify this part to automatically adjust the plot
% legend;
%% Import: Control & Experimental
cd R27_control % File meant to be in the same file as function
contFile = dir; contFile = contFile(3:end);
% Creating a cell array from the file names in the PulseGraphQueue file.
cd ../ % Moving back to original file
cd R27_experimental
expFile = dir; expFile = expFile(3:end);
cd ../ 
% Making Large Datasets
contSignal = cell(length(contFile),1);
for i = 1:length(contFile)
    signalSlice = abfload(contFile(i).name); contSignal{i} = signalSlice(:,1);
end

expSignal = cell(length(expFile),1);
for i = 1:length(expFile)
    signalSlice = abfload(expFile(i).name); expSignal{i} = signalSlice(:,1);
end
% Slicing Datasets and making cell arrays for each data entry. 
sliceOffset = 100000; % May be adjusted for sampling rate.
stimNum = 5;
% i = different trial
% j = stimulus number
% Control
contSet = cell(length(contFile),stimNum);
for i = 1:length(contFile)
    for j = 1:stimNum
        % Note: Cut according to first 500 mV instance, remove it from the
        %  oringal dataset, and repeat with the next one until the number 
        % of slices is complete.
        markerI = find(abs(contSignal{i})>=500,1);
        contSet{i,j} = contSignal{i}(markerI - downFrame: markerI+upFrame);
        % Cutting contSignal for repeat.
        contSignal{i} = contSignal{i}(markerI+upFrame:end);
    end
end
% Experimental 
expSet = cell(length(expFile),stimNum);
for i = 1:length(expFile)
    for j = 1:stimNum
        markerI = find(abs(expSignal{i})>=500,1);
        expSet{i,j} = expSignal{i}(markerI - downFrame: markerI+upFrame);
        expSignal{i} = expSignal{i}(markerI+upFrame:end);
    end
end
%% Meshgrid Setup for Raw (in testing)
tLength =1540;%length(contSet{1,1}) - cutStim; % HIGHLY VARIABLE IF YOU USE ANY OTHER DATASET THAN R27. Use with caution
[ Tc, Ic ] = meshgrid(1:tLength,stimIntensity);
Vc = zeros(size(Tc));
[ Te, Ie ] = meshgrid(1:tLength,stimIntensity);
Ve = zeros(size(Te));
%% Raw Graph: Control
% Graphs the first entry for each amperage.
for i = 1:length(contFile)%length(rawDomain)
    select = i;%rawDomain(i);
    signalSlice = contSet{select,1};
    tspan = (((0:length(signalSlice)-1)/100e3));
    % Plotting
    figure(1)
    subplot(1,2,1)
    plot(tspan*1000, signalSlice,'linewidth',linewidth)
    set(gcf,'color','w');
    title('Response from Stimulus: Control','FontSize',titleSize)
    set(gcf,'color','w');
    ylabel ('Voltage (µV)','FontSize',labelSize)
    xlabel ('Time (ms)','FontSize',labelSize)
    xt = get(gca, 'XTick');
    set(gca, 'FontSize', gcaSize)
    ylim([-200 300])
    xlim([0 16])
    hold on
    % Meshgrid Testing (optional)
    sigMarkTemp = find(abs(signalSlice) >= 500,1);
    VcTemp = signalSlice(sigMarkTemp+cutStim+1:end);
    Vc(i,:) = VcTemp(1:tLength);
end
legend(legendEntries);
hold off
%% Raw Graph: Experimental
for i = 1:length(expFile)%length(rawDomain)
    select = i;%rawDomain(i);
    signalSlice = expSet{select,1};
    tspan = (((0:length(signalSlice)-1)/100e3));
    % Plotting
    figure(1)
    subplot(1,2,2)
    plot(tspan*1000, signalSlice,'linewidth',linewidth)
    set(gcf,'color','w');
    title('Response from Stimulus: Experimental','FontSize',titleSize)
    ylabel ('Voltage (µV)','FontSize',labelSize)
    xlabel ('Time (ms)','FontSize',labelSize)
    xt = get(gca, 'XTick');
    set(gca, 'FontSize', gcaSize)
    ylim([-200 300])
    xlim([0 16])
    hold on
    % Meshgrid Testing (optional)
    sigMarkTemp = find(abs(signalSlice) >= 500,1);
    VeTemp = signalSlice(sigMarkTemp + cutStim + 1:end);
    Ve(i,:) = VeTemp(1:tLength);
end
legend(legendEntries);
hold off
%% CAP Compound: Control
% Integrating each set.
intDataCont= zeros(length(contFile),stimNum);
for i = 1:length(contFile)
    for j = 1:stimNum
        signalSlice = contSet{i,j};
        signalMarkers = find(abs(signalSlice)>=500,1);
        signalSlice = signalSlice(signalMarkers+cutStim:signalMarkers+upFrame);
        absSignalSlice=abs(signalSlice);
        intDataCont(i,j) = trapz(absSignalSlice);
    end
end
% Normalizing
% normCAPcont = (intData - min(intData))/(max(intData)-min(intData));
% Denormalizing
normCAPcont = intDataCont;
%% CAP Compound: Experimental
% Integrating each set.
intDataExp= zeros(length(contFile),stimNum);
for i = 1:length(contFile)
    for j = 1:stimNum
        signalSlice = expSet{i,j};
        signalMarkers = find(abs(signalSlice)>=500,1);
        signalSlice = signalSlice(signalMarkers+cutStim:signalMarkers+upFrame);
        absSignalSlice=abs(signalSlice);
        intDataExp(i,j) = trapz(absSignalSlice);
    end
end
% Normalizing
% normCAPexp = (intData - min(intData))/(max(intData)-min(intData));
% denormalizing
 normCAPexp = intDataExp;
%% CAP: Normalization
contSize = size(intDataCont);
expSize = size(intDataExp);
for i = 1:contSize(2)
normCAPcont(:,i) = (intDataCont(:,i) - min(intDataCont(:,i)))/(max(intDataCont(:,i))-min(intDataCont(:,i)));
end
for i = 1:expSize(2)
normCAPexp(:,i) = (intDataExp(:,i) - min(intDataCont(:,i)))/(max(intDataCont(:,i))-min(intDataCont(:,i)));
end
%% CAP Compound Graph
figure(2)
% Creating averages and error bar calculations
contCapCompound = zeros(length(contFile),2);
expCapCompound = zeros(length(expFile),2);
for i = 1:length(contFile)
    contCapCompound(i,1) = mean(normCAPcont(i,:));
    contCapCompound(i,2) = std(normCAPcont(i,:));
end
for i = 1:length(expFile)
    expCapCompound(i,1) = mean(normCAPexp(i,:));
    expCapCompound(i,2) = std(normCAPexp(i,:));
end
plot(stimIntensity,contCapCompound(:,1),stimIntensity,expCapCompound(:,1),'linewidth',linewidth);
title('CAP Response','FontSize',titleSize)
ylabel('CAP Amplitude','FontSize',labelSize)
xlabel('Stimulus Intensity (\muA)','FontSize',labelSize)
set(gcf,'color','w');
set(gca, 'FontSize', gcaSize)
hold on
% Error Bars
errorbar(stimIntensity,contCapCompound(:,1),contCapCompound(:,2),'k');
errorbar(stimIntensity,expCapCompound(:,1),expCapCompound(:,2),'k');
legend('Control','Experimental')
hold off
%% Latency: Control (Slope Method)
timeStampCont = zeros(length(contFile),stimNum);
for i = 1:length(contFile)
    for j = 1:stimNum
        signalSlice = contSet{i,j};
        signalMarkers = find(abs(signalSlice)>=500,1);%Finds the first 500 mV index.
        signalSlice = signalSlice(signalMarkers+cutStim:signalMarkers+upFrame);
        % Differentiating and taking average
        diffSlice = diff(signalSlice);
        diffTspan = (((0:length(diffSlice)-1)/100e3));
        posCount = 0;
        refIndex = 1;
        slopeSliceSize = 100;
        while posCount < 30
            slopeSlice = diffSlice(refIndex : slopeSliceSize + refIndex - 1);
            avgSlope = mean(slopeSlice);
            if avgSlope >= 0
                posCount = posCount + 1;
            elseif avgSlope < 0
                posCount = 0;
            end
            refIndex = refIndex + 1;  
            if refIndex > 1000 % Break condition to prevent infinite loop.
                break
            end
        end
        timeStampCont(i,j) = diffTspan(refIndex-posCount);
    end
end
timeStampCont = timeStampCont*1000;
%% Latency: Experimental (Slope Method)
timeStampExp = zeros(length(contFile),stimNum);
for i = 1:length(expFile)
    for j = 1:stimNum
        signalSlice = expSet{i,j};
        signalMarkers = find(abs(signalSlice)>=500,1);%Finds the first 500 mV index.
        signalSlice = signalSlice(signalMarkers+cutStim:signalMarkers+upFrame);
        % Differentiating and taking average
        diffSlice = diff(signalSlice);
        diffTspan = (((0:length(diffSlice)-1)/100e3));
        posCount = 0;
        refIndex = 1;
        slopeSliceSize = 100;
        while posCount < 30
            slopeSlice = diffSlice(refIndex : slopeSliceSize + refIndex - 1);
            avgSlope = mean(slopeSlice);
            if avgSlope >= 0
                posCount = posCount + 1;
            elseif avgSlope < 0
                posCount = 0;
            end
            refIndex = refIndex + 1;  
            if refIndex > 1000 % Break condition to prevent infinite loop.
                break
            end
        end
        timeStampExp(i,j) = diffTspan(refIndex-posCount);
    end
end
timeStampExp = timeStampExp*1000;
%% Latency  Graph
figure(3)

% Removing outliers
% outlier = [300 350];
% outlier2 = 350;
% stimIntensityNew = stimIntensity;
% for i = 1: length(outlier)
% foundYou = find(stimIntensityNew~=outlier(i));
% stimIntensityNew = stimIntensityNew(:,foundYou);
% timeStampCont = timeStampCont(foundYou,:);
% timeStampExp = timeStampExp(foundYou,:);
% end


timeCont = zeros(1,length(timeStampCont));
timeExp = zeros(1,length(timeStampExp));
stdCont = zeros(1,length(timeStampCont));
stdExp = zeros(1,length(timeStampExp));
for i = 1:length(timeStampCont)
    timeCont(i) = mean(timeStampCont(i,:));
    stdCont(i) = std(timeStampCont(i,:));
end
for i = 1:length(timeStampExp)
    timeExp(i) = mean(timeStampExp(i,:));
    stdExp(i) = std(timeStampExp(i,:));
end
plot(stimIntensity,timeCont,'linewidth',linewidth); hold on
plot(stimIntensity,timeExp,'linewidth',linewidth);
errorbar(stimIntensity,timeCont,stdCont,'k');
errorbar(stimIntensity,timeExp,stdExp,'k'); hold off
title('Latency to Onset')
ylabel('Latency (ms)','FontSize',labelSize)
xlabel('Stimulus Intensity (\muA)','FontSize',labelSize)
set(gcf,'color','w');
set(gca, 'FontSize', gcaSize)
legend('Control','Experimental')
%% Statistics: Norm CAP & Latency (not yet finalized for difference)
% Resizing matrices to vector form:
normCAPcont = normCAPcont(:);
normCAPexp = normCAPexp(:);
timeStampCont = timeStampCont(:);
timeStampExp = timeStampExp(:);
% CAP
%m_CAPcont = mean(normCAPcont);
%m_CAPexp = mean(normCAPexp);
%[h_normCAP, p_normCAP] = ttest(normCAPcont,normCAPexp);
diff_CAP = normCAPexp - normCAPcont;
m_diff_CAP = mean(diff_CAP); std_diff_CAP = std(diff_CAP);
[h_CAP, p_CAP] = ttest(diff_CAP);
% Latency
% m_latCont = mean(timeStampCont);
% m_latExp = mean(timeStampExp);
% [h_latency, p_latency] = ttest(timeStampCont,timeStampExp);
diff_lat = timeStampExp - timeStampCont;
m_diff_lat = mean(diff_lat); std_diff_lat = std(diff_lat);
[h_diff_lat, p_diff_lat] = ttest(diff_lat);



fprintf('Statistics for CAP & Latency:\n')
fprintf('CAP:\n')
%fprintf('Mean (Control): %.2f\n',m_CAPcont)
%fprintf('Mean (Experimental): %.2f\n',m_CAPexp)
fprintf('Mean: %.2f +- %.2f \n',m_diff_CAP,std_diff_CAP)
fprintf('Results of T-test: p = %f\n',p_CAP)
fprintf('Latency:\n')
fprintf('Mean Difference: %.2f +- %.2f \n', m_diff_lat,std_diff_lat)
fprintf('Results of T-test: p = %f\n',p_diff_lat)
% fprintf('Mean (Control): %.2f\n',m_latCont)
% fprintf('Mean (Experimental): %.2f\n',m_latExp)
%fprintf('Results of T-test: p = %f\n',p_latency)
%% Surface Plot (in testing)
%{
% Smoothing
%Vc = smooth(Vc);
%Ve = smooth(Ve);
figure(4)
subplot(1,2,1)
surf(Tc,Ic,Vc)
%shading interp
title('Control')


subplot(1,2,2)
surf(Te,Ie,Ve)
%shading interp
title('Experimental')
%}
% %% Stratified Plot (in testing)
% % What you're working with: Tc, Vc, stimIntensity
% 
% figure(4)
% subplot(1,2,1)
% stimLin = zeros(length(Te(1,:)));
% for i = 1:length(stimIntensity)
%     stimLin(:) = stimIntensity(i);
%     plot3(Tc(1,:),stimLin,Vc(i,:))
%     hold on
% end
% title('Control')
% %xlim([-.5 10])
% set(gcf,'color','w');
% %title('Output','FontSize',36)
% zlabel ('Voltage (µV)','FontSize',36)
% xlabel ('Time (ms)','FontSize',36)
% ylabel('Stimulus Amplitude (µA)')
% set(gca, 'YTick', 50:50:500)
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 26)
% hold off
% 
% subplot(1,2,2)
% for i = 1:length(stimIntensity)
%    stimLin(:) = stimIntensity(i); 
%    plot3(Te(1,:),stimLin,Ve(i,:))
%    hold on
% end
% %xlim([-.5 10])
% set(gcf,'color','w');
% %title('Output','FontSize',36)
% zlabel ('Voltage (µV)','FontSize',36)
% xlabel ('Time (ms)','FontSize',36)
% ylabel('Stimulus Amplitude (µA)')
% set(gca, 'YTick', 50:50:500)
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 26)
% hold off
