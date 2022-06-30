clear all; clc;
% QR-decompostion
% a)
%using algorithm in Satz 3.6 solve Ax=b 
N = 500:100:1000;
t1= zeros(size(N));
for n = 1:length(N)
    [A,b]=computeAb(N(n));
    tic
    x = solveLinSysQR(A,b);
    t1(n) = toc;
end

figure
loglog(N, t1,'--*', N, N.^3/N(1)^3*t1(1)*0.7,'LineWidth', 2)
xlabel('dimension N')
ylabel('computational time')
legend('using algorithm in Satz 3.6', 'N^3', 'Location','northwest')
title('Computational time to solve Ax=b with QR-decompositon')

% % b)
N = 100;
delta = 10^(-8):0.5*10^(-3):10^(-1);
p = length(delta)
err=zeros(1,p);
disp('delta      Error Error1')
for k = 1:p
     b = mod(((1:N)+1 )',2);
     bdelta = mod(((1:N)+1 )',2) + mod(((1:N))',2)*delta(k);
     A = 0;  A1 = 0;
    [I,J] = meshgrid(1:N,1:N);
    A = (abs(I-J)==1)*(-1)+ (J==I)*2;
    A1 = (abs(I-J)==1)*(-1)+ (J==I)*4;
    xdelta = solveLinSysQR(A,bdelta);
    xdelta1 = solveLinSysQR(A1,bdelta);
    x= linsolve(A,b);
    x1= linsolve(A1,b);
    err(k)=max(abs(x-xdelta));            % compute error
    err1(k)=max(abs(x1-xdelta1));            % compute error
    disp([num2str(delta(k)),'   ',num2str(err(k)), '   ',num2str(err1(k))])
end 
  figure;
 plot(delta,err,'--*', delta,err1,'--' )
 xlabel('delta');
 legend('Err_{delta}', 'Err1_{delta}')
% title(' the error');
% grid; 


