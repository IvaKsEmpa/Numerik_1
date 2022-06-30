I0 = exp(1) - 1;
for k = 1:1:100
IK  = (exp(1) -k*I0) ;
I0 = IK; 
end
disp('first reccurence relation: I100 =')
disp(IK)


I200 = 0.0;
for k = 199:-1:100
IK  = (exp(1) -I200)/(k+1) ;
I200 = IK; 
end
disp('backward reccurence relation: I100=')
disp(IK)

a = sqrt(4950000001);
b= 30000;

y = 33375*b^6/100+ 5.5*b^8 + a^2*(11*a^2*b^2 - b^6 - 121*b^4 - 2)

syms a b y c d;

f=@(x) sqrt(x);
g=sym(f)

a = subs(g,4950000001);
b= 30000;
f2 = @(c,d) 33375*d^6/100+ 5.5*d^8 + c^2*(11*c^2*d^2 - d^6 - 121*d^4 - 2);
g2=sym(f2);
y=subs(g2,c,subs(g,4950000001))
y2=subs(y,d,30000)
double(y2 + a/2/b)