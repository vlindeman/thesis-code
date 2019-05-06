%% Friis free space PL model
% The most common frequency bands: 450 MHz, 800 MHz, 900 MHz and 2600 MHz
clear    
freq = 450 * 10^6;                          
lambda = physconst('LightSpeed')/freq;
B = 5 * 10^6;
N0 = 10^-9;

% distance
d = 10: 1 : 330; 

% gain
Gr = 24.5;
Gt = 24.5;

% calculate path loss
PL = 20*log10((4*pi*d)/lambda) - Gt - Gr; 
max(PL)

% calc Power   
PtWatt =    0.0095
PtdB   = pow2db(PtWatt); 


Pr_dB = PtdB  - PL;
Pr = db2pow(Pr_dB);

SNR = Pr/(N0*B);

C = B*log2(1+SNR);

plot(C)

%% Plot

plot(d, PL)
hold on
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  

