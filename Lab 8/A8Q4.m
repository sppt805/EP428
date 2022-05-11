% Q4b and c
L = 0.5E-9; % m
m = 0.511E6/(3E8)^2; % eV
a = 10; % eV
hbar = 6.582E-16; % eV
dx = L/1000;
x = 0:dx:L;

% 10 masses
H = Hamiltonian(10);
[V,D] = Diagonalize(H,1E-8);
% 100 masses
H2 = Hamiltonian(100);
[V2,D2] = Diagonalize(H2,1E-8);

psi0 = zeros(1,length(x));
psi1 = zeros(1,length(x));
psi2 = zeros(1,length(x));
psi3 = zeros(1,length(x));

for i = 1:length(H2)
   psi0 = psi0 + V2(i,1)*sin(i*pi*x/L);
   psi1 = psi1 + V2(i,2)*sin(i*pi*x/L); 
   psi2 = psi2 + V2(i,3)*sin(i*pi*x/L); 
   psi3 = psi3 + V2(i,4)*sin(i*pi*x/L); 
end

figure(1)
hold on
title('Wave Function of Ground State and First 3 Energy Levels');
xlabel('Distance, m');
ylabel('\Psi(x)');
plot(x,psi0);


% title('First Energy Level');
% xlabel('Distance, m');
% ylabel('\Psi_{1}(x)');
plot(x,psi1);


% figure(3)
% hold on
% title('Second Energy Level');
% xlabel('Distance, m');
% ylabel('\Psi_{2}(x)');
plot(x,psi2);

% figure(4)
% hold on
% title('Third Energy Level');
% xlabel('Distance, m');
% ylabel('\Psi_{3}(x)');
plot(x,psi3);

legend('\Psi_{0}(x)', '\Psi_{1}(x)', '\Psi_{2}(x)', '\Psi_{3}(x)');