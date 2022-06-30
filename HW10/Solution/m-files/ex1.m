clear all; clc;
format long;
h = @(x) (x-cos(x)+sin(x)); %(1./(1+x.^2) + sin(x)); %
dh = @(x)  (1+sin(x) + cos(x)); % (cos(x) - 2.*x./(1+x.^2).^2);
ddh = @(x) (cos(x) - sin(x)); %  (sin(x) - (2-6.x.^2)./(1+x.^2).^3;

% plot the function to  guess the starting interval 
xi = linspace(-5,5, 1000);
plot(xi, h(xi))
xlabel('x'); ylabel('f'); legend('f(x)=x-cos(x)+sin(x)')
% ok, from plot i see, that i can use starting interval [-5,52]

[x y]=Bisection1(-5,5,h,dh,ddh); %Interval I_delta(a)
a=(x+y)/2
delta=(y-x)/2
zero=Newton(a,h,dh)

disp('h(zero_newton) =')
h(0.456624704567631) % check if it s really zero of f 

function [x y]=Bisection1(x,y,f,df,ddf)
a=(x+y)/2;
delta=(y-x)/2;
s=linspace(a-3*delta,a+3*delta);     %Interval I_{3*delta} (a)
t=s;
l=[];
for i=s
    for j=t
        l=[l abs(ddf(i)/(2*df(j)))];
    end
end
t=4*delta*max(l);                   %From Corollary 7.10, t should be less than 1
while(t>1)
    m=(x+y)/2;
    if sign(f(x)*f(m))<0
        y=m;
    else
        x=m;
    end
    a=(x+y)/2;
    delta=(y-x)/2;
    s=linspace(a-3*delta,a+3*delta);
    t=s;
    l=[];
    for i=s
        for j=t
            l=[l abs(ddf(i)/(2*df(j)))];
        end
    end
    t=4*delta*max(l);
end

end


function x=Newton(x,f,df)
e=1;
while(e>10^(-8))
    t=x;
    x=x-f(x)./df(x);
    e=abs(x-t);
end
end