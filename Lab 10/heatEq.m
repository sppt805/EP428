function heatEq(t0,tf,dt)
n = 100;
L = 0.1; % m
T0 = zeros(n+1,n+1);
t = t0:dt:tf;
% alpha = 4.26E-6; % m^2/s
alpha = 1.11E-4;

a = L/n;

% Set Boundary Conditions
T0(1,:) = 800;
T0(:,1) = 800;
T0(end,:) = 800;
T0(:,end) = 800;
% Metal Plate with room temperature at 25C
T0(2:n,2:n) = 298.15;
T = T0;

figure(1);
clf
im = imagesc(T0);
colorbar
caxis([298, 800]);
drawnow limitrate;

for tt = t0:dt:tf
    for i = 2:n
        for j = 2:n
            % use find_alpha for obtaining linear temperature dependent
            % diffusive rate
            T(i,j) = T0(i,j) + (dt*find_alpha(T0(i,j))/(a^2))*(T0(i+1,j) + T0(i-1,j) + T0(i,j+1) + T0(i,j-1) - 4*T0(i,j));
            
        end
    end
    
    [T,T0] = deal(T0,T);

    im.CData = T0;
    drawnow limitrate;
    title('Time: ',tt);
end
im.CData = T0;
drawnow limitrate;
title('Time: ',tt);
end