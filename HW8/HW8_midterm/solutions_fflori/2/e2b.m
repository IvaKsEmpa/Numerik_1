clc
clear all
close all
n=100;
b=zeros(n,1);
b(2:2:end)=1;
for dval=[2,4]
    a=dval*eye(n)-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1);
    exact=solveLinSysQR(a,b);
    norm2=abs(max(exact));
    deltas=0.1*2.^(0:-1:-10);

    for idx=1:length(deltas)
        b(1:2:end)=deltas(idx);
        perturbed=solveLinSysQR(a,b);
        err2(idx)=max(abs(exact-perturbed));
    end
    err2
    figure()
    plot(deltas,err2)
end
disp('condition number of Atilda=')
cond(a)
disp('norm 2 of invA=')
norm(inv(a))
