% Diagonalization
% This function uses QR gram-schmidt decomposition
% to return the eigenvalues and corresponding eigenvectors
% of given matrix A, to a desired accuracy
function [V,D] = Diagonalize(A,target)

V = zeros(length(A),length(A));
V = eye(length(A),length(A));

D = zeros(length(A));
err = target+1;

while err > target
    [Q,R] = QRDecomposition(A);
    A = R*Q;
    V = V*Q;
    % Get diagonals of A
    diagonal = A(logical(eye(length(A),length(A))));
    % Get off elements of A
    off_elem = A(~eye(length(A),length(A)));
    
    err = max(abs(off_elem))/max(abs(diagonal));
end
% Normalize D, while keeping order with V
D = A(logical(eye(length(A),length(A))));
[D,I] = sort(D);
V = V(:,I);

end