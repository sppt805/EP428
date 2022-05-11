% A9Q1

A = [4 0;3 -5];

[U,S,V] = SingularValueDecomp(A);
Acomp = U*S*V';