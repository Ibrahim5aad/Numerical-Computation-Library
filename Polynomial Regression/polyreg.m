function [a, rcorr, syR] = polyreg(x, y , order)
  % This function calculates the the best fit polynomial
  % of a given order with a set of (x, y) pairs of data
  % INPUTS:
  %     x = an array of x values
  %     y = an array of y values
  %     order = the order of the fitting polynomial
  % OUTPUTS:
  %     a = polynomial coeffs
  %     rcorr = correlation coefficient
  %     syR = standard deviation about the best fit
  n = length(x);
  ymean = sum(y)/n;
  diff = (y - ymean);
  D = sum(diff.^2);
  mat = zeros(order+1,order+1);
  rhs = zeros(order+1,1); 
  mat(1,1) = n;
  for k = 1:order+1
    rhs(k) = sum(y.*x.^(k-1));
    for j = 1:order+1
      mat(k, j) = sum(x.^(k-1).*x.^(j-1));
    end
  end
  a = mat\rhs;
  yreg = zeros(1, n);
  for i = 1:order+1
    yreg = yreg + a(i)*x.^(i-1);
  end
  err = y-yreg;
  E = sum(err.^2);
  rcorr = sqrt((D-E)/D);
  syR = sqrt(E/(n-3));
  plot(x, y, 'r*',x,yreg,':');
end