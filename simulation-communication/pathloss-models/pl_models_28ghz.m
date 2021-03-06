% Radio Propagation Path Loss Models for5G Cellular Networks in the 28 GHz and 38GHz Millimeter-Wave Bands
% https://ieeexplore-ieee-org.e.bibl.liu.se/stamp/stamp.jsp?tp=&arnumber=6894456

%% Modified SUI - 28 GHz NLOS directional path loss
% Based on SUI model 
clear

d = 10:1:200;

f = 28*10^9;
lambda = physconst('LightSpeed')/f;

% Height of TX and RX (m)
%hb = 7;
hr = 1.5;

% Found PLE for omni
gamma = 4.5;
sigma = 10.8;
%s = normrnd(0,sigma)
s = sigma;
d0 = 1;
TXgain = 24.5;
RXgain = 24.5;

% Correction factor
alpha = 0.71;

% PLsui(d)
A = 20*log10((4*pi*d0)/lambda);
Xfc = 6*log10((f/10^6)/2000);
Xrx = -10.8*log10(hr/2);
PL_sui_d = A + 10*gamma*log10(d/d0)+s+Xfc+Xrx;

% PLsui(d0)
PL_sui_d0 = A + 10*gamma*log10(d0/d0)+s+Xfc+Xrx;

PL = alpha*(PL_sui_d - PL_sui_d0) + A + s - TXgain - RXgain;


plot(d,PL)
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  
hold on


%% Modified SUI - 28 GHz LOS directional path loss
% Based on Friis FS path loss model 
clear

d = 10:1:200;

d0 = 1; 
f = 28*10^9;
lambda = physconst('LightSpeed')/f;
TXgain = 24.5;
RXgain = 24.5;
s = 1.1; 
gamma = 1.9; % "n" i the report
alpha = 0.95; 

PLfs_d = 20*log10((4*pi*d)/lambda);
PLfs_d0 = 20*log10((4*pi*d0)/lambda);
A = 20*log10((4*pi*d0)/lambda);

PL = alpha*(PLfs_d - PLfs_d0) + A + s - TXgain - RXgain;



plot(d,PL)
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  
hold on


%% Modified SUI - 28 GHz NLOS omni path loss
% Based on SUI model 
clear

d = 10:1:200;

f = 28*10^9;
lambda = physconst('LightSpeed')/f;

% Height of TX and RX (m)
%hb = 17;
hr = 1.5;

% Found PLE for omni
gamma = 3.4; % "n" in report
sigma = 9.7;
%s = normrnd(0,sigma)
%s = lognrnd(0,sigma)
s = sigma;
d0 = 1;
TXgain = 24.5;
RXgain = 24.5;
% Correction factor
alpha = 0.71;

% PLsui(d)
A = 20*log10((4*pi*d0)/lambda);
Xfc = 6*log10((f/10^6)/2000);
Xrx = -10.8*log10(hr/2);
PL_sui_d = A + 10*gamma*log10(d/d0)+s+Xfc+Xrx;

% PLsui(d0)
PL_sui_d0 = A + 10*gamma*log10(d0/d0)+s+Xfc+Xrx;

PL = alpha*(PL_sui_d - PL_sui_d0) + A + s %- TXgain - RXgain 


plot(d,PL)
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  
hold on


%% Modified SUI - 28 GHz LOS omni path loss
% Based on Friis FS path loss model 
clear

d = 10:1:200;

d0 = 1; 
f = 28*10^9;
lambda = physconst('LightSpeed')/f;
TXgain = 24.5;
RXgain = 24.5;
s = 9.7; 
gamma = 2.1; % "n" in report
alpha = 0.9; 

PLfs_d = 20*log10((4*pi*d)/lambda);
PLfs_d0 = 20*log10((4*pi*d0)/lambda);
A = 20*log10((4*pi*d0)/lambda);

PL = alpha*(PLfs_d-PLfs_d0)+A+s - TXgain - RXgain;


plot(d,PL)
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  
hold on

