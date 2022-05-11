% Question 2 Script
% Initial Conditions
r0 = [sin(0.1^2),2*0.1*cos(0.1^2)];
t0 = 0.1;
tf = 10;
target = 10e-4;
% Call function for solution
[t1,r1]=RungeKutta4Adaptive(@nonLinearODE, r0, t0, tf, target);
[t2,r2]=RungeKutta4(@nonLinearODE, r0, t0, tf, 0.01);
target=10e-8;
[t3,r3]=RungeKutta4Adaptive(@nonLinearODE, r0, t0, tf, target);
% Plot Position vs. time
figure(1);
title('Position vs. Time')
xlabel('Time');
xlim([0 10]);
ylabel('x(t)');
hold on
plot(t1,r1(1,:)); % RK4 adaptive 10e-4
plot(t2,r2(1,:)); % RK4
plot(t3,r3(1,:));
legend('RK4 Adaptive (Target = 10e-4)','RK4 Analytic','RK4 Adaptive (Target = 10e-8)');
% Plot velocity vs. time
figure(2);
hold on
title('Velocity vs. Time')
xlabel('Time');
xlim([0 10]);
ylabel('v(t)');
plot(t1,r1(2,:));
plot(t2,r2(2,:));
plot(t3,r3(2,:));
legend('RK4 Adaptive (Target = 10e-4)','RK4 Analytic','RK4 Adaptive (Target = 10e-8)');

% Error in solutions
err4 = abs(sin(t1.^2) - r1(1,:));

err8 = abs(sin(t3.^2) - r3(1,:));

err = abs(sin(t2.^2) - r2(1,:));
% Difference between analytic and numeric solution
figure(3);
semilogy(t1,err4,t2,err,t3,err8);
legend('Target=10e-4','RK4','Target=10e-8');
title('Error with Adaptive Solution');
ylabel('Error');
xlabel('Time');

% diffrence between times are the time steps
step1 = diff(t1);
step3 = diff(t3);

figure(4)
semilogy(t1(1:length(t1)-1),step1,t3(1:length(t3)-1),step3);
title('Time Steps vs. Time')
xlim([0 10]);
xlabel('Time');
ylabel('Time Step');
legend('Target=10e-4','Target=10e-8');
% Difference in steps taken
disp(['Number of steps with RK4 Non-Adaptive Solution: ', num2str(nnz(t2))]);
disp(['Number of steps with RK4 with Target = 10e-4: ', num2str(nnz(t1))]);
disp(['Number of steps with RK4 with Target = 10e-8: ', num2str(nnz(t3))]);