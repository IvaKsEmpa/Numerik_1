function [x] = solveLinSysQR(A,b)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n = length(A);
R = zeros(size(A));
y = zeros(size(b));
for i = 1:n
    [u,beta] = ubeta(A);
    PA = A - beta*u*(u'*A);
    Pb = b - beta*u*(u'*b);
    R(i,i:end) = PA(1,:);
    A = PA(2:end,2:end);
    y(i) = Pb(1);
    b= Pb(2:end);
end
x = solve_upper_triangular_system(R,y );
end
