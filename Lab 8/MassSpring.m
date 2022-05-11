% This function performs the arrangment of a spring mass system
% given mass (m), spring constant (k), and number of masses (n)
function A = MassSpring(m,k,n)

A = zeros(n,n);

for i = 1:n
    A(i,i) = -2*k/m; % diagonal elements
    if i == 1
        A(i,i+1) = k/m; % off upper diagonal elements
    elseif i == n 
        A(i,i-1) = k/m; % end of matrix
    else
        A(i,i+1) = k/m; % set both upper and lower off diag elements
        A(i,i-1) = k/m;
    end
end

end