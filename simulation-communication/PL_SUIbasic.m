function [PL] = PL_SUIbasic(d, d0,freq,hb,s,n)

lambda = physconst('LightSpeed')/freq       % wavelength, in m 

A = 20*log10(4*pi*d0/lambda);

a = [4.6 4 3.6]
b = [0.0075 0.0065 0.005]
c = [12.6 17.1 20]
gamma = a(n) - b(n)*hb + c(n)/hb 

PL = A + 10*gamma*log10(d/d0)+s;  
end

