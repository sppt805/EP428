% A4Q2d

r = zeros(1,200);
% inital velocity of 0.1
r(100:200) = 0.1;
tf = 1000;
t0 = 0;
dt = 0.01;

[t,r] = LeapfrogMethod(@CrystalSolid,r,t0,tf,dt);

% Position of first mass over time
figure(1);
hold on
title('Position of Mass #1 (Initial Velocity 0.1)');
xlabel('Time');
ylabel('Displacement');
plot(t,r(:,1));
hold off

% All mass positions
figure(2);
hold on
title('Position of All Masses Over Time (Initial Velocity 0.1)');
xlabel('Time');
ylabel('Mass Number');
xlim([0 100000]);
ylim([0 100]);
imagesc(r(:,1:100)'); % Transposed to put time on x-axis
colormap(gray);
hold off