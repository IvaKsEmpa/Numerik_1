%% (b)
f=@(x)1./(1+25.*x.^2);
d=1;
close all
x = linspace(-d,d);
n = 10;
x_equi = linspace(-d,d,n+1);
x_cheb = d*cos((2*(0:n)+1)/(2*(n+1))*pi);

omega_equi = x-x_equi(1);
omega_cheb = x-x_cheb(1);
for j = 2:length(x_equi)
    omega_equi = omega_equi.*(x-x_equi(j));
    omega_cheb = omega_cheb.*(x-x_cheb(j));
end
plot(x,omega_equi,x,omega_cheb,'Linewidth',1.5)
legend('\omega_{10}(x) equidistant nodes','\omega_{10}(x) Chebyshev nodes','Location','South' )

%% (c)
Int=[-d,d];
x_plot = linspace(-d,d,1000);
fx= f(x_plot);

N=[2,4,6,8,10];
anz=length(N);
err=zeros(1,anz);

figure
hold on;

disp('n      Error')
for k=1:anz
    x_cheb = d*cos((2*(0:N(k))+1)/(2*(N(k)+1))*pi);
    fi=f(x_cheb);
    pdni=Newton_Interpol(x_cheb,fi,x_plot);
    plot(x_plot,pdni, 'Linewidth',1.5)
    err(k)=max(abs(fx-pdni));
    disp([num2str(N(k)),'   ',num2str(err(k))])
end
plot(x_plot,fx,'--','Linewidth',1.5)
legend('n=2','n=4','n=6','n=8','n=10','f(x)')
hold off

figure;
plot(N,log(err),'x-','Linewidth',1.5)
%semilogy(N,err,'x-')                    % alternative
xlabel('n');
ylabel('log(E_{d,n})');
title('Logarithm of error');
grid;

% slope beta
beta=(log(err(2:end))-log(err(1:end-1)))./(N(1:end-1)-N(2:end))
beta=sum(beta)/length(beta)             %compute mean value
% C_1
logC=(N(1:end-1).*log(err(2:end))-N(2:end).*log(err(1:end-1)))./(N(1:end-1)-N(2:end));
C=exp(logC);
C=sum(C)/length(C)                      %compute mean value