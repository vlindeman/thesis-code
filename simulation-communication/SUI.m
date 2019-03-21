%% STANFORD UNIVERSITY INTERIM model
clear
d0 = 100           
freq = 2 * 10^9                             % frequency, in hz 
lambda = physconst('LightSpeed')/freq       % wavelength, in m
hb = 50                                     % base station height, in m.
s = 10                                      % shadowing effect, dB 

A = 20*log(4*pi*d0/lambda);

n = 1
a = [4.6 4 3.6]
b = [0.0075 0.0065 0.005]
c = [12.6 17.1 20]
gamma = a(n) - b(n)*hb + c(n)/hb
    

d = 110 : 10 : 10*10^3;

Lb = A + 10*gamma*log(d/d0)+s;
plot(d+110, db2mag(Lb))

