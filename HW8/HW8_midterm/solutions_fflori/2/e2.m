clc
clear all
close all
maxn=2000;
stepn=200;
time= [];
j=500:stepn:maxn;
for n=j
    a=2*eye(n)-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1);
    ainv = inv(a);
    b=zeros(n,1);
    b(2:2:end)=1;
    tic
    solveLinSysQR(a,b);
    time=[time toc];
end
disp('condition number of A=')
cond(a)
disp('norm 2 of invA=')
norm(inv(a))
time
loglog(j,time)
hold on
s=j.^3;
loglog(j,s/s(2)*time(2));
legend('time','O(n^3)')
hold off
