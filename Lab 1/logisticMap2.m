%% 1b - Array Based Operation
% Spencer Thiessen | 11234606 | spt805
% Purpose: To calculate the evolution of a recurrence relation - The logistic Map
% (Updated more efficient version)
% variables: dr - unit step of our r variable
%            x - the solution to the logistic map
function logisticMap2(dr)
% Make r an array of size steps dr from 1-4
r = (1:dr:4);
n = length(r); % n holds the number of r values
x = 0.5; % initial value of x

% iterate through the first 1000 values for x
for i = 1:1000
    % array based multiplication of r values and x
	x = r.*x.*(1-x);
end
% Create new figure for plotting
figure(2);
title('Fixed Point Comparison');
xlabel('R Values');
ylabel('X_n');
hold on
% iterate another 1000 iterations of x
for i = 1:1000
    x = r.*x.*(1-x);
    % Plot each updated x value with r
    plot(r,x,'b.');
end

%% 1d - Overplot (r-1)/r
for k = 1:n-1
   xp = (r(k)-1)/r(k); % Limit of fixed point regime
   hold on
   scatter(r(k), xp,'k','DisplayName','(r-1)/r');
end

%% 1e - New Plot
r2=[1.5;2.9;3.5;3.8]; % arbitray r values
x2 = zeros(length(r2),100); % allocate x table to have 4 rows (one for each r)
% and 100 columns
x2(:,1) = 0.5; % set initial condition for the first row of all x values to 0.5
% Create the figure to plot
figure(3);
title('Plot of X_n at Several r Values');
xlabel('R Values');
ylabel('X_n');
% first 100 iterations
for i = 1:100-1
    % array operation to calculate next x value
    % by multiply all r values with our x table
    x2(:,i+1) = r2.*x2(:,i).*(1-x2(:,i));
end
hold on
% to plot the legend on the figure a loop is needed for seperating entries
for i=1:4
    scatter(r2(i).*ones(1,100),x2(i,:));
end
legend('r=1.5','r=2.9','r=3.5','r=3.8')
end