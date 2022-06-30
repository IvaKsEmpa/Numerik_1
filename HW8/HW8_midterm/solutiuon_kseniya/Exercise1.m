clear all; clc;
close all;
%%%%%%%%%% EX 1 %%%%%%%%%%
a = 1;
f=@(x)atan(a*sin(x));

% %% (a)
    d = 1;
    Int=[-d,d];
    x_plot=Int(1):Int(2)/500:Int(2);
    fx= f(x_plot);

    color=['m','c','r','g','b','y']; 
    N=[4,6,8,10,12];
    j=length(N);
      
    err=zeros(1,j);
    disp(['Error for N = ', num2str(N)])
    disp('n      Error')
    figure;
     hold on 
    % Compute and plot the interpolations polynomial for n=4,6,8,10, 12.
    % Computing the error.
    for k=1:j
        xi=Int(1):2*Int(2)/N(k):Int(2);      % define nodes
        fi=f(xi);
        pdni=Newton_Interpol(xi,fi,x_plot);  % evaluation of interpolation polynomial
        
       
        plot(x_plot,pdni,'Color',color(k),'Linewidth',1.5)
   
        err(k)=max(abs(fx-pdni));            % compute error
        
        disp([num2str(N(k)),'   ',num2str(err(k))])
     
       
    end
    plot(x_plot,fx,'--k','Linewidth',1.5)
    legend('n=4','n=6','n=8','n=10','n=12','f(x)')
    hold off
    saveas(gcf,'fig1a.eps')
      
    figure;
    plot(N,log(err),'Linewidth',1.5)
    xlabel('n');
    title('Logarithm of the error');
    grid;
     
%rate of convergence
fprintf('rate of convergence: %f, %f, %f, %f\n\n', abs((log(err(2:end))-log(err(1:end-1)))/2))

% %% (b) and (c)
amax = 5;
a = 0.5*amax;
x_plot=Int(1):Int(2)/500:Int(2);
fx= f(x_plot);
color=['m','c','r','g','b','y']; 
N=4:2:12;
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

% compute slope beta
beta=(log(err(2:end))-log(err(1:end-1)))./(N(1:end-1)-N(2:end));
betamean=sum(beta)/length(beta)   %compute mean value
betamax = max(beta) %compute max value
beta1 = 0.5;
beta2 = 0.6;
% compute log C
logC=(N(1:end-1).*log(err(2:end))-N(2:end).*log(err(1:end-1)))./(N(1:end-1)-N(2:end))
Cmean=sum(logC)/length(logC) ;%compute mean value
Cmax=max(logC); %compute max value
C=exp(Cmean) %compute C

figure;
plot(N,log(err),'x-', N, -beta1*N-2, N, -beta2*N-3,'Linewidth',1.5)
xlabel('n');
legend('log(E_{a,n})','\beta = 0.5','\beta = 0.6')
title('Logarithm of the error');
grid;
figure()
loglog(N,log(err), 'Linewidth', 3)
xlabel('n'); ylabel('error'); 
hold on
loglog(N, Cmax-betamax.*N,'--','Linewidth', 2)
legend('error','bound')
saveas(gcf,'fig1c.eps')


