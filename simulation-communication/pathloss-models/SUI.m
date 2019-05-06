%% STANFORD UNIVERSITY INTERIM model
% The most common frequency bands: 450 MHz, 800 MHz, 900 MHz and 2 600 MHz
clear
d0 = 1           
freq = 450 * 10^6                            % frequency, in hz 
B = 5 * 10^6   
lambda = physconst('LightSpeed')/freq       % wavelength, in m
hb = 17                                     % base station height, in m.
s = 10.8                                      % shadowing effect, dB 
N0 = 10^-9;

A = 20*log(4*pi*d0/lambda);

n = 3
a = [4.6 4 3.6]
b = [0.0075 0.0065 0.005]
c = [12.6 17.1 20]
gamma = a(n) - b(n)*hb + c(n)/hb
    
% distance
d = 10: 1 : 100;

% gain
Gr = 24.5;
Gt = 24.5;

% calculate path loss
PL = A + 10*gamma*log(d/d0)+s;

% set and convert Pt
PtWatt = 1000
PtdB   = pow2db(PtWatt);

% calculate and convert Pr
Pr_dB = PtdB  -PL;
Pr = db2pow(Pr_dB);

% calculate SNR 
SNR = Pr/(N0*B);

% calculate Shannon capacity 
C = B*log2(1+SNR);

plot(C)


%% Plot PL
plot(d, PL)
hold on


%% Plot Capacity 



