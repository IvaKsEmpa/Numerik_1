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