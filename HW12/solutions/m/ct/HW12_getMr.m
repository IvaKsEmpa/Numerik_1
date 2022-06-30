function [M,r] = HW12_getMr(n)
% retrun M and r
% r(i+n*j) corresponds to r(i,j)
h = 1/(n+1);
points=linspace(0,1,n+2);
g=@(x,y) sin(pi.*x).*cos(pi.*y);
f=@(x,y) 2*pi^2.*g(x,y);

M=4*eye(n)-diag(ones(n-1,1),-1)-diag(ones(n-1,1),1);
M=kron(eye(n),M);
M=M-diag(ones(n^2-n,1),-n)-diag(ones(n^2-n,1),n);
M=M/(h^2);

r=f(points(2:end-1)',points(2:end-1));
r(1:n,1)=r(1:n,1) + g(points(2:n+1)',points(1))/(h^2);
r(1:n,n)=r(1:n,n) + g(points(2:n+1)',points(end))/(h^2);
r(1,1:n)=r(1,1:n) + g(points(1),points(2:n+1))/(h^2);
r(n,1:n)=r(n,1:n) + g(points(end),points(2:n+1))/(h^2);
r=reshape(r',n^2,1);
end

