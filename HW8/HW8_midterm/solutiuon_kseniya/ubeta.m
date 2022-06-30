function [u, beta] = ubeta(A)
%ubeta Computes u, beta from formula (3.5) of the lecture notes for one
%	step of the QR-decomposition
%	Input: nxn matrix A
% 	Outpu: nx1 vector u, floatnumber beta 

u = A(:,1);
beta = 1/(norm(u)*(abs(u(1))+norm(u)));
if abs(u(1))> 1e-15
    u(1) = u(1) + u(1)/abs(u(1))*norm(u);
else
    u(1) = u(1) -norm(u);
end

end

