clc; clear all; close all;

f = fscanf(fopen('f.dat','r'), '%f');
N = length(f);
x0 = 101.15520937701599;

lSet = (2:16)';
ft = zeros(N, numel(lSet));
err = zeros(size(lSet));

for i = 1:numel(lSet)

    l = lSet(i);
    idx = ((1:2^l)-1)*2^(16-l)+1;
    
    [fhat, Ahat, Bhat, fig(i), ft(:,i)] = FT(f(idx));

    err(i) = max(abs(ft(:,i) - f));

end % for-loop

DataSet = 2.^lSet;
T = table(DataSet, err);
disp(T);

figure(1);
plot(2*x0*(0:(N-1))'/N, ft);
grid on;
set(legend('$T_2(t)$','$T_4(t)$','$T_6(t)$',...
             '$T_8(t)$','$T_{10}(t)$','$T_{12}(t)$','$T_{14}(t)$','$T_{16}(t)$'),...
    'Interpreter','latex');
