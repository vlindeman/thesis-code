clear; 
clc;
INF = 2147483647;

% constants
h = [5, 5, 5]; % demand vector
z = [1, 1, 1, 1, 1, 1, 1, 1, 1]; % link cost vector. 
c = [10, 10, 10, 5, 15, 10, 5, 15, 10]; % link capacity vector
D = length(h); % number of unique demands
E = length(c); % number of links

% define X = flow variable and Y = load balace variable 
variables = {'X_11','X_12','X_13', ...
             'X_21','X_22','X_23', ...
             'X_31','X_32','X_33', 'Y'};
         
N = length(variables); 

% create variables for indexing 
for v = 1:N 
   eval([variables{v},' = ', num2str(v),';']); 
end
       

% define inequality constraints
A = zeros(E,N);
A(1,[X_11, X_12, X_13, Y]) = [1,1,1,-10];   b(1) = 0;
A(2,[X_21, X_22, X_23, Y]) = [1,1,1,-10];   b(2) = 0;
A(3,[X_31, X_32, X_33, Y]) = [1,1,1,-10];   b(3) = 0;
A(4,[X_11, X_21, X_31, Y]) = [1,1,1,-5];    b(4) = 0;
A(5,[X_12, X_22, X_32, Y]) = [1,1,1,-15];   b(5) = 0;
A(6,[X_13, X_23, X_33, Y]) = [1,1,1,-10];   b(6) = 0;
A(7,[X_11, X_21, X_31, Y]) = [1,1,1,-5];    b(7) = 0;
A(8,[X_12, X_22, X_32, Y]) = [1,1,1,-15];   b(8) = 0;
A(9,[X_13, X_23, X_33, Y]) = [1,1,1,-10];   b(9) = 0;


% define equality constraints
Aeq = zeros(D,N); beq = zeros(3,1);
Aeq(1,[X_11, X_12, X_13, Y]) = [1,1,1,0]; beq(1) = h(1);
Aeq(2,[X_21, X_22, X_23, Y]) = [1,1,1,0]; beq(2) = h(2);
Aeq(3,[X_31, X_32, X_33, Y]) = [1,1,1,0]; beq(3) = h(3);


% define integer constrains
intcon = [X_11 X_12 X_13 X_21 X_22 X_23 X_31 X_32 X_33];


% define lower bound and obj function
lb = zeros(N,1);
ub = [INF INF INF INF INF INF INF INF INF 1];

% objective function coefficients
obj= [0 0 0 0 0 0 0 0 0 0];

% run the optimization function. 
[x, fval] = intlinprog(obj, intcon, A, b, Aeq, beq, lb, ub); 
fprintf('Optimal solution:  %f', x(10))


