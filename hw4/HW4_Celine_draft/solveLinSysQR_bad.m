function [x] = solveLinSysQR_bad(A,b)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n = length(A);
R = zeros(size(A));
y = zeros(size(b));
U = eye(n);
At = A;
for i = 1:n-1
    [u,beta] = ubeta(At);
    u = [zeros(i-1,1);u];
    P = eye(n) - beta*(u*u');
    A = P*A;
    At = A(i+1:end,i+1:end);
    U = P*U;
end
R = U*A;
x = solve_upper_triangular_system(R,y );
end
