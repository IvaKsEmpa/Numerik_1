function [x] = solveLinSysQR_inefficient(A,b)
n = length(A);
y = zeros(size(b));
At = A;
y = b;
for i = 1:n-1
    [ut,beta] = ubeta(At);
    u = [zeros(i-1,1);ut];
    P = eye(n) - beta*(u*u');
    A = P*A;
    At = A(i+1:end,i+1:end);
    y = P*y;
end
x = solve_upper_triangular_system(A,y );
end
