function heatEq2(t0,tf,dt)
n = 100;
L = 0.01; % cm
t = t0:dt:tf;
phi = zeros(n+1,n+1);

alpha = 4.26E-6; % part a) cm^2/s
% alpha = 1.11; % part b) cm^2/s

a = L/n;

% Set initial Condition for BC
phi(1,:) = 800;
phi(:,1) = 800;
phi(end,:) = 800;
phi(:,end) = 800;

phi(2:n,2:n) = 298.15;

psi = phi;

figure(1);
clf
im = imagesc(phi);
colorbar
caxis([298, 800]);
drawnow

for tt = 1:length(t)-1
    for i = 2:n
        for j = 2:n
            psi(i,j) = phi(i,j) + (dt*alpha/(a^2))*(phi(i+1,j) + phi(i-1,j) + phi(i,j+1) + phi(i,j-1) - 4*phi(i,j));
        end
    end
    [psi,phi] = deal(phi,psi);
    im.CData = phi;
    drawnow limitrate;
end

end