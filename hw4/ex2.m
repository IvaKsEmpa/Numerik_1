clc; clear all; close all;

n = 100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = n*eye(n);
for j = 1:n
    for i = 1:n
        if i~=j
            A(i,j) = exp(-abs(i-j)/n);
        end % if-flow
    end % i-for-loop
end % j-for-loop

b = zeros(n,1);
b(1:2:n) = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[Q,R] = QR(A);

err = abs(A-Q*R);
err = max(max(err));
fprintf(['The residual of A-Q*R is ', num2str(err), '.\n']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = lsolverQR(A,b);

err = norm(A*x-b,Inf);
fprintf(['The residual of A*x-b is ', num2str(err), '.\n']);
