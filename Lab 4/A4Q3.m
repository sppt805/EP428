% Question 3

s = {0,500+6378,0,10,0,0}; %x,y,z,vx,vy,vz
m = 2000;
t0 = 0;
tf = 100000;

[t,r] = RungeKutta4Adaptive(@Orbit,[0,500+6378,0,10,0,0],t0,tf,10e-4);
% Earth Area
Re = 6378;
x=0;
y=0;
th = 0:pi/100:2*pi;
xunit = Re * cos(th) + x;
yunit = Re * sin(th) + y;


figure(1);
title('Orbit 10e-4');
xlim([-20000 20000]);
ylim([-50000 10000]);
xlabel('X position')
ylabel('Y position')
hold on
plot(xunit, yunit);
plot(r(1,:),r(2,:));

% 10e-7
[t,r] = RungeKutta4Adaptive(@Orbit,[0,500+6378,0,10,0,0],t0,tf,10e-7);

figure(2);
title('Orbit 10e-7');
xlim([-20000 20000]);
ylim([-50000 10000]);
xlabel('X position')
ylabel('Y position')
hold on
plot(xunit, yunit);
plot(r(1,:),r(2,:));

figure(3);
hold on
title('Time Step vs. Orbit Altitude');
ylabel('Time Steps');
xlabel('Altitude');
alt = sqrt(r(1,:).^2 + r(2,:).^2);
steps = diff(t);
plot(alt(2:end),steps);

% Apogee alt against perigee velocity
vel = 8.0:0.1:10.5;
alt = zeros(length(vel));
for i=1:length(vel)-1
    [t,r] = RungeKutta4Adaptive(@Orbit,[0,500+6378,0,vel(i),0,0],t0,tf,10e-7);
    heights = sqrt(r(1,:).^2 + r(2,:).^2);
    alt(i) = max(heights);
end
figure(4);
hold on
title('Perigee Velocity vs. Apogee Altitude');
xlabel('Perigee Velocity');
ylabel('Apogee Altitude');
plot(vel,alt);
