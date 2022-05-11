% Script for testing

r = zeros(100);
r(1) = 0.5;
tf = 1000;
t0 = 0;
dt = 0.01;

[t,r] = LeapfrogMethod(@CrystalSolid,r,t0,tf,dt);

figure(1);
plot(t,r(:,1));