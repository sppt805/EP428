% Population
n = 1E6;
% initial condition
icond = cell2mat({n,0.01*n,0}); % # living, # zombies, # dead

[t,r] = EulerMethodMultivar(@ZombieSim,icond, 0, 100, 0.01);% #function, #initial conditions, #start, #end, #interval

figure(8);
plot(t,r);
title('Zombie Apocolypse Simulation')
xlabel('Time, Months')
ylabel('Number of People')
legend('Living','Zombies','Dead')