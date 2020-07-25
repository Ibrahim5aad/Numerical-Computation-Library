function [eigvals, nit] = luiter(A, etol, maxit)
  % This function calculates the eigenvalues of a given matrix
  % INPUT:
  %    A = the matrix 
  %    etol = the error tolerance
  %    maxit = max. no. of iterations
  % OUTPUT:
  %    eigvals = the eigenvalues of the matrix
  %    nit = actual no. of iterations
   
  nit = 0;
  while nit < maxit
    nit = nit + 1;
    tempdiag = diag(A);
    [L, U] = lu(A); %LU factorization
    A = U*L;
    if (norm((diag(A)-tempdiag), 2)) <= etol, break, end
  end
  eigvals = diag(A);
end

