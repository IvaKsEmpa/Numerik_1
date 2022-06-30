function x=Bisectionk(a,b,f)
t = zeros(25, 1);
t_prev = zeros(26, 1);
if f(a)*f(b)>0
    error('f(a) and f(b) have the same sign')
end
if f(a)==0
    x=a;
elseif f(b)==0
    x=b;
else
    x=a;
    i=1;
    disp('Iter    x_Bisection      Error_Bisection')
    c=[];
    t(i)=abs(x - 2^(1/3));
    while(t(i)>10^(-8))
        t_prev(i)=t(i);
        x=(a+b)/2;
        if sign(f(x))==0
            break;
        elseif sign(f(a)*f(x))<0
            b=x;
        else
            a=x;
        end
        if i>30
            break
        end
        t(i+1)=abs(x - 2^(1/3));
        disp([num2str(i),'       ',num2str(x,'%2.7e'),'    ',num2str(t(i))])
        if i>1
            c= [c t(i+1)/t_prev(i)];
        end
        i=i+1;
    end
  %  disp(['Constant c = ', num2str(c)]);

  disp('rate of convergence for Bisection = ')
%     p=(log(t(3:end))-log(t(2:end-1)))./(log(t(2:end-1))-log(t(1:end-2)))
p=(log(t(2:end)))./(log(t_prev(1:end-1)))
end

end