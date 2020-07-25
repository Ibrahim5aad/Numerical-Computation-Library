function [Aug] = sweep(Aug,k,n)
% This function performs one sweep of forward
% elimination considering pivot row k to n
% INPUT:
%     Aug = The augmented matrix of A and b
%     k = pivot index
%     n = no. of rows 
% OUTPUT:
%     Aug = The augmented matrix after forward elimination
  pivot = Aug(k,k);
  for j = k+1 : n
    factor = Aug(j,k)/pivot;
    Aug(j,k:n+1)= Aug(j,k:n+1)- Aug(k,k:n+1)*factor;
  end
end

