function f = PotentialWellBoundary_bonus(E0)

En = E0;
V0 = 50;
L = 1E-11;
dL = L/1000;
% len = 0:dL:L;
x0 = [0,1];

[x,r] = RungeKutta4_v3(@SchrodingerEq_v3,x0,En,V0,0,L,dL);
% [x,r] = ode45(@SchrodingerEq,len,x0);
f = r(1,end);

end