% This function takes a coupled ODE, intial conditions, and a desired time step accuracy
% to solve a given ODE from f
function [t,r] = RungeKutta4Adaptive(f,r0,t0,tf,target)
% Guess solution
dt = (tf-t0)/1000;
% Allocate space
n = 10000;
t = zeros(1,n);
m = length(r0);
r = zeros(m,n);
% Inital Conditions
t(1) = t0;
r(:,1) = r0;

i = 1;
while t(i) < tf
    % 2 steps of dt
    k = rk4Slope(f,t(i),r(:,i),dt);
    x1 = r(:,i) + k.*dt;
    k = rk4Slope(f,t(i)+dt,x1,dt);
    x1 = x1 + k.*dt; % solutions for each var at current time step

    % 1 step of 2*dt
    k = rk4Slope(f,t(i),r(:,i),2*dt);
    x2 = r(:,i) + k.*2*dt; % [x2] solutions for each var at current time step

    rho = 30*(((dt)*target)/(abs(x1(1)-x2(1))));
    
    % Accuracy bigger Than Target
    if rho < 1.0
       % Decrease step size
       dt = dt.*(rho.^(1/4));
       % 2 steps to get x1
       k = rk4Slope(f,t(i),r(:,i),dt);
       x1 = r(:,i) + k.*dt; % solutions for each var at current time step
       k = rk4Slope(f,t(i)+dt,x1,dt);
       x1 = x1 + k.*dt;
       t(i+1) = t(i) + 2*dt;
    else
% Increase dt for next time
       t(i+1) = t(i) + 2*dt;
       % Check to make sure dt does not increase by more than 2 times
       if dt*rho^(1/4) < 2.0
           dt = dt*rho^(1/4);
       else
           dt = dt*2;
       end
    end
    % Set solution to x1
    r(:,i+1) = x1;
    i=i+1;
end
r(r==0) = nan; % remove line connecting first and last points
end