close all

f=@(x)1./(1+25.*x.^2);

%% (b) and (c)
for d= [1,0.1]  % (d) Test d=0.5:-0.1:0.1

    Int=[-d,d];
    x_plot=Int(1):2*Int(2)/1000:Int(2);  % x-values for error estimation
    fx=f(x_plot);                  % values of f at nodes

    color=['m','c','r','g','b','y']; 
    N=[2,4,6,8,10];
    j=length(N);
    
    err=zeros(1,j);
    disp(['Error for d = ', num2str(d)])
    disp('n      Error')
    figure;
    % Compute and plot the interpolations polynomial for n=2,4,6,8,10.
    % Computing the error.
    for k=1:j
        xi=Int(1):2*Int(2)/N(k):Int(2);      % define nodes
        fi=f(xi);
        pdni=Newton_Interpol(xi,fi,x_plot);  % evaluation of interpolation polynomial
        
        hold on
        plot(x_plot,pdni,'Color',color(k),'Linewidth',1.5)
        err(k)=max(abs(fx-pdni));            % compute error
        
        disp([num2str(N(k)),'   ',num2str(err(k))])
    end
    plot(x_plot,fx,'--k','Linewidth',1.5)
    legend('n=2','n=4','n=6','n=8','n=10','f(x)')
    hold off
end

%rate of convergence
fprintf('rate of convergence: %f, %f, %f, %f\n\n', (log(err(2:end))-log(err(1:end-1)))/2)


%% (d)
dmax=0.45 ;
d=dmax/2;
Int=[-d,d];
x_plot=Int(1):2*Int(2)/1000:Int(2);
fx= f(x_plot);

N=2:2:20;
j=length(N);
err=zeros(1,j);

disp('n      Error')
for k=1:j
    xi=Int(1):2*Int(2)/N(k):Int(2);
    fi=f(xi);
    pdni2=Newton_Interpol(xi,fi,x_plot);
    err(k)=max(abs(fx-pdni2));
    disp([num2str(N(k)),'   ',num2str(err(k))])
end

% slope beta
beta=(log(err(2:end))-log(err(1:end-1)))./(N(1:end-1)-N(2:end));
beta=sum(beta)/length(beta)             %compute mean value
beta1 = 0.5;
beta2 = 0.6;
% C_1
logC=(N(1:end-1).*log(err(2:end))-N(2:end).*log(err(1:end-1)))./(N(1:end-1)-N(2:end));
C=sum(logC)/length(logC);                      %compute mean value
C=exp(C)

figure;
plot(N,log(err),'x-', N, -beta1*N-1.2, N, -beta2*N-1.5,'Linewidth',1.5)
xlabel('n');
legend('log(E_{d,n})','\beta = 0.5','\beta = 0.6')
title('Logarithm of error');
grid;

