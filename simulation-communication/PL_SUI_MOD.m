function [PL] = PL_SUI_MOD(alpha, d, d0,freq,hb,hr,s,n)
lambda = physconst('LightSpeed')/freq 

PL_sui_d = PL_SUI(d, d0,freq,hb,hr,s,n)
PL_sui_d0 = PL_SUI(d0, d0,freq,hb,hr,s,n)
A = 20*log10(4*pi*d0/lambda);

PL = alpha*(PL_sui_d - PL_sui_d0)+A+s; 
end