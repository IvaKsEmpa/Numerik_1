% COMPLEXITY
clear
k=1;
N = 100:100:1000;
for n = N
    [A,b]=computeAb(n);
    tic
    x = solveLinSysQR(A,b);
    t(k) = toc;
    k =k+1;
end
loglog(N,t/t(1), N, N.^3/(N(1)^3),N, N.^2/(N(1)^2))
xlabel('N')
ylabel('computational time')
legend('time to solve system of dimension N','N^3', 'N^2')


%naive way
l =1;
N = 100:10:200;
for n = N
    [A,b]=computeAb(n);
    tic
    x = solveLinSysQR_bad(A,b);
    tnaive(l) = toc;
    l =l+1;
end
figure
loglog(N,tnaive/tnaive(1), N, N.^3/(N(1)^3),N, N.^2/(N(1)^2))
xlabel('N')
ylabel('computational time')
legend('time to solve system of dimension N','N^3', 'N^2')
title('naive')