function [u, beta] = ubeta(A)
%ubeta Computes u, beta from ...

u = A(:,1);
beta = 1/(norm(u)*(abs(u(1))+norm(u)));
if abs(u(1))>0
    u(1) = u(1) + u(1)/abs(u(1))*norm(u);
else
    u(1) = u(1) -norm(u);
end

