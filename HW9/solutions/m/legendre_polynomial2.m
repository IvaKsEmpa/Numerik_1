function Ln = legendre_polynomial2(n)
    if n==1
        Ln = @(x) x;
    elseif n==0
        Ln = @(x) x-x+1;
    else
        lnm1 = legendre_polynomial2(n-1);    
        lnm2 = legendre_polynomial2(n-2);
        Ln = @(x) x.*lnm1(x)- n^2/(4*n^2-1).*lnm2(x);
    end
end