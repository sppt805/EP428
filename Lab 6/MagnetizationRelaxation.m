% This function uses the relaxation method to find the magnetization of a
% ferromagnetic material at various T and c values.
% T - Temperature in Kelvin
% c - constant j/k_b ratio
% target - Target accuracy of our Magnetization solution
function [m,n] = MagnetizationRelaxation(T,c,target)

n = 0; % iteration number
mu = 700; % constant magnetic moment
m_next = 1000; % inital guess value magnetization

error = 1000;

% Run to get within target error
while error > target
    m1 = m_next;
    m_next = mu*tanh(c*m1/T);
    
    f = (mu*tanh(c*m1/T) - mu*tanh(c*m_next/T))/(m1 - m_next);
    error = abs((m1 - m_next)/(1-1/f));
    n = n+1;
end

m = m_next;

end
