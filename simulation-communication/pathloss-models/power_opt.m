%% Optimize the transmission power 

% Enter PL and PrMin
PrMin =  -47.1220;
PL = max(PL)

% define inequality constraints 
A = [-1]; b = [(PrMin+PL)];

% objective function 
f = [1];
x = linprog(f,A,b);
x = -x % convert, due to matlab default form

db2pow(x) % Power in Watt 


%% 

pow2db(0.000019339)
