function [x, c] = gausswt(n)
  % this function is used to return the weights and arguments
  % of gauss quadrature given the number of points "n"
  %   INPUTS:
  %       n = number of points
  %   OUTPUTS:
  %       x = gauss arguments
  %       c = weighting factors
  
  if n == 2
    x = [-0.577350269, 0.577350269, 0];
    c = [1, 1, 0];
  end
  if n == 3
    x = [-0.774596669, 0, 0.774596669];
    c = [0.5555556,0.8888889, 0.5555556];
  end
end
