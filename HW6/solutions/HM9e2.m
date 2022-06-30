%Homework 6 Exercise 2
clear all;close; clc;
%% b)+c)
f=@(x) pi.*x.*sin(pi*x.^2);
If=1;
N=10;
ns=2.^(1:N);
errors_sim=zeros(N,1);
Q_Sim=zeros(N,1);

for i=1:N
    x = linspace(0,1,2*ns(i)+1);
    fx = f(x);
    Q_Sim(i)=quad3point(x,fx);
    errors_sim(i)=abs(Q_Sim(i)-If);
end
disp('Error of composed Simpson''s quadrature on n subintervals')
disp(table(ns',errors_sim,'VariableNames',{'n','error'}))
figure()
loglog(ns,errors_sim, 'Linewidth', 3)
xlabel('n'); ylabel('error'); title('Simpson''s rule');
hold on
Cs=errors_sim.*(ns.^4)'
C=max(Cs);
loglog(ns, C./(ns.^4),'--','Linewidth', 2)
legend('error','bound')

%% e)
f=@(x) pi.*x.*sin(pi*x.^2);
If=1;
N=10;
ns=2.^(1:N);
errors_trap=zeros(N,1);
errors_sim=zeros(N,1);
Q_Sim=zeros(N,1);
Q_trap=zeros(N,1);

for i=1:N
    x = linspace(0,1,2*ns(i)+1);
    fx = f(x);
    Q_Sim(i)=quad3point(x,fx);
    Q_trap(i)=trapez(x,fx);
    errors_sim(i)=abs(Q_Sim(i)-If);
    errors_trap(i)=abs(Q_trap(i)-If);
end

figure()
loglog(ns,errors_sim, ns, 1./ns.^4, 'g-.')
hold on
loglog(ns,errors_trap,ns, 1./ns.^2, 'g--')
legend('simpson','1/n^4','trapezoidal','1/n^2')
xlabel('n'); ylabel('error'); title('Simpson vs trapezoidal')

ratio_trap=errors_trap(2:end)./errors_trap(1:end-1);
ratio_sim=errors_sim(2:end)./errors_sim(1:end-1);

fprintf('Simpsons method converges with rate %1.2f \n',...
    mean(-log(ratio_sim(2:end))/log(2)))
fprintf('Trapezoidal method converges with rate %1.2f\n',...
    mean(-log(ratio_trap)/log(2)))

%% f
f = @(x) pi.*x.*sin(pi*x.^2);
If = 1;
ns = (10:10:2000);
N = length(ns);
errors_trap = zeros(N,1);
errors_sim = zeros(N,1);
Q_Sim = zeros(N,1);
Q_trap = zeros(N,1);
delta = 0.0005;   %change delta 0.1, 0.01, 0.001
for i=1:N
    x = zeros(2*ns(i)+1,1);
    x(1:2:end) = (1:2:(2*ns(i)+1))/(2*ns(i)+1);
    x(2:2:end) = ((2:2:2*ns(i))+(rand-0.5)*delta)/(2*ns(i)+1);
    fx = f(x);
    Q_Sim(i)=quad3point(x,fx);
    errors_sim(i)=abs(Q_Sim(i)-If);
end
figure()
loglog(ns,errors_sim)
xlabel('n'); ylabel('error'); title('Simpson''s rule')
hold on
loglog(ns, 1./(ns.^3)*errors_sim(1)*ns(1)^3*10,'--',...
    ns,1./(ns.^4)*errors_sim(1)*ns(1)^4/10,'--','Linewidth', 2)
legend('error','1/n^3','1/n^4')


