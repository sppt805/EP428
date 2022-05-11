%% Square Matrix
A = [1 2 1; 2 3 2; 1 2 1];

[U,S,V] = SingularValueDecomp(A);

Arecon = SVDReconstruct(U,S,V,3);
[m,n] = size(A);
for i = 1:length(m)
    for j = 1:length(n)
        if(abs((A(i,j)-Arecon(i,j))) > 1E-8)
           disp('Matrices not Equal'); 
        end
    end
end
%% More rows than columns
A = [2 4;1 3;0 0;0 0];
[U,S,V] = SingularValueDecomp(A);

Arecon = SVDReconstruct(U,S,V,2);
[m,n] = size(A);
for i = 1:length(m)
    for j = 1:length(n)
        if(abs((A(i,j)-Arecon(i,j))) > 1E-8)
           disp('Matrices not Equal'); 
        end
    end
end
%% More columns than rows
A = [2 4 1;1 3 7];
[U,S,V] = SingularValueDecomp(A);

Arecon = SVDReconstruct(U,S,V,2);
[m,n] = size(A);
for i = 1:length(m)
    for j = 1:length(n)
        if(abs((A(i,j)-Arecon(i,j))) > 1E-8)
           disp('Matrices not Equal'); 
        end
    end
end