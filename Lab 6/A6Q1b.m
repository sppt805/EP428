%% Testing Script part B

T = 1:1:1200; % Kelvin
c = 0.5:0.1:1.5;
target  = 1;

m = zeros(length(T),length(c));
n = zeros(length(m),length(c));

for i=1:length(T)
    for j = 1:length(c)
        [m(i,j),n(i,j)] = MagnetizationRelaxation(T(i),c(j),target);
    end
end

figure(1);
hold on
xlabel('Temperature, K');
ylabel('Magnetization');
for k = 1:length(c)
       plot(T,m(:,k));
end
title('Magnetization as Function of Temperature (Target = 1)')
legend('c = 0.5','c = 0.6','c = 0.7', 'c = 0.8','c = 0.9', 'c = 1.0','c = 1.1','c = 1.2', 'c = 1.3', 'c = 1.4', 'c = 1.5');
hold off

%% Script Part c

figure(2);

for k = 1:length(c)
       semilogy(T,n(:,k));
       hold on
end
title('Number Iterations at Varying Temperatures')
xlabel('Temperature, K');
ylabel('Number Iterations');
legend('c = 0.5','c = 0.6','c = 0.7', 'c = 0.8','c = 0.9', 'c = 1.0','c = 1.1','c = 1.2', 'c = 1.3', 'c = 1.4', 'c = 1.5');

sum_iter = zeros(1,length(c));
for i = 1: length(c)
   sum_iter(i) = sum(n(:,i));
end
H = ['(Target = 1) Total Iterations for c = ', c,': ', sum_iter];
disp(sum_iter);

%% Script for Part d

T = 1:1:1200; % Kelvin
c = 0.5:0.1:1.5;
target  = 5;
m = zeros(length(T),length(c));
n = zeros(length(m),length(c));
for i=1:length(T)
    for j = 1:length(c)
        [m(i,j),n(i,j)] = MagnetizationRelaxation(T(i),c(j),target);
    end
end

figure(3);
hold on
xlabel('Temperature, K');
ylabel('Magnetization');
for k = 1:length(c)
       plot(T,m(:,k));
end
title('Magnetization as Function of Temperature (Target = 5)')
legend('c = 0.5','c = 0.6','c = 0.7', 'c = 0.8','c = 0.9', 'c = 1.0','c = 1.1','c = 1.2', 'c = 1.3', 'c = 1.4', 'c = 1.5');
hold off

figure(4);
for k = 1:length(c)
       semilogy(T,n(:,k));
       hold on
end

title('Number Iterations at Varying Temperatures (Target = 5)')
xlabel('Temperature, K');
ylabel('Number Iterations');
legend('c = 0.5','c = 0.6','c = 0.7', 'c = 0.8','c = 0.9', 'c = 1.0','c = 1.1','c = 1.2', 'c = 1.3', 'c = 1.4', 'c = 1.5');

sum_iter = zeros(1,length(c));
for i = 1: length(c)
   sum_iter(i) = sum(n(:,i));
end
H = ['(Target = 5) Total Iterations for c = ', c,': ', sum_iter];
disp(sum_iter);