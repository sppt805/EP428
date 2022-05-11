%% Quesiton 3
function ka = nonLinearODE(t, r)
% initial Conditions
k = 1;
x = r(1);
v = r(2);
% Given coupled ODE relation
kx=v;
kv=(1/t*v)-(4*k*(t^2)*x);

ka = [kx;kv];
end
