clc; clear all;
f=@(x) x.^3-2;
f1=@(x) 3*x.^2;
f2=@(x) 6*x;

n=30;             %Max number of Iterations
x=2;              %Starting point
error=zeros(1);
c=zeros(1,n-1);
x_exact=2^(1/3);

phi=@(x) x-(f1(x)-sqrt(f1(x).^2-2*f(x).*f2(x)))./f2(x);      %Order3 or Halley's method
disp('Iter    x_ord3            Error_ord3')
for i=1:n
    x=phi(x);
    error(i)=abs(x_exact-x);
    if i>1
       c(i-1)=error(i)/error(i-1)^3;        %Convergence rate Def 7.2
       
    end
    disp([num2str(i),'       ',num2str(x,'%2.7e'),'    ',num2str(error(i))])
    if error(i)<10^(-8)
        break
    end
end
disp('rate of convergence for the new method = ')
p=(log(error(3:end))-log(error(2:end-1)))./(log(error(2:end-1))-log(error(1:end-2)))

%disp(['Constant c= ', num2str(c(1:i-1))])    


phi_N=@(x) x-f(x)./f1(x);      %Newton 
x=2;
errorN=zeros(1,5);
disp('Iter    x_Newton         Error_Newton')
for i=1:n
    x=phi_N(x);
    errorN(i)=abs(x_exact-x);
    if i>1
       c(i-1)=errorN(i)/errorN(i-1)^2;
    end
    disp([num2str(i),'       ',num2str(x,'%2.7e'),'    ',num2str(errorN(i))])
    if errorN(i)<10^(-8)
        break
    end
end
%disp('Constant c=  ')
%disp(c(1:i-1))

disp('rate of convergence for Newton = ')
p=(log(errorN(3:end))-log(errorN(2:end-1)))./(log(errorN(2:end-1))-log(errorN(1:end-2)))


x_b=Bisectionk(1,2,f);