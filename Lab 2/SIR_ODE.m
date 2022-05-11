function k = SIR_ODE(t, data)
% Population Size
n = 1E6;
% Disease Spread
beta = 10.0;
% Recovery Speed
gamma = 4.3;

ks = -beta/n*data(1)*data(2);
ki = beta/n*data(1)*data(2) - gamma*data(1);
kr = gamma*data(1);

k = cell2mat({ki;ks;kr});
end