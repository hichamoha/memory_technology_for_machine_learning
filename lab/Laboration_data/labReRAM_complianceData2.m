% ------------ EITP25 - Lab 1 - ReRAM Characterization ----------------
% ------------   Hicham Mohamad, hsmo@kth.se    -----------------------

%{
Task 1: Current compliance data 2
For the voltage range and the current compliance data, plot I_TE versus 
V_TE with a logarithmic scale for the current. 

The command reads column B and C from row 259 until 2500 (I put in a 
large number here to ensure that it reads the entire column length). 

A SET or RESET can be defined as when the resistance at a measurement 
point is within 30% of the resistance at the maximum positive or 
negative voltage. The maximum voltage is reached in the middle of the 
vector as the voltage is swept back and forth.
%}
clc
clear all
close all

%% Extracting compliance current data 2 - RESET
% The data starts at row 259. 
% and can be extracted with the following command:
%folder = 'C:\Users\hashu\Documents\MATLAB\Laboration_data\Compliance_Data_1';
%baseFileName = 'RESET_01.csv';
%[data] = xlsread([folder,'\',baseFileName],['B259:C2500']);

[compResetData1] = xlsread(['Compliance_Data_2','\','RESET_01.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset1_V_TE = compResetData1(:,1);
compReset1_I_TE = abs(compResetData1(:,2));
switchReset1 = -0.3*max(abs(compReset1_V_TE))

[compResetData2] = xlsread(['Compliance_Data_2','\','RESET_02.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset2_V_TE = compResetData2(:,1);
compReset2_I_TE = abs(compResetData2(:,2));
switchReset2 = -0.3*max(abs(compReset2_V_TE))

[compResetData3] = xlsread(['Compliance_Data_2','\','RESET_03.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset3_V_TE = compResetData3(:,1);
compReset3_I_TE = abs(compResetData3(:,2));
switchReset3 = -0.3*max(abs(compReset3_V_TE))

[compResetData4] = xlsread(['Compliance_Data_2','\','RESET_04.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset4_V_TE = compResetData4(:,1);
compReset4_I_TE = abs(compResetData4(:,2));
switchReset4 = -0.3*max(abs(compReset4_V_TE))

[compResetData5] = xlsread(['Compliance_Data_2','\','RESET_05.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset5_V_TE = compResetData5(:,1);
compReset5_I_TE = abs(compResetData5(:,2));
switchReset5 = -0.3*max(abs(compReset5_V_TE))

[compResetData6] = xlsread(['Compliance_Data_2','\','RESET_06.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset6_V_TE = compResetData6(:,1);
compReset6_I_TE = abs(compResetData6(:,2));
switchReset6 = -0.3*max(abs(compReset6_V_TE))

[compResetData7] = xlsread(['Compliance_Data_2','\','RESET_07.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset7_V_TE = compResetData7(:,1);
compReset7_I_TE = abs(compResetData7(:,2));
switchReset7 = -0.3*max(abs(compReset7_V_TE))

[compResetData8] = xlsread(['Compliance_Data_2','\','RESET_08.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset8_V_TE = compResetData8(:,1);
compReset8_I_TE = abs(compResetData8(:,2));
switchReset8 = -0.3*max(abs(compReset8_V_TE))

[compResetData9] = xlsread(['Compliance_Data_2','\','RESET_09.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset9_V_TE = compResetData9(:,1);
compReset9_I_TE = abs(compResetData9(:,2));
switchReset9 = -0.3*max(abs(compReset9_V_TE))

[compResetData10] = xlsread(['Compliance_Data_2','\','RESET_10.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compReset10_V_TE = compResetData10(:,1);
compReset10_I_TE = abs(compResetData10(:,2));
switchReset10 = -0.3*max(abs(compReset10_V_TE))

%% Extracting compliance current data 2 - SET
[compSetData1] = xlsread(['Compliance_Data_2','\','SET_01.csv'],...
                 ['B259:C2500']);  % max voltage = 3.5
compSet1_V_TE = compSetData1(:,1);
compSet1_I_TE = abs(compSetData1(:,2));
switchSet1 = 0.3*max(abs(compSet1_V_TE))

[compSetData2] = xlsread(['Compliance_Data_2','\','SET_02.csv'],...
                 ['B259:C2500']);  
compSet2_V_TE = compSetData2(:,1);
compSet2_I_TE = abs(compSetData2(:,2));
switchSet2 = 0.3*max(abs(compSet2_V_TE))

[compSetData3] = xlsread(['Compliance_Data_2','\','SET_03.csv'],...
                 ['B259:C2500']);  
compSet3_V_TE = compSetData3(:,1);
compSet3_I_TE = abs(compSetData3(:,2));
switchSet3 = 0.3*max(abs(compSet3_V_TE))

[compSetData4] = xlsread(['Compliance_Data_2','\','SET_04.csv'],...
                 ['B259:C2500']); 
compSet4_V_TE = compSetData4(:,1);
compSet4_I_TE = abs(compSetData4(:,2));
switchSet4 = 0.3*max(abs(compSet4_V_TE))

[compSetData5] = xlsread(['Compliance_Data_2','\','SET_05.csv'],...
                 ['B259:C2500']);  
compSet5_V_TE = compSetData5(:,1);
compSet5_I_TE = abs(compSetData5(:,2));
switchSet5 = 0.3*max(abs(compSet5_V_TE))

[compSetData6] = xlsread(['Compliance_Data_2','\','SET_06.csv'],...
                 ['B259:C2500']);  
compSet6_V_TE = compSetData6(:,1);
compSet6_I_TE = abs(compSetData6(:,2));
switchSet6 = 0.3*max(abs(compSet6_V_TE))

[compSetData7] = xlsread(['Compliance_Data_2','\','SET_07.csv'],...
                 ['B259:C2500']);  
compSet7_V_TE = compSetData7(:,1);
compSet7_I_TE = abs(compSetData7(:,2));
switchSet7 = 0.3*max(abs(compSet7_V_TE))

[compSetData8] = xlsread(['Compliance_Data_2','\','SET_08.csv'],...
                 ['B259:C2500']);  % max voltage = -2
compSet8_V_TE = compSetData8(:,1);
compSet8_I_TE = abs(compSetData8(:,2));
switchSet8 = 0.3*max(abs(compSet8_V_TE))

[compSetData9] = xlsread(['Compliance_Data_2','\','SET_09.csv'],...
                 ['B259:C2500']);  
compSet9_V_TE = compSetData9(:,1);
compSet9_I_TE = abs(compSetData9(:,2));
switchSet9 = 0.3*max(abs(compSet9_V_TE))

[compSetData10] = xlsread(['Compliance_Data_2','\','SET_10.csv'],...
                 ['B259:C2500']);  
compSet10_V_TE = compSetData10(:,1);
compSet10_I_TE = abs(compSetData10(:,2));
switchSet10 = 0.3*max(abs(compSet10_V_TE))

%% IV plot For the current compliance data 2, I = 50 uA, 
%plot I_TE versus V_TE with a logarithmic scale for the current
figure
plot(compSet1_V_TE, log(compSet1_I_TE))
hold on
plot(compReset1_V_TE, log(compReset1_I_TE))
hold on
plot(compSet2_V_TE, log(compSet2_I_TE))
hold on
plot(compReset2_V_TE, log(compReset2_I_TE))
hold on
plot(compSet3_V_TE, log(compSet3_I_TE))
hold on
plot(compReset3_V_TE, log(compReset3_I_TE))
hold on
plot(compSet4_V_TE, log(compSet4_I_TE))
hold on
plot(compReset4_V_TE, log(compReset4_I_TE))
hold on
plot(compSet5_V_TE, log(compSet5_I_TE))
hold on
plot(compReset5_V_TE, log(compReset5_I_TE))
hold on
plot(compSet6_V_TE, log(compSet6_I_TE))
hold on
plot(compReset6_V_TE, log(compReset6_I_TE))
hold on
plot(compSet7_V_TE, log(compSet7_I_TE))
hold on
plot(compReset7_V_TE, log(compReset7_I_TE))
hold on
plot(compSet8_V_TE, log(compSet8_I_TE))
hold on
plot(compReset8_V_TE, log(compReset8_I_TE))
hold on
plot(compSet9_V_TE, log(compSet9_I_TE))
hold on
plot(compReset9_V_TE, log(compReset9_I_TE))
hold on
plot(compSet10_V_TE, log(compSet10_I_TE))
hold on
plot(compReset10_V_TE, log(compReset10_I_TE))
hold on
%scatter(V_TE, log(I_TE))
xlabel('Voltage (V)')
ylabel('Current (A)')
title('Compliance current 2, I = 50 uA')

