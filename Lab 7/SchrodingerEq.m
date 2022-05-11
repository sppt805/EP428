% RK4 Shcrodinger Plot

function r = SchrodingerEq(t,s0) % inital psi and d/dx psi values
En = (11E3);%*1.602E-19; % (J) kg*m^2
V = 0; % Inside well
% L = E-11; % m
m = 0.511E6/(3E8)^2; % eV
hbar = 6.582E-16; % eV

psi = s0(1); 
phi = s0(2); % First derivative
dphi = ((2*m)/(hbar^2))*(V-En)*psi; % Second derivative

r = [phi;dphi];

end