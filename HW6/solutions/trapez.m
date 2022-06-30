function [ QT ] = trapez( x, f )
%composed trapezoidal rule [x(1),...,x(m+1)]
%INPUT: nodes x, f at nodes of same length. 
%OUTPUT: QT quadrature.
if length(x) ~= length(f)
   error('input vectors should be of same length') 
end
m = length(x);
f = reshape(f, m,1); % making sure f is a mx1 vector
x= reshape(x,1,m);   % x is a 1xm vector
QT= (x(2:end)-x(1:m-1))*(f(2:end)+f(1:m-1))/2;
end

