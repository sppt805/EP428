% A5Q2f
% Initial Conditions from 2a
r = zeros(1,200);
r(1) = 0.5;
tf = 10000;
t0 = 0;
dt = 0.1;

k = 1;
m = 1;

[t_lf,r_lf] = LeapfrogMethod(@CrystalSolid,r,t0,tf,dt);

% Potential Energy
n = 100;
PE = zeros(length(r_lf),n);
PE(:,1) = 0.5.*k.*r_lf(:,1).^2;
PE(:,n) = 0.5.*k.*r_lf(:,n-1).^2;
PE(:,2:n-1) = 0.5.*k.*(r_lf(:,2:n-1)-r_lf(:,1:n-2)).^2;
% Kinetic Energy
KE = zeros(length(r_lf),n);
KE = 0.5.*m.*(r_lf(:,n+1:end)).^2;

total_E_lf = KE.^2 + PE;

figure(1);
hold on
title('Total Energy');
xlabel('Time')
ylabel('Energy');
% xlim([8000 10000]);
% ylim([0 10E12]);
plot(t_lf,total_E_lf,'r');
% plot(t_lf,KE,'b');

%% Runge Kutta 4
% Initial Conditions from 2a
r = zeros(1,200);
r(1) = 0.5;
tf = 10000;
t0 = 0;
dt = 0.1;

k = 1;
m = 1;

[t_rk4,r_rk4] = RungeKutta4(@CrystalSolid,r,t0,tf,dt);

% Potential Energy
n = 100;
r_rk4 = r_rk4';
PE2 = zeros(length(r_rk4),n);
PE2(:,1) = 0.5*k.*r_rk4(:,1).^2;
PE2(:,n) = 0.5*k.*r_rk4(:,n-1).^2;
PE2(:,2:n-1) = 0.5*k.*(r_rk4(:,2:n-1)-r_rk4(:,1:n-2)).^2;
% Kinetic Energy
KE2 = zeros(length(r_rk4),n);
KE2 = 0.5*m.*(r_rk4(:,n+1:end)).^2;

total_E_rk4 = KE2 + PE2;

figure(1);
hold on
% title('Total Energy (RK4)');
% xlabel('Time')
% ylabel('Energy');
% xlim([8000 10000]);
% ylim([0 10E12]);
plot(t_rk4,total_E_rk4,'b');
