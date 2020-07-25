function [roots, nit] = eigval(C, etol, maxit)
% This function finds the roots of a polynomial
% by finding the eigenvalues of its companion matrix
% with the QR method
% INPUT: 
%     A = The companion matrix of the polynomial
%     etol = the error tolerance of the lower part of C
%     maxit = max no. of iterations
% OUTPUT:
%     roots = the roots of the polynomial
%     nit = no. of iterations

  [Q, R] = qr(C); %QR factorization:
                  % Q is an orthogonal matrix
                  % R is an upper triangular matrix
  nit = 0;
  while nit < maxit 
    C = R*Q;
    [Q, R] = qr(C);
    nit = nit + 1;
    if max(abs(tril(C, -1))) <= etol, break, end
      % tril(X, k) returns the elements on and below the kth diagonal
      % of X. k = 0 is the main diagonal, k > 0 is above the 
      % main diagonal, and k < 0 is below the main diagonal.
  end
  roots = diag(C);
end

