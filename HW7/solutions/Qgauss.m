function [QG] = Qgauss(n,f)
%QGauss Gauss quadrature of f on n subintervals of [-1,1]
%   input f should be already evaluated at the nodes of the 3-point
%   Gauss-quadrature on each subinterval.
w = repmat([5/9,8/9,5/9],1,n);
f = reshape(f,3*n,1);
QG = w*f/(n);
end

