%% Calculate Shannon cap with given PL  
clc

% enter Pt and Bandwidth 
PtWatt = 48.3209
B = 1500 * 10^6;


PtdB   = pow2db(PtWatt);
N0 = 10^-9;

% calculate and convert Pr
Pr_dB = PtdB  - PL;
Pr = db2pow(Pr_dB);

% calculate SNR 
SNR = Pr/(N0*B);

% calculate Shannon capacity 
C = B*log2(1+SNR);

% print values 
C(41)
C(91)
C(191)
min(C)

plot(d,C)
hold on 
axis([0 inf 0 inf])
xlabel('Distance [m]') 
ylabel('Capacity [bps] ')  
 