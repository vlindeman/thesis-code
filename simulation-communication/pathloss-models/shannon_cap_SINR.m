%% Calculate SINR with given PL matrix  
clc

% enter Pt and Bandwidth 
PtWatt = 48.3209
B = 1500 * 10^6;

Pi = 1

PtdB   = pow2db(PtWatt);
N0 = 10^-9;

% calculate and convert Pr
Pr_dB = PtdB  - PL;
Pr = db2pow(Pr_dB);
Pr = Pr(91)

% calculate SNR 
SINR = Pr/(N0*B + Pi);

% calculate Shannon capacity 
C = B*log2(1+SINR);

plot(d,C)
hold on 
axis([0 inf 0 inf])
xlabel('Distance [m]') 
ylabel('Capacity [bps] ')  

