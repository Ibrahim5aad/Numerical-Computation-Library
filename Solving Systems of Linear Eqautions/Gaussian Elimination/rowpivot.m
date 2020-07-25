function [Aug] = rowpivot(Aug,k,n)
% This function performs partial pivoting (row exchange)
% starting from kth row to n
% INPUT:
%    Aug = the agumented matrix of A and b
%    k = the index of the element to be checked for pivoting
%    n = the number of rows
% OUTPUT:
%    Aug = The augmented matrix after the row exchange
  s = Aug(:,k);
  s(1:(k-1)) = 0;
% find the maximum value in the column under the current 
% checked element and its row position
  [smax, index] = max(abs(s));
  if index > 1
    tempAugRow = Aug(k,:); 
    Aug(k,:) = Aug(index,:);
    Aug(index,:) = tempAugRow;
  end
end

