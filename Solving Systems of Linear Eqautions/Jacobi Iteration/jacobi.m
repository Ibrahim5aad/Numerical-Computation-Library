function [x, nit] = jacobi(A, b, etol, imax)
  % Jacobi method is an iterative algorithm for determining the
  % solutions of a diagonally dominant system of linear equations.
  xold = b./diag(A);
  xnew = zeros(size(b)(2),1);
  for i=1:imax
     for k=1:size(b)(2)
        a = A(k,:);
        a(k) = [];
        xa = xold;
        xa(k) = [];
        sum = a*xa;
        xnew(k) = (b(k) - sum)/diag(A)(k);
      end
  if max(abs(xnew - xold)) < etol; break; end
  xold = xnew;
  end
  x = xnew;
  nit = i;
end