close all
clear

theta = 0:0.01:2*pi;

%rho = sin(theta).*cos(theta);

% rho(1:629) = 0;
% rho(20:32) = 0.5  
% rho(1:19) = 1;
% rho(610:629) = 1;
% rho(598:609) = 0.5;

rho(1:629) = 1;

polarplot(theta,rho)


