
clear
% Enter PL and PrMin
PL = 26.8823
PrMin =  -47.1220;


% define inequality constraints 
A = [-1]; b = [(PL+PrMin)];

% objective function 
f = [1];
x = linprog(f,A,b);
x = -x % convert, due to matlab default form

db2pow(x) % Power in Watt 


%%

pow2db(0.000019339)
