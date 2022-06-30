close all
% (a), (b)
d=1;
Int=[-d,d];
x_plot=linspace(Int(1),Int(2),1001);
L = 2*4+2*6/8;
C = (8/3)^4*64*L/7/pi;
fx= 1./(1+4*x_plot.^2);

color=['m','c','r','g','b']; 
N=1:5;
l=length(N);

err=zeros(1,l);
disp('N      error     error bound')
figure;
% Computing interpolation polynomial for N(k) subintervalls
for k=1:l
    xi=linspace(Int(1),Int(2),2*N(k)+1);          % nodes
    fi=1./(1+4*xi.^2);                             % values at nodes
    
    pN=pwquad(-d,d,N(k), fi, x_plot);           % piecewise quadratic interpolation 
    
    hold on                                       % plot approximation
    plot(x_plot,pN,'Color',color(k),'LineStyle','--','Linewidth',1.5)
    err(k)=max(abs(fx-pN)); 
    % error
      disp('length(fx)')
    disp(length(fx))
       disp('length(pn)')
    disp(length(pN))
    %error bound (c) 
    errmax = C*(1/N(k))^3; 
    disp([num2str(N(k)),'   ',num2str(err(k),'%.6f'),'        ',num2str(errmax)])
end
plot(x_plot,fx,'k','Linewidth',1.5)
legend('1','2','3','4','5','exact')
hold off
loglog(N,err, N, N.^(-3))
legend('Fehler', '1/N^3')

% (b) 2nd part
N = ceil((10^7*C)^(1/3));
x_plot = linspace(Int(1),Int(2),4*N);
fx = 1./(1+4*x_plot.^2);
xi=linspace(Int(1),Int(2),2*N+1);
fi=1./(1+4*xi.^2);
pN=pwquad(-d,d,N, fi, x_plot);
disp(['Error for N = ',num2str(N),': ', num2str(max(fx-pN))])
figure
plot(x_plot,fx,x_plot,pN,'r--', 'Linewidt',1.5)
legend('exact',['N =',num2str(N)])