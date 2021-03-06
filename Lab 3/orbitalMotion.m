% This function simulates the orbit of a system during a cruising operation
% around the Earth with 0 kN thrust. 
function k = orbitalMotion(t,s)

g = 0.00981; % m/s^2
Isp = 300; % sec
u = 389600; % km^3/s^2
T = 0; % kN
m = 2000; % kg
% Initiial Cond
x = s(1);
y = s(2);
z = s(3);

vx = s(4);
vy = s(5);
vz = s(6);

kx = -u/(sqrt(x^2 + y^2 + z^2)^3)*x + (vx*T)/(m*(sqrt(vx^2 + vy^2 + vz^2)));
ky = -u/(sqrt(x^2 + y^2 + z^2)^3)*y + (vy*T)/(m*(sqrt(vx^2 + vy^2 + vz^2)));
kz = -u/(sqrt(x^2 + y^2 + z^2)^3)*z + (vz*T)/(m*(sqrt(vx^2 + vy^2 + vz^2)));

dm = -T/(g*Isp);


k = [vx;vy;vz;kx;ky;kz;dm];
end