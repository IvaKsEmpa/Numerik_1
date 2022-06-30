function [x] = solveLinSysQR(A,b)
%solveLinSysQR This functions solves the system Ax=b with the use of the
%   QR-decompositions
%   Input: nxn matrix A, nx1 vector b
%   Output: Solution of the system Ax=b

n = length(A);
R = zeros(size(A));     %setting up the matrix R
y = zeros(size(b));     %setting up the vector Q*b

for i = 1:n-1
    [u,beta] = ubeta(A);
    PA = A - beta*u*(u'*A);
    Pb = b - beta*u*(u'*b);%We also need to compute Q*b iteratively
    R(i,i:end) = PA(1,:);  %Save entries of PA which will stay unchanged
    A = PA(2:end,2:end);   %tilde(A)^i)matrix of size (n-i)x(n-i) (page 33, last formula)
    y(i) = Pb(1);          %updating the vector y= Q*b
    b= Pb(2:end);          %tilde(b) vector of size (n-i)x1
end
R(n,n) = PA(end,end);      %iteration stops at n-1 -> need to update R and y
y(n) = Pb(end);

x = solve_upper_triangular_system(R,y); %solve system Rx=y
end
