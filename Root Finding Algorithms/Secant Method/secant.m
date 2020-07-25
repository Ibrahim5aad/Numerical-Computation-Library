function [xr,nit]= secant(func,x1,x2,kmax,etol)
% Secant method to find root of function using
% two starting points
% INPUTS:
%     func = the function in question
%     x1, x2 = two starting points
%     Convergence Criteria:
%       kmax = max no. of iterations
%       etol = error tolerance
% OUTPUTS:
%     xr = the root
%     nit = no. of iterations done to reach that root
  nit = 0;
  for k = 1:kmax
    nit = nit +1;
    f1 = func(x1);
    f2 = func(x2);
    vsec = (f2 - f1) / (x2 - x1);
    if (abs(vsec) <= 10^(-15)),error('Secant Slope = Zero');end
    xnew = x1 - f1/vsec;
    fnew = func(xnew);
    if abs(fnew) <= etol
      xr = xnew;
      break
    end
    x1 = x2;
    x2 = xnew;
  end
end

