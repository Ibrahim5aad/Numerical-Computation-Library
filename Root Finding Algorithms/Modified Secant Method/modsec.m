function [x, nit] = modsec(f,x,delta,etol,maxit)
% This function finds the root of a function using
% The Modified Secant Method
% INPUT:
% f = function to find root to
% x = initial guess
% delta = perturbation fraction
% etol = error tolerance
% maxit = maximum number of iterations
%
% OUTPUT:
% root = approximation of the root of f
  nit = 0;
  while nit < maxit
   xold = x;
   x = x - delta*x*f(x)/(f(x+delta*x)-f(x));
   nit = nit + 1;
   if abs(x - xold) <= etol, break, end
  end
end

