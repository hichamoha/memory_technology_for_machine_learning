% ------------ EITP25 - Lab 1 - ReRAM Characterization ----------------
% ------------   Hicham Mohamad, hsmo@kth.se    -----------------------

%{
Task 1: Voltage Range data 2
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

%% Extracting voltage range data 1 - RESET
% The data starts at row 259. 
% and can be extracted with the following command:
%folder = 'C:\Users\hashu\Documents\MATLAB\Laboration_data\Compliance_Data_1';
%baseFileName = 'RESET_01.csv';
%[data] = xlsread([folder,'\',baseFileName],['B259:C2500']);

[voltageResetData1] = xlsread(['Voltage_Range_Data_1','\','RESET_01.csv'],...
                 ['B259:C2500']);  
voltageReset1_V_TE = voltageResetData1(:,1);
voltageReset1_I_TE = abs(voltageResetData1(:,2));
switchReset1 = -0.3*max(abs(voltageReset1_V_TE))

[voltageResetData2] = xlsread(['Voltage_Range_Data_1','\','RESET_02.csv'],...
                 ['B259:C2500']);  
voltageReset2_V_TE = voltageResetData2(:,1);
voltageReset2_I_TE = abs(voltageResetData2(:,2));
switchReset2 = -0.3*max(abs(voltageReset2_V_TE))

[voltageResetData3] = xlsread(['Voltage_Range_Data_1','\','RESET_03.csv'],...
                 ['B259:C2500']);  
voltageReset3_V_TE = voltageResetData3(:,1);
voltageReset3_I_TE = abs(voltageResetData3(:,2));
switchReset3 = -0.3*max(abs(voltageReset3_V_TE))

[voltageResetData4] = xlsread(['Voltage_Range_Data_1','\','RESET_04.csv'],...
                 ['B259:C2500']); 
voltageReset4_V_TE = voltageResetData4(:,1);
voltageReset4_I_TE = abs(voltageResetData4(:,2));
switchReset4 = -0.3*max(abs(voltageReset4_V_TE))

[voltageResetData5] = xlsread(['Voltage_Range_Data_1','\','RESET_05.csv'],...
                 ['B259:C2500']);  
voltageReset5_V_TE = voltageResetData5(:,1);
volageReset5_I_TE = abs(voltageResetData5(:,2));
switchReset5 = -0.3*max(abs(voltageReset5_V_TE))

[voltageResetData6] = xlsread(['Voltage_Range_Data_1','\','RESET_06.csv'],...
                 ['B259:C2500']);  
voltageReset6_V_TE = voltageResetData6(:,1);
voltageReset6_I_TE = abs(voltageResetData6(:,2));
switchReset6 = -0.3*max(abs(voltageReset6_V_TE))

[voltageResetData7] = xlsread(['Voltage_Range_Data_1','\','RESET_07.csv'],...
                 ['B259:C2500']);  
voltageReset7_V_TE = voltageResetData7(:,1);
voltageReset7_I_TE = abs(voltageResetData7(:,2));
switchReset7 = -0.3*max(abs(voltageReset7_V_TE))

[voltageResetData8] = xlsread(['Voltage_Range_Data_1','\','RESET_08.csv'],...
                 ['B259:C2500']);  
voltageReset8_V_TE = voltageResetData8(:,1);
voltageReset8_I_TE = abs(voltageResetData8(:,2));
switchReset8 = -0.3*max(abs(voltageReset8_V_TE))

[voltageResetData9] = xlsread(['Voltage_Range_Data_1','\','RESET_09.csv'],...
                 ['B259:C2500']);  
voltageReset9_V_TE = voltageResetData9(:,1);
voltageReset9_I_TE = abs(voltageResetData9(:,2));
switchReset9 = -0.3*max(abs(voltageReset9_V_TE))

[voltageResetData10] = xlsread(['Voltage_Range_Data_1','\','RESET_10.csv'],...
                 ['B259:C2500']);  
voltageReset10_V_TE = voltageResetData10(:,1);
voltageReset10_I_TE = abs(voltageResetData10(:,2));
switchReset10 = -0.3*max(abs(voltageReset10_V_TE))

%% Extracting voltage range data 1 - SET
[voltageSetData1] = xlsread(['Voltage_Range_Data_1','\','SET_01.csv'],...
                 ['B259:C2500']); 
voltageSet1_V_TE = voltageSetData1(:,1);
voltageSet1_I_TE = abs(voltageSetData1(:,2));
switchSet1 = 0.3*max(abs(voltageSet1_V_TE))

[voltageSetData2] = xlsread(['Voltage_Range_Data_1','\','SET_02.csv'],...
                 ['B259:C2500']);  
voltageSet2_V_TE = voltageSetData2(:,1);
voltageSet2_I_TE = abs(voltageSetData2(:,2));
switchSet2 = 0.3*max(abs(voltageSet2_V_TE))

[voltageSetData3] = xlsread(['Voltage_Range_Data_1','\','SET_03.csv'],...
                 ['B259:C2500']);  
voltageSet3_V_TE = voltageSetData3(:,1);
voltageSet3_I_TE = abs(voltageSetData3(:,2));
switchSet3 = 0.3*max(abs(voltageSet3_V_TE))

[voltageSetData4] = xlsread(['Voltage_Range_Data_1','\','SET_04.csv'],...
                 ['B259:C2500']); 
voltageSet4_V_TE = voltageSetData4(:,1);
voltageSet4_I_TE = abs(voltageSetData4(:,2));
switchSet4 = 0.3*max(abs(voltageSet4_V_TE))

[voltageSetData5] = xlsread(['Voltage_Range_Data_1','\','SET_05.csv'],...
                 ['B259:C2500']);  
voltageSet5_V_TE = voltageSetData5(:,1);
voltageSet5_I_TE = abs(voltageSetData5(:,2));
switchSet5 = 0.3*max(abs(voltageSet5_V_TE))

[voltageSetData6] = xlsread(['Voltage_Range_Data_1','\','SET_06.csv'],...
                 ['B259:C2500']);  
voltageSet6_V_TE = voltageSetData6(:,1);
voltageSet6_I_TE = abs(voltageSetData6(:,2));
switchSet6 = 0.3*max(abs(voltageSet6_V_TE))

[voltageSetData7] = xlsread(['Voltage_Range_Data_1','\','SET_07.csv'],...
                 ['B259:C2500']);  
voltageSet7_V_TE = voltageSetData7(:,1);
voltageSet7_I_TE = abs(voltageSetData7(:,2));
switchSet7 = 0.3*max(abs(voltageSet7_V_TE))

[voltageSetData8] = xlsread(['Voltage_Range_Data_1','\','SET_08.csv'],...
                 ['B259:C2500']);  % max voltage = -2
voltageSet8_V_TE = voltageSetData8(:,1);
voltageSet8_I_TE = abs(voltageSetData8(:,2));
switchSet8 = 0.3*max(abs(voltageSet8_V_TE))

[voltageSetData9] = xlsread(['Voltage_Range_Data_1','\','SET_09.csv'],...
                 ['B259:C2500']);  
voltageSet9_V_TE = voltageSetData9(:,1);
voltageSet9_I_TE = abs(voltageSetData9(:,2));
switchSet9 = 0.3*max(abs(voltageSet9_V_TE))

[voltageSetData10] = xlsread(['Voltage_Range_Data_1','\','SET_10.csv'],...
                 ['B259:C2500']);  
voltageSet10_V_TE = voltageSetData10(:,1);
voltageSet10_I_TE = abs(voltageSetData10(:,2));
switchSet10 = 0.3*max(abs(voltageSet10_V_TE))

%% IV plot For the voltage range data 1, I = 100 uA, 
%plot I_TE versus V_TE with a logarithmic scale for the current
figure
plot(voltageSet1_V_TE, log(voltageSet1_I_TE))
hold on
plot(voltageReset1_V_TE, log(voltageReset1_I_TE))
hold on
plot(voltageSet2_V_TE, log(voltageSet2_I_TE))
hold on
plot(voltageReset2_V_TE, log(voltageReset2_I_TE))
hold on
plot(voltageSet3_V_TE, log(voltageSet3_I_TE))
hold on
plot(voltageReset3_V_TE, log(voltageReset3_I_TE))
hold on
plot(voltageSet4_V_TE, log(voltageSet4_I_TE))
hold on
plot(voltageReset4_V_TE, log(voltageReset4_I_TE))
hold on
plot(voltageSet5_V_TE, log(voltageSet5_I_TE))
hold on
plot(voltageReset5_V_TE, log(volageReset5_I_TE))
hold on
plot(voltageSet6_V_TE, log(voltageSet6_I_TE))
hold on
plot(voltageReset6_V_TE, log(voltageReset6_I_TE))
hold on
plot(voltageSet7_V_TE, log(voltageSet7_I_TE))
hold on
plot(voltageReset7_V_TE, log(voltageReset7_I_TE))
hold on
plot(voltageSet8_V_TE, log(voltageSet8_I_TE))
hold on
plot(voltageReset8_V_TE, log(voltageReset8_I_TE))
hold on
plot(voltageSet9_V_TE, log(voltageSet9_I_TE))
hold on
plot(voltageReset9_V_TE, log(voltageReset9_I_TE))
hold on
plot(voltageSet10_V_TE, log(voltageSet10_I_TE))
hold on
plot(voltageReset10_V_TE, log(voltageReset10_I_TE))
hold on
%scatter(V_TE, log(I_TE))
xlabel('Voltage (V)')
ylabel('Current (A)')
title('Voltage range data 1, I = 100 uA')

