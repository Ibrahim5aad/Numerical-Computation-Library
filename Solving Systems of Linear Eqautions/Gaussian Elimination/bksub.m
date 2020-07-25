function [x] = bksub(Aug)
% This function performs back substitution to solve
% upper triangular system of linear eqns represented 
% by the augmented matrix Aug = [A b]
% INPUT:
%    Aug = the agumented matrix of A and b
% OUTPUT:
%    x = the solution vector to the system
  n = rank(Aug);
  x = zeros(n,1);
  x(n)=Aug(n,n+1)/Aug(n,n);
  for k = (n-1):-1:1
    sum = Aug(k,k+1:n) * x(k+1:n);
    x(k) = (Aug(k, n+1)- sum)/Aug(k,k);
  end
end

