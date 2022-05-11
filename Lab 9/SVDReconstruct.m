% this function reconstructs matrix A
function [A] = SVDReconstruct(U,S,V, numterms)

A = U(:,1:numterms)*S(1:numterms,1:numterms)*V(:,1:numterms)';

end