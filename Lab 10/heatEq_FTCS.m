function m = heatEq_FTCS(t,r,a)

T = 800;
L = 10;

n = length(r)/2;
phi = r(1:n);
psi = r(n+1:end);

m = zeros(n*2,1);
m(1) = 0;
m(end) = 0;
m(2:n-1) = psi(2:n-1);
m(n+2:end-1) = a * (phi(3:end) + phi(1:end-2) - 2*(phi(2:end-1)));

end