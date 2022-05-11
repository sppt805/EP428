% % % Question 3
n = 10;
m = 1;
k = 1;

A = MassSpring(m,k,n);

[V,D] = Diagonalize(A,1E-3);

[V2,D2] = eig(A);

el = n:-1:0;
omega_analytic = 2.*sin((el'.*pi)./(2.*(n+1)));

% test = V*(D.*eye(n,n))*V';
% D_test = V'*A*V;

omega_numeric = sqrt(-1.*D);

n = 100;
el = n:-1:0;
A2 = MassSpring(m,k,n);
[V3,D3] = Diagonalize(A2,1E-3);
omega_numeric2 = sqrt(-1.*D3);
omega_analytic2 = 2.*sin((el'.*pi)./(2.*(n+1)));
for i = 1:n
    if abs(omega_numeric2(i) - omega_analytic2(i)) > 1E-3
        disp([i,' 100 mass system freq is not within error']);
    end
end
