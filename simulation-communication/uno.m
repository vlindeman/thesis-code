%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%
%   WIRELESS COMMUNICATIONS
%   
%
%   NOE MENDIVIL
%   
%   https://se.mathworks.com/matlabcentral/fileexchange/7204-large-scale-path-loss-and-okumura-model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%   LARGE SCALE PATH LOSS 

clear all;
%close all;
N=30;
d = 1:N;
n=1;
z=1;
Pt=1;  %Transmited Power

while n<=4.5
    Pr=Pt*(1./(d.^n));
    Pr = 10.*log(Pr);
    n=n+0.5;
    subplot(2,4,z)
    z=z+1;
    plot(Pr)
    axis tight; grid on; 
    title(['Power at the Receiver for n=',num2str(n-0.5)]);
    xlabel('Kilometers'); 
    ylabel('Received Power (dB)');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   OKUMURA MODEL
%   RANGE OF FREQUENCIES: 150 TO 1920 MHz
%   DISTANCES OF 1 Km TO 100 Km
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Hte=100;        % Base Station Antenna Height 
Hre=2;          % Mobile Antenna Height
d = 50;         % Distance 30 Km
lamda=(3*10^8)/(900*10^6);
Lf = 10.*log((lamda^2)/((4*pi)^2)*d^2); %   Free Space Propagation Loss
Amu = 35;       % Median Attenuation Relative to Free Space (900 MHz and 30 Km)
Garea = 9;      % Gain due to the Type of Environment (Suburban Area)
Ghte = 20.*log(Hte/200); % Base Station Antenna Height Gain Factor
Ghre = 10.*log(Hre/3);

%   Propagation Path Loss
L50 = Lf+Amu-Ghte-Ghre-Garea
