%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot of  An Array Factor as A Function of Angles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
% Excitation Strength
E1=[1 0 1 0 0];
E2=[1 1 0 0 0];
E3=[1 1 1 0 0];
E4=[1 2 1 0 0];
E5=[1 1 1 1 1];
E6=[1 4 6 4 1];
% Theta 
theta=-2*pi:0.001:2*pi;
% Speed of Light
c=3*10^8;
% Frequency 
f=1000*10^6;
beta=0;
% Lambda value
lambda= c/f;
% Distance 
d=lambda/2;
k= 2*pi/lambda;
phi=(k*d*cos(theta))+beta;

%Plotting the excitation 
Afr1= E1(1)+((E1(2)*cos(k*d*cos(theta))))+((E1(3)*cos(2*k*d*cos(theta))))+((E1(4)*cos(3*k*d*cos(theta))))+((E1(5)*cos(4*k*d*cos(theta))));
Afi1=((E1(2)*sin(k*d*cos(theta))))+((E1(3)*sin(2*k*d*cos(theta))))+((E1(4)*sin(3*k*d*cos(theta))))+((E1(5)*(sin(4*k*d*cos(theta)))));
ff1=abs(complex(Afr1,Afi1));
x1= cos(theta);
y1= sin(theta);
figure(1)
%plot(ff1.*x1,ff1.*y1)
polar(theta,ff1,'--r')
title('Exitaction Strength [1]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Afr2= E2(1)+((E2(2)*cos(k*d*cos(theta))))+((E2(3)*cos(2*k*d*cos(theta))))+((E2(4)*cos(3*k*d*cos(theta))))+((E2(5)*cos(4*k*d*cos(theta))));
Afi2=((E2(2)*sin(k*d*cos(theta))))+((E2(3)*sin(2*k*d*cos(theta))))+((E2(4)*sin(3*k*d*cos(theta))))+((E2(5)*(sin(4*k*d*cos(theta)))));
ff2=abs(complex(Afr2,Afi2));
x1= cos(theta);
y1= sin(theta);
figure(2)


% plot(ff2.*x1,ff2.*y1)
 polar(theta,(ff2),'--r')
title('Plot Excitation [1 1]')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Afr3= E3(1)+((E3(2)*cos(k*d*cos(theta))))+((E3(3)*cos(2*k*d*cos(theta))))+((E3(4)*cos(3*k*d*cos(theta))))+((E3(5)*cos(4*k*d*cos(theta))));
Afi3=((E3(2)*sin(k*d*cos(theta))))+((E3(3)*sin(2*k*d*cos(theta))))+((E3(4)*sin(3*k*d*cos(theta))))+((E3(5)*(sin(4*k*d*cos(theta)))));
ff3=abs(complex(Afr3,Afi3));
x1= cos(theta);
y1= sin(theta);
figure(3)
% plot(ff2.*x1,ff2.*y1)
 polar(theta,ff3,'--r')
title('Plot Excitation [1 1 1 0 0]')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Afr4= E4(1)+((E4(2)*cos(k*d*cos(theta))))+((E4(3)*cos(2*k*d*cos(theta))))+((E4(4)*cos(3*k*d*cos(theta))))+((E4(5)*cos(4*k*d*cos(theta))));
Afi4=((E4(2)*sin(k*d*cos(theta))))+((E4(3)*sin(2*k*d*cos(theta))))+((E4(4)*sin(3*k*d*cos(theta))))+((E4(5)*(sin(4*k*d*cos(theta)))));
ff4=abs(complex(Afr4,Afi4));
x1= cos(theta);
y1= sin(theta);
figure(4)
% plot(ff2.*x1,ff2.*y1)
 polar(theta,ff4,'--r')
title('Plot Excitation [1 2 1 0 0]')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Afr5= E5(1)+((E5(2)*cos(k*d*cos(theta))))+((E5(3)*cos(2*k*d*cos(theta))))+((E5(4)*cos(3*k*d*cos(theta))))+((E5(5)*cos(4*k*d*cos(theta))));
Afi5=((E5(2)*sin(k*d*cos(theta))))+((E5(3)*sin(2*k*d*cos(theta))))+((E5(4)*sin(3*k*d*cos(theta))))+((E5(5)*(sin(4*k*d*cos(theta)))));
ff5=abs(complex(Afr5,Afi5));
x1= cos(theta);
y1= sin(theta);
figure(5)
% plot(ff2.*x1,ff2.*y1)
 polar(theta,ff5,'--r')
%title('Plot Excitation [1 1 1 1 1]')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Afr6= E6(1)+((E6(2)*cos(k*d*cos(theta))))+((E6(3)*cos(2*k*d*cos(theta))))+((E6(4)*cos(3*k*d*cos(theta))))+((E6(5)*cos(4*k*d*cos(theta))));
Afi6=((E6(2)*sin(k*d*cos(theta))))+((E6(3)*sin(2*k*d*cos(theta))))+((E6(4)*sin(3*k*d*cos(theta))))+((E6(5)*(sin(4*k*d*cos(theta)))));
ff6=abs(complex(Afr6,Afi6));
x1= cos(theta);
y1= sin(theta);
figure(6)
% plot(ff2.*x1,ff2.*y1)
 polar(theta,ff6,'--r')
title('Plot Excitation [1 4 6 4 1]')

