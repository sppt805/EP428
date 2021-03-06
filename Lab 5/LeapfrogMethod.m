function [t,r] = LeapfrogMethod(f,r0,t0,tf,dt)

t = (t0:dt:tf); % initialise time array
r = zeros(length(t),length(r0)); % allocate 2D array containing solutions at each time step
r(1,:) = r0;

% First Midpoint x(t+1/2dt)
% k1 = r(:,1) + 0.5*dt*f(t(1),r(:,1)); % Euler Approximation

for i = 1:length(t)-2
    % First Midpoint x(t+1/2dt)
    k1 = r(i,:) + 0.5*dt*f(t(i),r(i,:)); % Euler Approximation
    % Full time step X(t+dt)
    r(i+1,:) = r(i,:) + dt.*f(t(i)+0.5.*dt,k1);
    % Second Midpoint x(t+3/2dt)
    k2 = k1 + dt*f(t(i)+dt,r(i+1,:));
    % Full time Step x(t+2dt)
    r(i+2,:) = r(i+1,:) + dt*f(t(i)+3/2*dt,k2);
end


end