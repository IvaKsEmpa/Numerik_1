% Comparing the complexity of two different algorithm to solve Ax=b with
% QR-decompostion

clear

%using algorithm in Satz 3.6
N = 200:100:1000;
t1= zeros(size(N));
for n = 1:length(N)
    [A,b]=computeAb(N(n));
    tic
    x = solveLinSysQR(A,b);
    t1(n) = toc;
end

%allowing matrix-matrix multiplication in for-loop
N = 200:100:1000;
t2= zeros(size(N));
for n = 1:length(N)
    [A,b]=computeAb(N(n));
    tic
    x = solveLinSysQR_inefficient(A,b);
    t2(n) = toc;
end

figure
loglog(N, t1,'--*', N, t2,'--*', N, N.^3/N(1)^3*t1(1)*0.7,N,...
    N.^4/N(1)^4*t2(1)*0.7,'LineWidth', 2)
xlabel('dimension N')
ylabel('computational time')
legend('using algorithm in Satz 3.6','allowing matrix-matrix mutliplication',...
    'N^3','N^4', 'Location','northwest')
title('Computational time to solve Ax=b with QR-decompositon')
