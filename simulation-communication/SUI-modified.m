%% STANFORD UNIVERSITY INTERIM model, NO-LOS 
% Radio Propagation Path Loss Models for5G Cellular Networks in the 28 GHz and38 GHz Millimeter-Wave Bands
% https://ieeexplore-ieee-org.e.bibl.liu.se/stamp/stamp.jsp?tp=&arnumber=6894456
 
% Suburban enviroment, single narrow beam  
% PLSUI,Mod[dB] (d) = aNLOS × (PLSUI(d) –PLSUI(d0)) + PL(d0) + Xs
clear

% [PL] = PL_SUIbasic(d, d0,freq,hb,s,n)
PL = PL_SUIbasic(200, 100, 2*10^9, 50, 10, 1)

% [PL] = PL_SUI(d, d0,freq,hb,hr,s,n)
PL2 = PL_SUI(200, 100,2*10^9,40,10,10,1)


%% STANFORD UNIVERSITY INTERIM model, LOS
% Suburban enviroment, single narrow beam 
% PLFS,Mod[dB](d) = aLOS ×(PLFS(d) –PLFS(d0)) + PL(d0) + Xs


