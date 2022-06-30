clear all; clc;
n = 10;

[M,r] = HW12_getMr(n);

lmin = min(eig(M));
lmax = max(eig(M));
omega = 2/(lmin+lmax);
x0 = zeros(n^2,1);
[x_Rich,err_Rich,it_Rich] = richardson(M,r,omega,x0);
[x_GS,err_GS,it_GS] = SOR(M,r,1,x0);

conv_Rich = (err_Rich(2:end)./err_Rich(1:end-1))';
conv_GS = (err_GS(2:end)./err_GS(1:end-1))';
plot(conv_Rich)
hold on
plot(conv_GS)
hold off
legend('convergence rate Richardson', 'convergence rate Gauss Seidel')

% %% c)
% n = 10;
% [M,r] = HW12_getMr(n);
% 
% omega = linspace(1,1.8);
% x0 = zeros(n^2,1);
% for i = 1:length(omega)
%    [~,~,it_GS(i)] =   SOR(M,r,omega(i),x0);
% end

% plot(omega,it_GS)
% [~,k]=min(it_GS);
% 
% disp(['Minimal number of iterations for omega =', num2str(omega(k))])