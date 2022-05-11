% Script Q4

E0 = 11E3; % [11,14,17];
L = 1E-11;
dL = L/1000;
len = 0:dL:L;
x0 = [0,1];

[x,r] = RungeKutta4_v2(@SchrodingerEq_v2,x0,E0,0,L,dL);
% [x,r] = ode45(@SchrodingerEq,len,x0);

figure(1);
plot(x,r(1,:));
hold on
ylim([-0.3E-11 0.3E-11]);
title('Wave Equation Solution');
xlabel('x Displacement');
ylabel('\Psi(x)');

E0 = 14E3;
[x,r] = RungeKutta4_v2(@SchrodingerEq_v2,x0,E0,0,L,dL);
plot(x,r(1,:));

E0 = 17E3;
[x,r] = RungeKutta4_v2(@SchrodingerEq_v2,x0,E0,0,L,dL);
plot(x,r(1,:));

legend('E = 11keV','E = 14keV','E = 17keV');