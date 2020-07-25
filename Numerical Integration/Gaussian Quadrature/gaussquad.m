function [integral, k] = gaussquad(fn, x0, x1, pts)
  % This function calculates the Gauss Numerical Integration
  % for finite integrals 
  % INPUTS:
  %     fn = the function in question
  %     x0, x1 = the interval of the integration
  %     pts = the number of points
  % OUTPUTS:
  %     integral
  %     k = number of iterations needed to adapt
  integral = 1;
  lastintegral = 0;
  n = pts;
  [xg, c] = gausswt(n);
  k = 0;
  while abs(lastintegral - integral) > 10^-5;
    k = k+1;
    integral = lastintegral;
    lastintegral =0;
    x = linspace(x0,x1,n);
    for k = 1:pts-1:n-1
      if pts == 2,
        xm = (x(k)+x(k+1))/2;
        h = (x(k+1)-x(k));
      else
        xm = x(k+1);
        h = (x(k+2)-x(k));
      end
      lastintegral = lastintegral + (c(1)*fn(xm+(h*xg(1)/2))*(h/2) 
                                  + c(2)*fn(xm+(h*xg(2))/2)*(h/2) 
                                  + c(3)*fn(xm+(h*xg(3))/2)*(h/2));
    end
    n = n+pts-1;
   end
end

