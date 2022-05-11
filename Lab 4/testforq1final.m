% run q1
s = [0,1]; %x,vx
t0 = 0;
dt = 0.1;
tf = 10;

[t,r] = RungeKutta4(@drag,s,t0,tf,dt);