% ------------ EITP25 - Handin 3 - FE Characterization ----------------
% ------------   Hicham Mohamad, hsmo@kth.se    -----------------------
%{
Feedback from Mattias - Discord
Hey, some tips: 
What you need to do with the PUND data is to integrate the current 
in steps from t=0 to the end. 
Store the partial integrations in a variable Qtot, 
which will then describe a function Q_tot(V) since you know 
the V at time t. 
Then integrate the second pulse in the same way, store in Qother, 
this should not contain any current due to the polarisation switch. 
The integration of current --> charge. 
So Then you calc Q_pol(V) = Q_tot(V) - Q_other(V) 
and you should get half a Q-V diagram, which after normalization 
by the device area and oxide thickness gives you P-E. 
Do the same for the third and fourth pulses which give you the 
other half of the diagram.

The PUND data is current versus time, right ! 
Q = integral(I, dt)

Think about how the ferroelectric domains are organised in an 
antiferroelectric material.. 
Every other up, every other down. So no polarization at zero field.
%}
%{
Feedback from Robin:
I think your code looks good, what you have done is correct. 
However it is not complete since you would need to:
- Define the vector elements of each pulse in the input PUND signal 
in order to subtract the charge of the U pulse from the P pulse and 
likewise for the N and D pulses. 

- Finally you would need to shift the PE curve around the y-axis 
(in order to center it around zero) with the assumption that 
we are only measuring a relative change in the polarization and 
not an absolute one.  
%} 
clc
clear all
close all
% The data starts at row 259. 
% and can be extracted with the following command:
%[data] = xlsread([folder,'\',baseFileName],['B259:C2500']);
[datasetA] = xlsread('A_15nm_25um_radius.csv','B259:C2500'); 
%[datasetA] = xlsread('A_15nm_25um_radius.csv');
[datasetB] = xlsread('B_15nm_25um_radius.csv','B259:C2500'); 
[datasetC] = xlsread('C_10nm_25um_radius.csv','B259:C2500');
             
%% The parameters for measured datasets 
% circular capacitor
radius = 25e-6;
area = pi*radius^2;

% dieletric thickness of FE materials
h_AB = 15e-9;
h_C = 10e-9;

%% plot waveforms for dataset A             
V_A = datasetA(:,1);
%I_A = abs(datasetA(:,2));
I_A = datasetA(:,2);
timeA = (1:size(I_A,1))';

% plot the current waveform
figure
plot(timeA, I_A)
title('The current I in dataset A')
xlabel('Time (s)')
ylabel('Current waveform (A)')

% plot the  voltage waveform
figure
plot(timeA, V_A)
title('The electric field E in dataset A')
xlabel('Time (s)')
ylabel('Electric waveform (V)')

% plot the charge
Q_A = cumtrapz(I_A);
% plot the charge Q in A
figure
plot(timeA, Q_A)
title('The charge Q in dataset A')
xlabel('Time (s)')
ylabel('Capacitor surface charge ')

% plot the polarization P-E curve in A
P_A = Q_A / area;

figure
plot(V_A, P_A)
title('The P-E curve in dataset A')
xlabel('E (V/m)')
ylabel('Polarization (C/cm^2)')

%% plots for dataset B
V_B = datasetB(:,1);
%I_B = abs(datasetB(:,2));
I_B = datasetB(:,2);

% plot the current waveform
timeB = (1:size(datasetB,1))';
figure
plot(timeB, I_B)
title('The current I in dataset B')
xlabel('Time (s)')
ylabel('Current waveform (A)')

% plot the  waveform
figure
plot(timeB, V_B)
title('The electric field E in dataset B')
xlabel('Time (s)')
ylabel('Electric waveform (V)')

Q_B = cumtrapz(I_B);
% plot the charge Q in B
figure
plot(timeB, Q_B)
title('The charge Q in dataset B')
xlabel('Time (s)')
ylabel('Capacitor surface charge')

 %% plots for dataset C
V_C = datasetC(:,1);
%I_C = abs(datasetC(:,2));
I_C = datasetC(:,2);

% plot the current waveform
timeC = (1:size(datasetC,1))';
figure
plot(timeC, I_C)
title('The current I in dataset C')
xlabel('Time (s)')
ylabel('Current waveform (A)')

% plot the electric waveform
figure
plot(timeC, V_C)
title('The electric field E in dataset C')
xlabel('Time (s)')
ylabel('Electric waveform (V)')

Q_C = cumtrapz(I_C);
% plot the charge Q in A
figure
plot(timeC, Q_C)
title('The charge Q in dataset C')
xlabel('Time (s)')
ylabel('Capacitor surface charge')
