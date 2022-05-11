function alpha = find_alpha(T)
alpha0 = 1.11E-4;
alpha_800 = alpha0/2;

T0 = 298;
Tf = 800;

alpha = (alpha_800 - alpha0)/(Tf-T0)*(T-T0) + alpha0;
end