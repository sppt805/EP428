% A7Q7

E0 = [200, 500, 800, 1100];
E = zeros(length(E0));
V0 = 50; % eV
hbar = 6.582E-16; % eV
L = 1E-11; % m
dL = L/1000;
m = 0.511E6/(3E8)^2; % eV
x0 = [0,1];

for i = 1:4
    E(i) = NewtonRaphsonMultivar(@PotentialWellBoundary_bonus,E0(i),1E-6);
end
for i = 1:4
    [x,r] = RungeKutta4_v3(@SchrodingerEq_v3,x0,E(i),V0,0,L,dL);
    %Normalize
    r_norm = 1./trapz(1,abs(r(1,:).^2));
    r = r_norm.*abs(r(1,:).^2);

    figure(i);
    plot(x,r(1,:));
end

E1 = hbar/L*sqrt(2*V0/m)*1+1/2;
E2 = hbar/L*sqrt(2*V0/m)*2+1/2;
E3 = hbar/L*sqrt(2*V0/m)*3+1/2;
E4 = hbar/L*sqrt(2*V0/m)*4+1/2;

disp(['Energy Numeric 1: ', num2str(E1)]);
disp(['Energy Numeric 2: ', num2str(E2)]);
disp(['Energy Numeric 3: ', num2str(E3)]);
disp(['Energy Numeric 4: ', num2str(E4)]);
