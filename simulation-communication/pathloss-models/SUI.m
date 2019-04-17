%% STANFORD UNIVERSITY INTERIM model
% The most common frequency bands: 450 MHz, 800 MHz, 900 MHz and 2 600 MHz
clear
d0 = 1           
freq = 2600 * 10^6                            % frequency, in hz 
lambda = physconst('LightSpeed')/freq       % wavelength, in m
hb = 17                                     % base station height, in m.
s = 10.8                                      % shadowing effect, dB 

A = 20*log(4*pi*d0/lambda);

n = 3
a = [4.6 4 3.6]
b = [0.0075 0.0065 0.005]
c = [12.6 17.1 20]
gamma = a(n) - b(n)*hb + c(n)/hb
    

d = 10: 1 : 330;

PL = A + 10*gamma*log(d/d0)+s;

% calc Power 
dist = 330
PtWatt = 1

PtdB   = pow2db(PtWatt)

Pr = PtdB  -PL(dist - 9)


%% Plot
plot(d, PL)
hold on

