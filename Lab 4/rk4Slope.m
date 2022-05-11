function k = rk4Slope(f,t,r,dt)
% Use FirstODE to calculate the components of k for each variable
k1 = f(t, r); % Slopes at each time step
k2 = f(t+0.5*dt, r+0.5*dt*k1);
k3 = f(t+0.5*dt, r+0.5*dt*k2);
k4 = f(t+dt, r+dt*k3);

k = (1/6).*(k1 + 2.*k2 + 2.*k3 + k4);

end