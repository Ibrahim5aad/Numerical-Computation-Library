function [eigvals, eigvecs, nit] = hoteldef(A, etol, maxit)
  % This function calculates the eigenvalues and the corresponding
  % eigenvectors for a symmetric matrix by the power iteration method. After
  % the getting the maximum eigenvalue and the corresponding eigenvector
  % the matrix is being deflated; deflation means modifying the matrix to 
  % eliminate the influence of a given eigenvector, typically by setting
  % the associated eigenvalue to zero
  %
  % INPUTS:
  %     A = the matrix in question
  %     etol = the error tollerance
  %     maxit = the maximum number of iteration
  % OUTPUTS:
  %     eigvals = a digonal matrix where the diagonal is the eigenvalues
  %     eigvecs = the eigenvectors matrix; its columns is the eigenvectors
  
   n = size(A)(1);
   eigvals = zeros(n,n);
   eigvecs = zeros(n,n);
   nit = zeros(1,n);
   for i=n:-1:1
     [eigvals(i,i), eigvecs(:,i), nit(i)] = powerit(A, etol, maxit);
     A = A - eigvals(i,i)*(eigvecs(:,i)*eigvecs(:,i)');
   end
end

