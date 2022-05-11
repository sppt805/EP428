% Script Q4

%E = 11E3; % [11,14,17];
L = 1E-11;
dL = L/1000;
len = 0:dL:L;
x0 = [0,1];

[x,r] = RungeKutta4(@SchrodingerEq,x0,0,L,dL);
% [x,r] = ode45(@SchrodingerEq,len,x0);
f = r(1,end);

figure(1);
plot(x,r(1,:));
hold on
title('Wave Equation Solution');
ylim([-1E-11 1E-11]);
xlabel('x Displacement');
ylabel('\Psi(x)');
