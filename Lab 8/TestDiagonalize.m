% Test diagonalize

A = [1, 4, 8, 4;
     4, 2, 3, 7;
     8, 3, 6, 9;
     4, 7, 9, 2];
 
 [V,D] = Diagonalize(A,1E-3);
 
 [V2,D2] = eig(A);
 
 D = D.*eye(length(A),length(A));
 
 lhs = A*V;
 rhs = V*D;
 
 lhs2 = A*V2;
 rhs2 = V2*D2;