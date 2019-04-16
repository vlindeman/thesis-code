%% Friis free space PL model
% The most common frequency bands: 450 MHz, 800 MHz, 900 MHz and 2600 MHz
clear    
freq = 2600 * 10^6                             
lambda = physconst('LightSpeed')/freq   

d= 10:1:330;

PL = 20*log10((4*pi*d)/lambda);

plot(d, PL)
hold on
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  
