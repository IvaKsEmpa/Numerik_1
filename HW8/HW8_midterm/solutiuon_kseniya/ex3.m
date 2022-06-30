% EX 3 on interval [a,b]
clear;close all;
f = @(x) 1./(1 + x.^2);
a = 0;
b = 1;
N = 1:10;
h = 1./N
N2 = N;
QG = 0;
errorQG = zeros(1,length(N));
for i = 1:length(N)
n = N(i);
x = zeros(n,1);
m = linspace(a,b,n+1);
alpha = 1;
hl = 1/(n);
x(1:end) = (0.5).*(m(2:end)+m(1:end-1));
w = ones(1,n);
fx = f(x);
disp('length fx')
disp(length(fx))
disp('length x')
disp(length(x))
IF = atan(1);
disp('length QG')
disp(length(QG))
QG = w*fx/n 


errorQG(i) = abs(IF-QG)

end
%%%%%%%%%%%%(c)%%%%%%%%%%%%
figure()
plot(h,errorQG,'-*',...
    h, 0.01*h.^2,'--',...
    h, 0.015*h.^2,'--','Linewidth', 2)
legend('error ','0.01*h.^2','0.015*h.^2')
xlabel('h'); ylabel('error'); title('  quadrature for 1/(1+x^2)')

%(f)%%%%%%%%%%%%%%%%%%%
f = @(x) x.^(2/3);
for i = 1:length(N)
n = N(i);
x = zeros(n,1);
m = linspace(a,b,n+1);
hl = 1/(n);
x(1:end) = (0.5).*(m(2:end)+m(1:end-1));
w = ones(1,n);
fx = f(x);
disp(length(fx))
disp(length(x))
IF = 3/5;
disp(length(QG))
QG = w*fx/n 
errorQG(i) = abs(IF-QG)

end
%%%%%%%%%%%%(c)%%%%%%%%%%%%
figure()
plot(h,errorQG,'-*',...
    h, 0.04*h.^(1.9),'--',...
    h, 0.03*h.^(1.8),'--','Linewidth', 2)
legend('error ','0.04*h^1.9','0.03*h^1.8')
xlabel('h'); ylabel('error'); title('  quadrature for x^(2/3)')
