% A5Q1_Test

r0 = [6378+480,0,0,0,7.7102,0,0]; % x,y,z,vx,vy,vz,dm
t0 = 0;
tf = 100*60;
dt = 0.1;
[t,r] = LeapfrogMethod(@orbitalMotion,r0,t0,tf,dt);

figure(1);
hold on
title('Leap Frog Test');
xlabel('X Position');
ylabel('Y Position');
plot(r(:,1),r(:,2));
hold off