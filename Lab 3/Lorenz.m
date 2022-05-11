% This function returns the solution to the Lorenz coupled ODE equations
function k = Lorenz(t, r_data)
% initial Conditions
sigma = 10;
r = 28;
b = 8/3;
% Given coupled ODE relation
kx=sigma*r_data(2)-sigma*r_data(1);
ky=r*r_data(1)-r_data(2)-r_data(1)*r_data(3);
kz=r_data(1)*r_data(2)-b*r_data(3);

k = cell2mat({kx;ky;kz});

end