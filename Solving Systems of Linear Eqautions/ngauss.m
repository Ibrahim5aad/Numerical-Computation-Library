function [x] = ngauss(A,b)
% This function solves [A]{x}={b} using Gauss
% elimination method with no pivoting
  [nr, nc] = size(A);
  If nr ?= nc, error(‘Matrix NOT Square’),end
  Au = A;
  bu = b;
  x = zeros(nr,1);
  tol = 0.5*10^(2-7); %7 significant digits
  for k = 1:(nr-1) %loop for forward elimination
    If abs(Au(k,k)) < tol, error(‘zero pivot’),end
    [Au,bu] = sweep(Au,bu,k,nr); %kth sweep
  end
  x = bksub(Au,bu) %back substitution
end