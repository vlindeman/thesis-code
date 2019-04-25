
clear
% constants from running PL model 
PL = 91.12; 
PrMin = -105; 

% define inequality constraints 
A = [-1]; b = [(PL+PrMin)];

% objective function 
f = [1];
x = linprog(f,A,b);
x = -x % convert, due to matlab default form

db2pow(x) % Power in Watt 
