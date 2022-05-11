% This function Uses the runge kutta method to solve a set of coupled ODEs
% with an arbitrary number of dependent variables
function [t,r] = RungeKutta4(f,r0,t0,tf,dt)
t = (t0:dt:tf); % initialise time array
r = zeros(length(r0),length(t)); % allocate 2D array containing solutions at each time step
r(:,1) = r0; % set the inital condition

% Use FirstODE to calculate the components of k for each variable
for i=1:length(t)-1
    k1 = f(t(i), r(:,i)); % Slopes at each time step
    k2 = f(t(i)+0.5*dt, r(:,i)+0.5*dt*k1);
    k3 = f(t(i)+0.5*dt, r(:,i)+0.5*dt*k2);
    k4 = f(t(i)+dt, r(:,i)+dt.*k3);
    
    k = (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    r(:,i+1) = (r(:,i) + k*dt); % solutions for each var at current time step
end

end