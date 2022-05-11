%% 1a - Brute Force
% Spencer Thiessen | 11234606 | spt805
% Purpose: To calculate the evolution of a recurrence relation - The logistic Map
% variables: dr - unit step of our r variable
%            x - the solution to the logistic map
function logisticMap(dr)
r = 1; % Start r at initial value 1
x = 0.5; % Seed value of x0

figure(1); % Figure 1 for holding plots
title('Logistic Map');
xlabel('R');
ylabel('X_n');
% For each step value of r
for j = 1:dr:4
    r = j; % Update r value to next step
    % For n=1000 iterations to find x_n
    for i = 1:1000
        % Recursive help function to return calculated x value given
        % initial x and r values
        x = logicMapHelp(r,x);
    end
    figure(1);
    hold on
    % Iterate another 1000 times just as before
    for i = 1:1000
        x = logicMapHelp(r,x);
        % Plot r,x values on the same plot after each iteration of r
        plot(r,x,'r.');
    end
end
end