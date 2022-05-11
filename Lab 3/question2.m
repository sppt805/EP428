%% Question 2
% This script runs various ODE solving methods for Lorenz
% set of coupled equations. Each output is then plotted respectfully
figure(1);
hold on
title('Comparison  of ODE Functions');
xlabel('Time, t');
ylabel('Position');
[t1,r1]=RungeKutta4(@Lorenz,[0,2,20],0,15,0.01);
[t2,r2]=EulerMethodMultivar(@Lorenz,[0,2,20],0,15,0.01);
[t3,r3] = ode45(@Lorenz,0:0.01:15,[0,2,20]);
plot(t1,r1(1,:)); % x(t)
plot(t2,r2(1,:)); % x(t)
plot(t3,r3(:,1)); % x(t)
legend('RK4','Euler','ode45');
% [t,r]=RungeKutta4(@Lorenz,[0,2,20],0,15,0.01);
% for i=1:3
%     plot(t,r(i,:));
% end
% legend('X(t)','Y(t)','Z(t)');
% hold off
% 
% figure(2);
% hold on
% title('Euler Method');
% xlabel('Time, t');
% ylabel('Position');
% [t,r]=EulerMethodMultivar(@Lorenz,[0,2,20],0,15,0.01);
% for i=1:3
%     plot(t,r(i,:));
% end
% legend('X(t)','Y(t)','Z(t)');
% hold off
% 
% figure(3);
% hold on
% title('Built in ode45');
% xlabel('Time, t');
% ylabel('Position');
% [t,r] = ode45(@Lorenz,0:0.01:15,[0,2,20]);
% for i=1:3
%     plot(t,r(:,i));
% end
% legend('X(t)','Y(t)','Z(t)');