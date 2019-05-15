% Radio Propagation Path Loss Models for5G Cellular Networks in the 28 GHz and 38GHz Millimeter-Wave Bands
% https://ieeexplore-ieee-org.e.bibl.liu.se/stamp/stamp.jsp?tp=&arnumber=6894456

%% Modified SUI - 38 GHz NLOS directional path loss
% Based on SUI model 
clear

d = 10:1:200;

f = 38 * 10^9;
lambda = physconst('LightSpeed')/f;

% Height of TX and RX (m)
hb = 8;
hr = 1.5;

% Found PLE for omni
gamma = 3.8;
sigma = 11.1;
%s = normrnd(0,sigma)
s = sigma;
d0 = 1;
TXgain = 25;
RXgain = 25;

% Correction factor
alpha = 0.62;

% PLsui(d)
A = 20*log10((4*pi*d0)/lambda);
Xfc = 6*log10((f/10^6)/2000);
Xrx = -10.8*log10(hr/2);
PL_sui_d = A + 10*gamma*log10(d/d0)+s+Xfc+Xrx;

% PLsui(d0)
PL_sui_d0 = A + 10*gamma*log10(d0/d0)+s+Xfc+Xrx;

PL = alpha*(PL_sui_d - PL_sui_d0) + A + s;
PL = PL - TXgain - RXgain;


plot(d, PL)
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  
hold on



%% Modified SUI - 38 GHz LOS directional path loss
% Based on SUI model 
clear

d = 10:1:200;

f = 38 * 10^9;
lambda = physconst('LightSpeed')/f;

% Height of TX and RX (m)
hb = 8;
hr = 1.5;

% Found PLE for omni
gamma = 1.9;
sigma = 8.4;
%s = normrnd(0,sigma)
s = sigma;
d0 = 1;
TXgain = 25;
RXgain = 25;

% Correction factor
alpha = 0.95;

% PLsui(d)
A = 20*log10((4*pi*d0)/lambda);
Xfc = 6*log10((f/10^6)/2000);
Xrx = -10.8*log10(hr/2);
PL_sui_d = A + 10*gamma*log10(d/d0)+s+Xfc+Xrx;

% PLsui(d0)
PL_sui_d0 = A + 10*gamma*log10(d0/d0)+s+Xfc+Xrx;

PL = alpha*(PL_sui_d - PL_sui_d0) + A + s;
PL = PL - TXgain - RXgain;


plot(d, PL)
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  
hold on


