%% Calculate SINR with given PL matrix  
clc

% enter Pt and Bandwidth 
PtWatt = 48.3209     ;
B = 1500 * 10^6;

PtdB = pow2db(PtWatt);
N0 = 10^-9;

% calculate and convert Pr
Pr_dB = PtdB  - PL;
Pr = db2pow(Pr_dB);

Pi = Pr;
N = length(Pr);

% calculate SNR 
for i = 1:N
    SINR(i) = Pr(91)/(N0*B+Pi(i));
end

% calculate Shannon capacity 
for i = 1:N
    C(i) = B*log2(1+SINR(i));
end


plot(d,C)
hold on 
%axis([0 inf 0 inf])
xlabel('Distance [m]') 
ylabel('Capacity [bps] ')  

