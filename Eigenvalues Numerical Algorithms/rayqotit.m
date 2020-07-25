function [eigval, x, nit] = rayqotit(A, xinit, etol, maxit) 
  % This function calculates the eigen vectors of a 
  % Given matrix by Rayleigh Quotient iteration, given
  % an initial vector it converges to the closest eigenvetor
  % INPUTS:
  %     A = the given matrix
  %     xinit = inital vector
  %     etol = error tolerance
  %     maxit = maximum number if iterations
  % OUTPUTS:
  %     x = the closest eigenvetor to the initial vector
  %     eigval = the correspondeing eigen value
  %     nit = actual number of iterations

	n = size(A)(1);
  eigval = 0;
  nit = 0;
  x = xinit;
  while nit < maxit
   nit = nit + 1;
   eigvalnew = (x'*A*x)/(x'*x);
   b = (A - eigvalnew*eye(n))\x;
   x = (1/eigvalnew)*b;
   %fprintf('n = %4d, lamda = %g, x = %g %g %g\n', nit, eigval, x');
   if abs((eigvalnew - eigval)/eigvalnew) <= etol, break, end
   eigval = eigvalnew;
  end;
end;

