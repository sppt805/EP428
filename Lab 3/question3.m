%question 3
% For starting at t=0.1
r = [sin(0.1^2),2*0.1*cos(0.1^2)];
[t1,r1] = RungeKutta4(@nonLinearODE,r,0.1,30,0.1);
hold on
figure(1);
plot(t1,sin(t1.^2)); % analytic solution
title('Analytic Solution');
xlabel('Time, t');
ylabel('Position');
%
[t2,r2] = RungeKutta4(@nonLinearODE,r,0.1,30,0.01);
figure(2);
plot(t2,r2(1,:)); %solution from our runge Kutta solve
title('Numeric Solution');
xlabel('Time, t');
ylabel('Position');

figure(3);
loglog(t2,abs(sin(t2.^2)-r2(1,:))); % difference between our analytic and numeric solution
title('Error in Numerical Solution');
xlabel('Time, t');
ylabel('Position');