% This is a simulation representing a Zombie Apocolypse
function k = ZombieSim(t,data)
% Population Size
n = 1E6;
% Disease Spread
beta = 1.0;
% Zombie conversion
gamma = 4.0;
% Zombie kill factor
alpha = 0.2;

ks = -beta/n*data(1)*data(2); % Change of the Living
kz = ((beta-alpha)/n)*data(1)*data(2) + gamma*data(3); % Change of the Zombies
kr = (alpha/n)*data(1)*data(2) - gamma*data(3); % Change of the dead

k = cell2mat({ks;kz;kr});
end