% A4Q2c

r = zeros(1,200);
% inital displacement of 0.2
r(1:100) = 0.2;
tf = 1000;
t0 = 0;
dt = 0.01;

[t,r] = LeapfrogMethod(@CrystalSolid,r,t0,tf,dt);

% Position of first mass over time
figure(1);
hold on
title('Position of Mass #1 (Initial Displacement 0.2)');
xlabel('Time');
ylabel('Displacement');
plot(t,r(:,1));
hold off

% All mass positions
figure(2);
hold on
title('Position of All Masses Over Time (Initial Displacement 0.2)');
xlabel('Time');
ylabel('Mass Number');
xlim([0 100000]);
ylim([0 100]);
imagesc(r(:,1:100)'); % Transposed to put time on x-axis
colormap(gray);
hold off