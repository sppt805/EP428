% Script Q5

E0 = 10E-8;
hbar = 6.582E-16; % eV
L = 1E-11; % m
m = 0.511E6/(3E8)^2; % eV

E = NewtonRaphsonMultivar(@PotentialWellBoundary,E0,1E-4);
% f = TestingEq(x);

% Numerical value of E_1
E1 = pi()^2*hbar^2/(2*m*L^2);

disp(['Ground Energy Estimate: ', num2str(E)]);
disp(['Ground Energy Numerical: ', num2str(E1)]);