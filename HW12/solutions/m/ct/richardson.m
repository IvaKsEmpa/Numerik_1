function [x,err,it] = richardson(A,b,omega, x0)
%richardson Solves the system Ax=b iteratively with the Richardson method
%with starting vector x0

n = length(b);

xex = A\b;

tol = 10^(-6);
it = 0;
N = omega*eye(n);
x = x0;
err = norm(A*x-b);
while err(end) > tol && it < 1000
    it = it+1;
    x = x-N*(A*x-b);
    err = [err,norm(x-xex)]; %[err,norm(A*x-b)];
end


if it >= 1000
   error('Richardson iteration does not converge (reachted maximal iteration of 1000)') 
   x = nan;
end
end

