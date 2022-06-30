%% a
clear all; close all
a=1;
f=@(x)atan(a*sin(x));
n=4:2:12;
for idx=1:length(n)
   [eval{idx},interp{idx},feval{idx},err(idx)]=computeNewton(n(idx),f);
end
err

for in=1:length(eval)
    plot(eval{in},interp{in},eval{in},feval{in});
    figure() %or hold on
end
semilogy(err);

%% c
clear all;
idx0=1; idx1=3; idx2=5;
%amax = 2.239818572998047
%precision 1e-5, testing convergence on 16 and 20 points
a=1.119909286499023; %test for different values: a= 1,1.5,2,2.5,3
f=@(x)atan(a*sin(x));
n=4:2:12;
for idx=1:length(n)
   [eval{idx},interp{idx},feval{idx},err(idx)]=computeNewton(n(idx),f);
end
err
beta=log(err(idx2)/err(idx1))/(n(idx1)-n(idx2))
C=err(idx0)*exp(beta*n(idx0))
semilogy(n,err);
hold on
semilogy(n,C./exp(beta*n));




























% idx1=16;
% idx2=20;
% a=2;
% alow=1;
% aup=100;
% amax=true;
% treshold=1e-10;
% accuracy=1e-5;
% while (aup-alow > accuracy)
%     f=@(x)atan(a*sin(x));
%     [evala,interpa,fevala,erra]=computeNewton(idx1,f);
%     [evalb,interpb,fevalb,errb]=computeNewton(idx2,f);
%     if((errb-erra)/errb > treshold)
%         amax=true;
%         aup=a;
%         a=(a+alow)/2;
%     elseif(amax)
%         alow=a;
%         a=(a+aup)/2;
%     else
%         a=a*2;
%     end
%     if((aup-alow)<1e-4)
%         break
%     end
% end

