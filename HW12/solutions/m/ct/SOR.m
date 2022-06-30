function [x,err,it] = SOR(A,b,omega, x0)
%SOR Solves the system Ax=b iteratively with the SOR method
%with starting vector x0

n = length(b);
xex = A\b;
tol = 10^(-6);
it = 0;
N = tril(A);
x = x0;
err = norm(A*x-b);
while err(end) > tol && it < 1000
    it = it+1;
    for k = 1:n
    x(k) = x(k)-omega*(A(k,1:k-1)*x(1:k-1)+A(k,k:n)*x(k:n)-b(k))/A(k,k);
    end
    %or
%     x = x-omega*N\(A*x-b);
    err = [err,norm(x-xex)]; %[err,norm(A*x-b)];
end
if it >= 1000
   error('SOR iteration does not converge (reachted maximal iteration of 1000)')
   x = nan;
end
end