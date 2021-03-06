% Singular Value Decomposition
% This functio performs single value decomposition on an arbitrary sized
% matrix A, and returns:
% the orthonormal left singular vectors U
% the sorted diagonal matrix of singular values S
% the orthonormal right singular vectors V
function [U,S,V] = SingularValueDecomp(A)
[m,n] = size(A);

% initialize size of matrices according to svd
U = zeros(m,m);
S = zeros(m,n);
V = zeros(n,n);


% Get eigenvalues and eigenvectors
[V,D] = eig(A'*A);
% Get sigma values
D = (sqrt(abs(D)));

% sort sigmas in descending order
[D_sort, ind] = sort(diag(D),'descend');
% Re order V matrix corresponding to decreasing eigen values
V = V(:,ind);

% Depending on rectangular matrix size, choose the smaller dimension to
for i = 1:min(size(A))
    S(i,i) = D_sort(i);
end
% Choose smaller dimension as zeros will come after
for j = 1:min(size(A))
   U(:,j) = (1/(S(j,j)))*A*V(:,j);
end

end