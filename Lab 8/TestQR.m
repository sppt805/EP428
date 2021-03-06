A = [1, 4, 8, 4;
     4, 2, 3, 7;
     8, 3, 6, 9;
     4, 7, 9, 2];
 
 [Q,R] = QRDecomposition(A);
 % Check if Q*R returns the input matrix A
 A2 = Q*R;
 % Check
 Q_transpose = Q';
 Q_identity = Q'*Q;
 
 
 % Compare with matlab qr decomposition
 [Q2,R2] = qr(A);
 A3 = Q2*R2;