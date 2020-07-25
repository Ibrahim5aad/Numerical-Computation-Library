function[I, nit]=romberg(func,a,b,etol,maxit)
% Romberg integrates function 'func' of 
% one variable within a given interval
% INPUTS:
%     func = the function whose integration is desired
%     a, b = the interval of integration
%     etol = error tolerance
%     maxit = maximum number of ierations
% OUTPUTS:
%     I = the integral of the function within the interval
%     nit = actual number of iterations

  Iprev =	0;
  R(1) = ((b-a)/2)*(func(a)+func(b));
  nit = 1;
  while(nit < maxit)
      R(nit+1) = trapz(func,a,b,nit+1,R(nit));
      for j=nit:-1:1
          p =	4^(nit-j+1);
          R(j) = (p*R(j+1)-R(j))/(p-1);
      end
      if abs(R(1)-Iprev) <= etol*abs(Iprev); break; end
      Iprev = R(1);
      nit =	nit+1;
  end
  I = R(1);
end

