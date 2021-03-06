% A7Q6

E0 = [3000, 15000, 33000, 60000];
E = zeros(length(E0));
hbar = 6.582E-16; % eV
L = 1E-11; % m
dL = L/1000;
m = 0.511E6/(3E8)^2; % eV
x0 = [0,1];

for i = 1:4
    E(i) = NewtonRaphsonMultivar(@PotentialWellBoundary,E0(i),1E-4);
end
for i = 1:4
    [x,r] = RungeKutta4_v2(@SchrodingerEq_v2,x0,E(i),0,L,dL);
    r_norm = 1./trapz(1,abs(r(1,:).^2));
    r = r_norm.*abs(r(1,:).^2);

    figure(i);
    hold on
    title('Square Wavefunction for Energy Level', num2str(i));
    xlabel('Well Position, x [m]');
    ylabel('Square WaveFunction, |\Psi(x)|^2')
    plot(x,r(1,:));
end

E1 = pi()^2*hbar^2/(2*m*L^2);
E2 = 2^2*pi()^2*hbar^2/(2*m*L^2);
E3 = 3^2*pi()^2*hbar^2/(2*m*L^2);
E4 = 4^2*pi()^2*hbar^2/(2*m*L^2);

disp(['Energy Numeric 1: ', num2str(E1)]);
disp(['Energy Numeric 2: ', num2str(E2)]);
disp(['Energy Numeric 3: ', num2str(E3)]);
disp(['Energy Numeric 4: ', num2str(E4)]);

