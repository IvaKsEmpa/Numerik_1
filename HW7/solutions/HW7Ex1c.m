% Testint Gauss-Quadrature on interval [a,b]
clear;close all;

a = -1;
b = 1;

N = 3:2:19;
N2 = 3*N;
errorQG = zeros(1,length(N));
errorQS1 = zeros(1,length(N));
errorQS2 = zeros(1,length(N));
for i = 1:length(N)
n = N(i);
x = zeros(3*n,1);
m = linspace(a,b,2*n+1);
hd2= (b-a)/(2*n);
x(2:3:end) = m(2:2:end);
x(1:3:end-1) = x(2:3:end)-sqrt(3/5)*hd2;
x(3:3:end) = x(2:3:end)+sqrt(3/5)*hd2;

f = @(x) cos(x);
fx = f(x);
IF = sin(b)-sin(a);
QG = Qgauss(n,fx);  %this method works only for a=-1, b=1
errorQG(i) = abs(IF-QG);

% comparison w.r.t. the same number of subintervals
fm = f(m);
QS = quad3point(m,fm);
errorQS1(i) = abs(IF-QS);

%comparison w.r.t. the same number of evaluations of f
xm = linspace(a,b,N2(i));
fxm = f(xm);
QS = quad3point(xm,fxm);
errorQS2(i) = abs(IF-QS);
end

plot(log(N),log(errorQG),'-*', log(N),log(errorQS1),'-*',...
    log(N), log(N.^(-6)*errorQG(1)*N(1)^6*2),'--',...
    log(N), log(N.^(-4)*errorQS1(1)*N(1)^4*2),'--','Linewidth', 2)
legend('error Gauss','error Simpson 1','1/N^6','1/N^4')
xlabel('n number of subintervals'); ylabel('error'); title('Comparing Simpson''s and Gauss quadrature')

figure
plot(log(N2),log(errorQG),'-*', log(N2),log(errorQS2),'-*',...
    log(N2), log(N2.^(-6)*errorQG(1)*N2(1)^6*2),'--',...
    log(N2), log(N2.^(-4)*errorQS2(1)*N2(1)^4*2),'--','Linewidth', 2)
legend('error Gauss','error Simpson 1','1/N^6','1/N^4')
xlabel('n number of nodes'); ylabel('error'); title('Comparing Simpson''s and Gauss quadrature')
