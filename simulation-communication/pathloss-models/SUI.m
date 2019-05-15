%% STANFORD UNIVERSITY INTERIM model
% The most common frequency bands: 450 MHz, 800 MHz, 900 MHz and 2 600 MHz
clear

d0 = 1                                      % reference distance, 1 m
freq = 450 * 10^6;                         % frequency, in hz 
lambda = physconst('LightSpeed')/freq       % wavelength, in m
hb = 17                                     % base station height, in m.
s = 10.8                                    % shadowing effect, dB 
n = 3;                                      % terrain type N = [1,2,3]

A = 20*log10(4*pi*d0/lambda);

a = [4.6 4 3.6];
b = [0.0075 0.0065 0.005];
c = [12.6 17.1 20];
gamma = a(n) - b(n)*hb + c(n)/hb;
    
% distance
d = 10: 1 : 330;

% gain
Gr = 24.5;
Gt = 24.5;

% calculate path loss
PL = A + 10*gamma*log10(d/d0)+s -Gr - Gt;   


%% Plot PL
plot(d, PL)
hold on
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  

