function [eigval, x, nit] = inverseit(A, etol,  maxit) 
  % This function calculates the minimum eigen value and its
  % corresponding eigenvector by the inverse power iteration
  % algorithm
  % INPUTS:
  %     A = the matrix
  %     etol = error tolerance
  %     maxit = maximum number of iterations
  % OUTPUTS:
  %     eigval = the minimum eigenvalue
  %     x = the corrsponding eigenvector 
  %     nit = the actual number of iterations
 
  n = size(A)(1);
  x=ones(n,1);
  b=A\x;
  eigval=norm(b, 2);
  nit = 0;
  while nit < maxit
    nit = nit + 1;
    x = (1/eigval)*b;
    b = A\x;
    eigvalnew = norm(b, 2);
    if abs((eigvalnew - eigval)/eigvalnew) <= etol, break, end
    eigval = eigvalnew;
   end
   eigval = 1/eigval;
end

