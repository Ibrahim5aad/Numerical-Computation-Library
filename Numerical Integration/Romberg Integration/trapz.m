function[I]=trapz(func,a,b,n,Ip)
  I =	0;
  h =	(b-a)/(2^(n));
  for i=1:2^(n-1)
    I =	I+func(a+(2*i-1)*h);
  end
  I = 0.5*Ip+h*I;
end

