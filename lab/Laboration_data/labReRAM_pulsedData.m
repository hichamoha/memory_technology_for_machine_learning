% ------------ EITP25 - Lab 1 - ReRAM Characterization ----------------
% ------------   Hicham Mohamad, hsmo@kth.se    -----------------------

% The Pulsed Data
%{
 For the pulsed data, it contains 3 cycles of READ-SET-READ-RESET-READ 
with a length of 28 ms such that the total length is 3x28ms. 
Using the READs, it is possible to determine the resistance after SET 
and RESET. 
%} 
clc
clear all
close all

%% Extracting the pulsed data
%[data] = xlsread(datafile,1,'B150:D8549');
[data] = xlsread(['Pulsed','\','Pulsed_Data.csv'],1,['B150:D8549']);

t_cycle = 28e-3;

time = data(:,1);
I_TE = data(:,3);
V_G = data(:,2);

%% estimate of the resistance
readVoltage = 50;
meanI1 = mean(I_TE([246:355],:))
meanI2 = mean(I_TE([14:15],:))
meanI3 = mean(I_TE([24:25],:))
avgI = mean([meanI1 meanI2 meanI3] )
%estR = avgI/readVoltage
estR = readVoltage/avgI

%% IV plot For the pulsed data 
%plot I_TE versus V_TE with a logarithmic scale for the current
figure
plot(V_TE, log(I_TE)) 
%{
The voltage V_G should be ignored as it is the control of the transistor 
that infers compliance. 

The applied V_TE is not included but the peak 
voltages of the triangle programing pulses in the measurement were 
1.5 and -1.5 V, while the READ voltages correspond to 50 mV 
(to be used for the resistance calculations. 

To get a good estimate of the resistance, take an average of the current 
at 2.5-3.5 ms, 13.5-14.5 ms and 23.5-24.5 ms (for the first cycle) 
and divide it with the READ voltage. 
%}
%% Cumulative distribution function plot

%% Endurance plot : (Resistance/pulse number) plot
% where the horizontal lines denote the average low (LRS) 
% and high resistive state (HRS).

