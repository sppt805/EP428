% Script for Question 2
function x = nonLinFunction(r)
G = 6.674E-11; % m^3/(kg s^2)
me = 5.974E24; % kg
mm = 7.348E22; % kg
rm = 3.844E8; % m
omega = 2.662E-6; % rad/s

x = ((G*me)/(r^2)) - ((G*mm)/(rm-r)^2) - (omega^2)*r;

end