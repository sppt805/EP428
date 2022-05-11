% This function uses Euler method to solve coupled ODEs
% f: Function to define ODE relationship
% r0: initial condition array for each dependent variable
% t0: start time
% tf: final time
% dt: time step
% Returns an array containing the time, steps and solutions to each
% dependent variable [t,r]
function [t,r] = EulerMethodMultivar(f,r0,t0,tf,dt)
t = (t0:dt:tf); % initialise time array
r = ones(length(r0),length(t)); % allocate 2D array containing solutions at each time step
r(:,1) = r0; % set the inital condition

% Use FirstODE to calculate the components of k for each variable
for i=1:length(t)-1
    k = f(t(i),r(:,i)); % Slopes at each time step
    r(:,i+1) = r(:,i) + k*dt; % solutions for each var at current time step
end
    % For Question1
% figure(1)
% plot(t,r,'r')
% title('Solution over Time')
% xlabel('Time')
% ylabel('Solution')
% legend('x(t)', 'y(t)')
%     For 2a
% figure(2)
% title('Lorentz Variables as Functions of Time')
% xlabel('Time, t')
% ylabel('X/Y/Z')
% hold on
% plot(t,r(1,:),'r')
% plot(t,r(2,:),'b')
% plot(t,r(3,:),'k')
% legend('x(t)','y(t)','z(t)');
% hold off
%     2b
% figure(3)
% hold on
% title('X vs. Z');
% xlabel('X');
% ylabel('Z');
% plot(r(1,:),r(3,:));
% 
% 
% figure(4);
% hold on
% title('Y vs. X');
% xlabel('Y');
% ylabel('X');
% plot(r(2,:),r(1,:));
% 
% figure(5);
% hold on
% title('Y vs. Z');
% xlabel('Y');
% ylabel('Z');
% plot(r(2,:),r(3,:));
end

