function [Q, R] = QRDecomposition(A)

Q = zeros(length(A),length(A));
R = zeros(length(A),length(A));
U = zeros(length(A),length(A));
u = zeros(length(A),1);
q = zeros(length(A),1);

for i=1:length(A)
    u = A(:,i);
    for j = 1:i-1
        q = Q(:,j);
        u = u-dot(A(:,i),q)*q; 
    end
    U(:,i) = u;
    Q(:,i) = u/norm(u);
end

for i = 1:length(A)
    R(i,i) = norm(U(:,i));
    for j = 1:i
        R(j,i)=dot(A(:,i),Q(:,j));
    end
end

end