%Ex 2b

a= exp(1) - 1;
for k = 1:100
    a = exp(1) - k*a; 
end
disp('a=');
disp(a);
disp(a-0.026652359191789498);

%the values differ because there is a over- resp. underflow

%Ex 2c

b= 0;
for k = 200:-1:100  
    b = (exp(1) - b)/(k+1);
end
disp('b=');
disp(b);