% A5Q2e
%% Using 2a Parameters
r0 = zeros(1,200);
r0(1) = 0.5;

tf = 1000;
t0 = 0;
dt = 0.01;
[t,r] = LeapfrogMethod(@CrystalSolid,r0,t0,tf,dt);

% Computational Modes
N = length(t);
n = length(r(:,1))/2; % 100 masses
fs = 1/dt; % sample freq
f = 2*pi*fs/N*(0:(N/2)); % Only want values for 100 masses
s = abs(fft(r,N,1));
xx = s(1:n+1,1);

% Analytical Solution
m = 100;
el = 0:100;
omega = 2.*sin(el.*pi./(2.*(m+1)));

% for i=1:length(m)
%     omega(i) = 2*sin(el(i)*pi/(2*(n+1)));
% end

% Position of first mass over time
clf
figure(1);
hold on
xlim([0 2]);
ylim([0 550]);
title('FFT of Mass #1 Position (2a initial cond.)');
xlabel('Sampling Frequency');
ylabel('Amplitude');
plot(f, xx);
xline(omega);
hold off

%% Using 2b parameters

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

% Computational Modes
N = length(t);
n = length(r(:,1))/2; % 100 masses
fs = 1/dt; % sample freq
f = 2*pi*fs/N*(0:(N/2)); 
s = abs(fft(r,N,1));
xx = s(1:n+1,1);

% Analytical Solution
m = 100;
el = 0:100;
omega = 2.*sin(el.*pi./(2.*(m+1)));

figure(2);
hold on
xlim([0 2]);
ylim([0 1550]);
title('FFT of Mass #1 Position (2b initial cond.)');
xlabel('Sampling Frequency');
ylabel('Amplitude');
plot(f, xx);
xline(omega);
hold off

%% Using 2c Parameters

r = zeros(1,200);
% inital displacement of 0.2
r(1:100) = 0.2;
tf = 1000;
t0 = 0;
dt = 0.01;

[t,r] = LeapfrogMethod(@CrystalSolid,r,t0,tf,dt);

% Computational Modes
N = length(t);
n = length(r(:,1))/2; % 100 masses
fs = 1/dt; % sample freq
f = 2*pi*fs/N*(0:(N/2)); 
s = abs(fft(r,N,1));
xx = s(1:n+1,1);

% Analytical Solution
m = 100;
el = 0:100;
omega = 2.*sin(el.*pi./(2.*(m+1)));

figure(3);
hold on
xlim([0 2]);
ylim([0 550]);
title('FFT of Mass #1 Position (2c initial cond.)');
xlabel('Sampling Frequency');
ylabel('Amplitude');
plot(f, xx);
xline(omega);
hold off

%% Using 2d Parameters

r = zeros(1,200);
% inital velocity of 0.1
r(100:200) = 0.1;
tf = 1000;
t0 = 0;
dt = 0.01;

[t,r] = LeapfrogMethod(@CrystalSolid,r,t0,tf,dt);

% Computational Modes
N = length(t);
n = length(r(:,1))/2; % 100 masses
fs = 1/dt; % sample freq
f = 2*pi*fs/N*(0:(N/2)); 
s = abs(fft(r,N,1));
xx = s(1:n+1,1);

% Analytical Solution
m = 100;
el = 0:100;
omega = 2.*sin(el.*pi./(2.*(m+1)));

figure(4);
hold on
xlim([0 2]);
ylim([0 6550]);
title('FFT of Mass #1 Position (2d initial cond.)');
xlabel('Sampling Frequency');
ylabel('Amplitude');
plot(f, xx);
xline(omega);
hold off