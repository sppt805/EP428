% Question 4
function H = Hamiltonian(n)
H = zeros(n,n);
L = 0.5E-9; % m
m = 0.511E6/(3E8)^2; % eV
a = 10; % eV
hbar = 6.582E-16; % eV
%V = a*x/L;

for i = 1:n
   for j = 1:n
       if i == j
           H(i,j) = (2/L)*((hbar*(j)*pi)^2)/(4*m*L) + (2/L)*(a/L)*((L^2)/4);
       % m != n and m,n both even or both odd
       elseif (rem(i,2) == rem(j,2))
           H(i,j) = 0;
       else
           H(i,j) = (2/L)*(a/L)*-(2*L/pi)^2*(i*j)/(i^2-j^2)^2;
       end
   end
end

end