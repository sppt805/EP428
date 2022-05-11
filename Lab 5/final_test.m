%test
r0 = [0,1]; % x,y,z,vx,vy,vz,dm
t0 = 0;
tf = 10;
dt = 0.1;
[t,r] = LeapfrogMethod(@drag,r0,t0,tf,dt);
