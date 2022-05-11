function k = Orbit(t,s)

mu = 398600;

r = sqrt(s(1)^2 + s(2)^2 + s(3)^2);

kx = s(4);
ky = s(5);
kz = s(6);

vx = -mu/(r^3) * s(1);
vy = -mu/(r^3) * s(2);
vz = -mu/(r^3) * s(3);

k = [kx;ky;kz;vx;vy;vz];
end
