function [x] = pgauss(A,b,ipp)
% Solve system of linear eqns using Guass elimination
% with or without partial pivoting
% INPUT:
%   A = system matrix 
%   b = RHS vector
%   ipp = partial pivoting specifier
%         (ipp = 0 -> no pivoting)
%         (ipp > 0 -> with pivoting)
% OUTPUT:
%   x = solution vector to the system
  [rows, cols] = size(A);
  if rows ~= cols, error("The Matrix is not square"),end
  Aug = [A b];
  x = zeros(rows,1);
  tol = 0.5*10^(2-7);
  for k = 1:(rows-1) %loop for forward elimination
    if ipp > 0, [Aug] = rowpivot(Aug,k,rows); end
    if abs(Aug(k,k)) < tol, error("Zero Pivot"), end
    [Aug] = sweep(Aug,k,rows);
  end
  [x] = bksub(Aug);
end

