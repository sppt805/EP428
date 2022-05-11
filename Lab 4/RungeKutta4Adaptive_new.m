function [t,r] = RungeKutta4Adaptive_new(f,r0,t0,tf,target)
dt = (tf - t0)/1e4;

n = 10000;
t = zeros(n);
% dt_array = zeros(n);
m = length(r0);
r = zeros(m,n);
r(:, 1) = r0;
t(1) = t0;
% dt_array[0] = dt;

i = 1;
while t(i) < tf
    % 2 step of dt
    k = rk4Slope(f, t(i), r(:, i), dt);
    
    r1 = r(:, i) + k * dt;
    r1 = r1 + rk4Slope(f, t(i) + dt, r1, dt) * dt;

    % 1 step of 2dt
    r2 = r(:, i) + rk4Slope(f, t(i), r(:, i), 2*dt) * 2*dt;
    % calculate accuracy based on x(r[0])
    e_step = abs(r1(1) - r2(1))/30;
    e_target = target * dt;
    rho = e_target/e_step;

    % check if error is less than target error

    if rho > 1  % error per step < target error
        r(:, i + 1) = r(:, i) + k * dt;
        t(i + 1) = t(i) + dt;
%         dt_array(i + 1) = dt;
        dt = 2*dt;
        i = i + 1;
    else  % error per step > target error
        dt = dt*(rho^(1/4));
        r1 = r(:, i) + k * dt;
        r(:, i + 1) = r(:, i) + rk4Slope(f, t(i) + dt, r1, dt) * dt;
        t(i + 1) = t(i) + dt;
%         dt_array[i+1] = dt;
    end
    i = i +1;
end
    % check array size.
%     if i > r.shape[1] - 2:
%         r.resize((r.shape[0], 2*r.shape[1]), refcheck=False)
%         t.resize(r.shape[1], refcheck=False)
%         dt_array.resize(r.shape[1], refcheck=False)

end