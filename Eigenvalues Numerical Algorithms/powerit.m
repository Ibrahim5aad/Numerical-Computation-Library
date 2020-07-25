function [eigval, x, nit] = powerit(A, etol, maxit)
  %this function calculates the max eigenvalue of a given matrix
  % INPUTS:
  %     A = the matrix
  %     etol = the error tolerance
  %     maxit = maximum number of iterations
  % OUTPUTS:
  %     eigval = the maximum eigenvalue
  %     x = the corresponding eigenvector
  %     nit = actual no. of iterations
  
  n = size(A)(1);
  x = ones(n,1);
  b = A*x;
  eigval = norm(b, 2);
  nit = 0;
  while nit < maxit
    nit = nit + 1;
    x = (1/eigval)*b;
    b = A*x;
    eigvalnew = norm(b, 2);
    %fprintf('n = %d, lamda = %g, x = %g %g %g\n', nit, eigval, x');
    if abs((eigvalnew - eigval)/eigvalnew) <= etol, break, end
    eigval = eigvalnew; 
  end
end
