function [PL] = PL_SUI(d, d0,freq,hb,hr,s,n)
lambda = physconst('LightSpeed')/freq; % wavelength, in m 

A = 20*log10(4*pi*d0/lambda);
 
a = [4.6 4 3.6];
b = [0.0075 0.0065 0.005];
c = [12.6 17.1 20];
gamma = a(n) - b(n)*hb + c(n)/hb;

Xfc = 6*log10((freq/10^6)/2000);
Xrx = -10.8*log10(hr/2);

PL = A + 10*gamma*log10(d/d0)+s+Xfc+Xrx;  
end

