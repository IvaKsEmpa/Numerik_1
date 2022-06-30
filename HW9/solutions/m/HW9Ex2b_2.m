% HW 9 Ex 2b
% Computing the zeros of the Legendre Polynomials for 
% (.,.) = L2-scalar product on (-1,1) using the change of sign of the
% Sturm sequence

close all
clear
n = 10;
zero = 3;
[Ln, Lnarray] = legendre_polynomial(n);

x = find_zeros_Legendre(zero,Lnarray)

function [Ln, Lnarray] = legendre_polynomial(n)
% Computing the Legendre Polynomial for (.,.) = L2-scalar product on (-1,1)

Ln{1} = @(x) x;
Ln{2} = @(x) x.^2- 1/3;
Lnarray = @(x) [1,Ln{1}(x), Ln{2}(x)];
for k = 3:n
	lnm1 = Ln{k-1};    
	lnm2 = Ln{k-2};
    Ln{k} = @(x) x.*lnm1(x)- (k-1)^2/(4*(k-1)^2-1).*lnm2(x);
	Lnarray = @(x) [Lnarray(x), Ln{k}(x)];
end
end

function x=find_zeros_Legendre(k,Ln)
% Computing the k-th zero from the Legendre Polynomial Ln, counting from
% left to right on (-1,1)
n = length(Ln(0))-1;
if k>n+1
    error('k has to be <= n')
end

K = n-k+1;   % counting from right to left choose K = k

a = -1;
b = 1;
mid = (a+b)/2;
tol = 10^(-7);
while abs(b-a)> tol
    if changeofsign(Ln(mid)) <= K-1
     b = mid;
    else
     a = mid;
    end
    mid = (a+b)/2;
end
x = mid;

end

function s = changeofsign(Ln)
s = 0;
Ln = Ln(Ln~=0);
for k = 2:length(Ln)
    if Ln(k-1)*Ln(k)< 0
        s = s+1;
    end
end
end



