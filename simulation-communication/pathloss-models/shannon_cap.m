%% Calculate Shannon cap with given PL matrix 

% set and convert Pt
PtWatt = 1000
PtdB   = pow2db(PtWatt);

% calculate and convert Pr
Pr_dB = PtdB  - PL;
Pr = db2pow(Pr_dB);

% calculate SNR 
SNR = Pr/(N0*B);

% calculate Shannon capacity 
C = B*log2(1+SNR);

%% Plot 

plot(d,C)
hold on 
axis([0 inf 0 inf])
xlabel('Distance [m]') 
ylabel('Capacity [bps] ')  
 