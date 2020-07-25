function [eigval, x, nit] = powershift(A, shift, etol, maxit)
  %this function calculates the min eigenvalue of a given matrix
  % INPUTS:
  %     A = the matrix
  %     shift = the value of the shift
  %             (should be greater than the max eigenvalue 
  %              to properly get the minimum)
  %     etol = the error tolerance
  %     maxit = max number of iterations
  % OUTPUTS:
  %     eigval = the minimum eigenvalue
  %     x = the corresponding eigenvector
  %     nit = actual no. of iterations
  
  n = size(A)(1);
  shiftedA = (A - shift*eye(n));
  [eigval, x, nit] = powerit(shiftedA, etol, maxit);
  eigval = shift - eigval;
end
