% A4Q2b

r = zeros(1,200);
low_lim = -0.2;
hi_lim = 0.2;
% Generate array of 100 random numbers between -0.2 and 0.2
randNums = (hi_lim - low_lim)*rand(1,100)+low_lim;
% Check that all values within range
rand_range = [min(randNums) max(randNums)];
r(1:100) = randNums;
tf = 1000;
t0 = 0;
dt = 0.01;

[t,r] = LeapfrogMethod(@CrystalSolid,r,t0,tf,dt);

% Position of first mass over time
figure(1);
hold on
title('Position of Mass #1 (Random Initial Displacement)');
xlabel('Time');
ylabel('Displacement');
plot(t,r(:,1));
hold off

% All mass positions
figure(2);
hold on
title('Position of All Masses Over Time (Random Initial Displacement)');
xlabel('Time');
ylabel('Mass Number');
xlim([0 100000]);
ylim([0 100]);
imagesc(r(:,1:100)'); % Transposed to put time on x-axis
colormap(gray);
hold off