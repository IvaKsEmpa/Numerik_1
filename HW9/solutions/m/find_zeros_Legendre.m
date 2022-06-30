function x=find_zeros_Legendre(k,n)

Ln = legendre_polynomial(n);
tol = 10^(-7);

if k>=n+1
    error('k has to be <= n')
end

if n ==0
    error('n should be positive')
    x = 0;
elseif n==1
    x = 0;
elseif k == n
    a = find_zeros_Legendre(k-1,n-1);
    b = 2*a+1;
    x = bisection(a,b,Ln,tol);
elseif k==1
    b = find_zeros_Legendre(k,n-1);
    a = 2*b-1;
    x = bisection(a,b,Ln,tol);
else
    a= find_zeros_Legendre(k-1,n-1);
    b= find_zeros_Legendre(k,n-1);
    x= bisection(a,b,Ln,tol);
end
    

end

function Ln = legendre_polynomial(n)
    if n==1
        Ln = @(x) x;
    elseif n==0
        Ln = @(x) x-x+1;
    else
        lnm1 = legendre_polynomial(n-1);    
        lnm2 = legendre_polynomial(n-2);
        Ln = @(x) x.*lnm1(x)- n^2/(4*n^2-1).*lnm2(x);
    end
end