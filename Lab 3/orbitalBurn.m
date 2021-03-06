% This funciton simulates the orbit of a system during a thrust operation
% around the Earth of 10 kN. 
function k = orbitalBurn(t,s)
% Solar System/Earth Constants for orbit
g = 0.00981; % m/s^2
Isp = 300; % sec
u = 398600; % km^3/s^2
T = 10; %k N
m = 2000; % kg
% Initiial Cond
x = s(1);
y = s(2);
z = s(3);
% Seven 1st order ODE
% velocity
vx = s(4);
vy = s(5);
vz = s(6);
% acceleration
kx = -u/(sqrt(x^2 + y^2 + z^2)^3)*x + vx*T/(m*(sqrt(vx^2 + vy^2 + vz^2)));
ky = -u/(sqrt(x^2 + y^2 + z^2)^3)*y + vy*T/(m*(sqrt(vx^2 + vy^2 + vz^2)));
kz = -u/(sqrt(x^2 + y^2 + z^2)^3)*z + vz*T/(m*(sqrt(vx^2 + vy^2 + vz^2)));
% mass
dm = -T/(g*Isp);
% seven values of ds
k = [vx;vy;vz;kx;ky;kz;dm];
end