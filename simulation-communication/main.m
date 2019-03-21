%% STANFORD UNIVERSITY INTERIM model, NO-LOS 
% Radio Propagation Path Loss Models for5G Cellular Networks in the 28 GHz and38 GHz Millimeter-Wave Bands
% https://ieeexplore-ieee-org.e.bibl.liu.se/stamp/stamp.jsp?tp=&arnumber=6894456
 
% Suburban enviroment, single narrow beam  
% PLSUI,Mod[dB] (d) = aNLOS � (PLSUI(d) �PLSUI(d0)) + PL(d0) + Xs
clear 
clc 

d = 200;
d0 = 100;
f = 2*10^9;
hb = 40;
hr = 10;
s = 10; 
n = 1;


% [PL] = PL_SUIbasic(d, d0,freq,hb,s,n)
PL = PL_SUIbasic(d, d0, f, hb, s, n)

% [PL] = PL_SUI(d, d0,freq,hb,hr,s,n)
PL2 = PL_SUI(d, d0, f, hb, hr, s, n)

% PL = PL-SUI-MOD(alpha, d, d0,freq,hb,hr,s,n)
PL3 = PL_SUI_MOD(1, d, d0, f, hb, hr, s, n)

pt = 10

q = PL/10; 
pr = pt/(10^q)

%% STANFORD UNIVERSITY INTERIM model, LOS
% Suburban enviroment, single narrow beam 
% PLFS,Mod[dB](d) = aLOS �(PLFS(d) �PLFS(d0)) + PL(d0) + Xs


