begin=8;
endv=20;
error=zeros(endv-begin+1,1);
g=@(x,y) sin(pi.*x).*cos(pi.*y) ;                                                                                                                                                                                                                                          
f=@(x,y) 2*pi^2 * g(x,y);
for n=begin:endv
    points=linspace(0,1,n+2);
    [m,r]=getMr(n, f, g);
    u=m\r;
    u0=g(points(2:end-1)',points(2:end-1));
    u0=reshape(u0',n^2,1);
    error(1+n-begin)=(max(abs(u-u0)));
end
loglog(begin:endv,error);
hold on
loglog(begin:endv,error(1)*begin^2./(begin:endv).^2);
title("Error")
legend("Error","order 1")

figure();
[X,Y]=meshgrid(points(2:end-1),points(2:end-1));
surf(X,Y,reshape(u,endv,endv));


convratio=log(error(2:end)./error(1:end-1))./(log((begin+1:endv)./(begin:endv-1))');
error
convratio
