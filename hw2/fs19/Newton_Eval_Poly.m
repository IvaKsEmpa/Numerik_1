function y=Newton_Eval_Poly(b_j, X, x)
% X nodes
% b_j div. differences
% Evaluation of interpolation polynomial in x

n=length(X)-1;
m=length(b_j);

% Remark 2.8
c=zeros(m);
c(1)=ones(1);
if m>1
    c(2)=x-X(1);
end
for j=3:n+1;
    c(j)=(x-X(j-1)).*c(j-1);
end

y=b_j(1);
for i=2:n+1  
    y=y+b_j(i).*c(i);
end

end