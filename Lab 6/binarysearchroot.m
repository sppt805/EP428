% Question 2
% This function uses the binary search technique to find the root of a
% given function f
% x1 - lower bracket root estimate
% x2 - higher bracket root estimate
% target - Target accuracy of solution
function root = binarysearchroot(f,x1,x2,target)
% function f must be in form f(x) = 0

while abs(x1-x2) > target
    % There is a root between x1 and x2
    xp = 1/2 * (x1 + x2);
    % Check if estimate is valid solution (essentially zero)
    if f(xp) <= 0.001
        root = xp;
    else
        root = NaN;
    end
    % Change lower and higher bracket guesses to hone in on root
    if sign(f(xp)) == sign(f(x1)) 
        x1 = xp;
    else
        x2 = xp;
    end
end