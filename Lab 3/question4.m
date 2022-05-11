% question 4
%% Perigee
r0 = [6378+480,0,0,0,7.7102,0,0]; % x,y,z,vx,vy,vz,dm
t0 = 0;
tf = 100*60;
dt = 0.1;

[t,r] = RungeKutta4(@orbitalMotion,r0,t0,tf,dt);
figure(3);
hold on
title('Perigee Orbit');
xlabel('x Position');
ylabel('y Position');
plot(r(1,:),r(2,:),'k'); % plot xy

figure(4);
hold on
title('Perigee Altitude over 100 minutes');
xlabel('Time, sec');
ylabel('Altitude');
mag = (length(t));

for i=1:length(r)
    mag(i) = sqrt(r(1,i)^2 + r(2,i)^2 + r(3,i)^2);
end
plot(t,mag);
%% Apogee
r0 = [6378+800,0,0,0,7.7102,0,0]; % x,y,z,vx,vy,vz,dm
t0 = 0;
tf = 100*60; % 100 minutes in seconds
dt = 0.1;

[t,r] = RungeKutta4(@orbitalMotion,r0,t0,tf,dt);
figure(5);
hold on
title('Apogee Orbit');
xlabel('x Position');
ylabel('y Position');
plot(r(1,:),r(2,:),'r'); % plot xy

figure(6);
hold on
title('Apogee Altitude over 100 minutes');
xlabel('Time, sec');
ylabel('Altitude');

mag = sqrt(r(1,:).^2 + r(2,:).^2 + r(3,:).^2);

plot(t,mag);
%% Part d
figure(7);
title('Orbital Transfer')
xlabel('x Position')
ylabel('y Position')
hold on
% Burn
% Starting from perigee
r0 = [6378+480,0,0,0,7.7102,0,0]; % x,y,z,vx,vy,vz,dm
t0 = 0;
tf = 261.11; % 261.11seconds
dt = 0.01;
[t1,r1] = RungeKutta4(@orbitalBurn,r0,t0,tf,dt);
plot(r1(1,:),r1(2,:),'rx'); % plot xy
% Cruise
r0 = r1(:,end)'; % continue from burn
t0 = 261.11;
tf = 261.11+250*60; % continue for 250 minutes
dt = 0.01;
[t2,r2] = RungeKutta4(@orbitalMotion,r0,t0,tf,dt);
plot(r2(1,:),r2(2,:),'k'); % plot xy

%% velocity
figure(8)
hold on
title('Loss of Mass with Change in Velocity')
xlabel('Time, sec');

velocityBurn = sqrt(r1(4,:).^2 + r1(5,:).^2 + r1(5,:).^2);

yyaxis left
plot(t1,velocityBurn);
yyaxis right
plot(t1,r1(7,:))
yyaxis left
ylabel('Velocity, km/s');
yyaxis right
ylabel('Mass, kg');
legend('Velocity','Mass');

v0 = 7.7102;
vf = velocityBurn(end);
changev = vf-v0;
disp(['Change in Velocity during Thrust (km/s): ', num2str(changev)]);

disp(['Change in Mass during Thrust (kg): ', num2str(abs(r1(7,end)))]);

%% Total Apogee
figure(9);
hold on
title('Total Apogee of Orbit');
xlabel('Time, sec');
ylabel('Altitude, km');

dir = sqrt(r2(1,:).^2 + r2(2,:).^2 + r2(3,:).^2);

plot(t2,dir);
disp(['Total Apogee Altitude (km): ', num2str(max(dir))]);
