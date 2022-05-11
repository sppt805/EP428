% This function takes a given time and solution and
% returns the slope of a First Order ODE
function k = FirstODE(t, r)
    kx = r(1)*r(2) - r(1);
    ky = -r(1)*r(2) + sin(2*t);
    k = cell2mat({kx;ky}); % Array of slopes for two-dimensions
end