function sol = CrystalSolid(t,r)
n = floor(length(r)/2); % Number of masses
m = 1; % mass kg
k = 1; % spring constant
% Assume r is in form (x0,...,xn,v0,...,vn)
sol = zeros(1,length(r));
% r = r';
% First Order Values - Velocities
sol(1:n) = r(n+1:end);
% Second Order Values - Accelerations
sol(n+1) = (k*(r(2)-r(1)) - k*r(1))/m; % First Element
% sol(end) = (k*(r(n-1) - r(n)) - k*r(n))/m; % Last Element
% Iterative middle elements
sol(n+2:end-1) = (k*(r(3:n) - r(2:n-1)) + k*(r(1:n-2) - r(2:n-1)))/m;
% sol = sol/m;
sol(end) = (k*(r(n-1) - r(n)) - k*r(n))/m; % Last Element

end