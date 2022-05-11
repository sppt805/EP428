% Script for testing

r = zeros(1,200);
r(1) = 0.5;
% r = [1,2,3,4,5,6,7,8];
tf = 1000;
t0 = 0;
dt = 0.01;

[t,r] = LeapfrogMethod(@CrystalSolid,r,t0,tf,dt);
% Position of first mass over time
figure(1);
hold on
title('Position of Mass #1');
xlabel('Time');
ylabel('Displacement');
plot(t,r(:,1));
hold off

% All mass positions
figure(2);
hold on
title('Position of All Masses Over Time');
xlabel('Time');
ylabel('Mass Number');
xlim([0 100000]);
ylim([0 100]);
imagesc(r(:,1:100)'); % Transposed to put time on x-axis
colormap(gray);
hold off