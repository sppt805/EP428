%% 2 - Tent Map
% Spencer Thiessen | 11234606 | spt805
% Purpose: To calculate and display a discrete time dynamic system - The
% Tent Map
% variables: du - unit step of our mu variable
%            x - the solution to the logistic map
function tentMap(du)
xi = 0.50; % initial Condition
mu = (1:du:2); % mu is an array from 1 to 2 in steps of du
xn = xi*ones(1,length(mu)); % allocate space
under = {xn < 0.5};
over = {xn >= 0.5};
% Create figure for the plots
figure(4);
clf;
title('Tent Map');
xlabel('\mu');
ylabel('X_n');
hold on
% iterate through first 1000 iterations at various mu values

for i=1:1000
    xn(xn < 0.5) = mu(xn < 0.5).*xn(xn < 0.5);
    xn(xn >= 0.5) = mu(xn >= 0.5).*(1-xn(xn >= 0.5));    
end
hold on
% Beginning from xn(1000)
% For 1000 iterations
for k=1:1000 
    % if x is less than 0.5
    xn(xn < 0.5) = mu(xn < 0.5).*xn(xn < 0.5);
    % If x is greater than or equal to 0.5
    xn(xn >= 0.5) = mu(xn >= 0.5).*(1-xn(xn >= 0.5));
    % plot the points
    plot(mu,xn,'b.')
end
end