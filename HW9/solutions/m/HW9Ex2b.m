% HW 9 Ex 2b
% Computing the zeros of the Legendre Polynomials for 
% (.,.) = L2-scalar product on (-1,1) using the fact the separation of 
% zeros of the Sturm sequence

close all
clear
n = 10;
zero = 3;
Ln = legendre_polynomial(n);

x = find_zeros_Legendre(zero,n, Ln)

function Ln = legendre_polynomial(n)
    Ln{1} = @(x) x;
    Ln{2} = @(x) x.^2- 1/3;
    for k = 3:n
        lnm1 = Ln{k-1};    
        lnm2 = Ln{k-2};
        Ln{k} = @(x) x.*lnm1(x)- (k-1)^2/(4*(k-1)^2-1).*lnm2(x);
    end
end


function x=find_zeros_Legendre(k,n,Ln)
if n ==0
    error('n should be positive')
end

Lnt = Ln{n};
tol = 10^(-7);

if k>n+1
    error('k has to be <= n')
end

if n ==0
    error('n should be positive')
    x = 0;
elseif n==1
    x = 0;
elseif k == n
    a = find_zeros_Legendre(k-1,n-1,Ln);
    b = 1;
    x = bisection(a,b,Lnt,tol);
elseif k==1
    b = find_zeros_Legendre(1,n-1,Ln);
    a = -1;
    x = bisection(a,b,Lnt,tol);
else
    a= find_zeros_Legendre(k-1,n-1,Ln);
    b= find_zeros_Legendre(k,n-1,Ln);
    x= bisection(a,b,Lnt,tol);
end

function x=bisection(a,b,f,tol)
if f(a)*f(b)>0
    error('f(a) and f(b) have the same sign')
end
t=abs(a-b);
x=a;
while(t>tol)
    x=(a+b)/2;
    if sign(f(x))==0
        break;
    elseif sign(f(a)*f(x))<0
        b=x;
    else
        a=x;
    end
    t=abs(a-b);
end

end

end

