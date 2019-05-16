%% Friis free space PL model
% The most common frequency bands: 450 MHz, 800 MHz, 900 MHz and 2600 MHz
clear    
freq = 2600 * 10^6;                          
lambda = physconst('LightSpeed')/freq;

% distance
d = 10: 1 : 330; 

% gain
Gr = 24.5;
Gt = 24.5;

% calculate path loss
PL = 20*log10((4*pi*d)/lambda) - Gt - Gr; 


%% Plot
plot(d, PL)
hold on
xlabel('Distance [m]') 
ylabel('Path Loss [dB] ')  

