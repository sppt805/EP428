n = 1E6; % Population Size
beta = 3.0;
gamma = 4.3;

icond = cell2mat({0.01*n,n,0}); % # infected, # Susceptible, # Recovered
[t,r] = EulerMethodMultivar(@SIR_ODE,icond, 0, 3, 0.01);
figure(7);
plot(t,r);
xlabel('Months');
ylabel('Number of People');
legend('Infected','Susceptable','Recovered')
figure(8)

hold on
% plot(t,4.3,'k')
ensure = (beta/n)*r(2,:);
plot(t,ensure,'g');
xlabel('Time, Months');
ylabel('Number of Infected')