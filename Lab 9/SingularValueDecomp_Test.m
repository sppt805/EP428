 
function [U,S,V] = SingularValueDecomp_Test(A)

[m,n] = size(A);

U = zeros(m,m);
S = zeros(m,n);
V = zeros(n,n);
% Get eigenvalues and eigenvectors
[V,D] = eig(A'*A);
S = (sqrt(abs(D)));

% sort in descending order
[S_sort, ind] = sort(diag(S),'descend');
S = S_sort.*eye(n,n);
V = V(:,ind);

for i = 1:m
    U(:,i) = (1/(S(i,i)))*A*V(:,i);
end
S = S(1:m,1:n);
end