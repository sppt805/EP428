function r = SchrodingerEq_v3(t,s0,E0,V0) % inital psi and d/dx psi values
En = E0;%*1.602E-19; % (J) kg*m^2
L = 1E-11; % m
V = V0*t^2/(L^2); % Inside well

m = 0.511E6/(3E8)^2; % eV
hbar = 6.582E-16; % eV

psi = s0(1); 
phi = s0(2); % First derivative
dphi = ((2*m)/(hbar^2))*(V-En)*psi; % Second derivative

r = [phi;dphi];

end