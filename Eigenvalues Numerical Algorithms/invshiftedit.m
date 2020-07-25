function [eigval, x, nit] = invshiftedit(A, shift, etol,  maxit) 
  % This function calculates the eigenvalues and the corresponding  
  % eigenvectors by the shifted inverse power algorithm, given a
  % shift value the function will converge to the nearest eigenvalue.
  %     INPUTS:
  %         A = the given matrix
  %         shift = an istimated shifting value
  %         etol = error tolerance
  %         maxit = maximum number of iterations
  %     OUTPUTS:
  %         eigval = the nearest eigenvalue to the given shift
  %         x = the corresponding eigenvectors
  %         nit = actual number of iterations
  n = size(A)(1);
  shiftedA = A - shift*eye(n);
  [eigval, x, nit] = inverseit(shiftedA, etol, maxit);
  if(shift > eigval) eigval = shift - eigval;
  else eigval = shift + eigval; end
end

