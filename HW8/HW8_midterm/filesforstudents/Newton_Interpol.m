function interpol_value=Newton_Interpol(X, Y, x)
% X nodes
% Y values at nodes
% Evaluation of the Newton interpolation polynom in x (using Horner-Scheme)


n=length(X)-1;  % polynomial degree
div_Diff=Y;     % div_Diff: divided differences

%computing the divided differences
for k=2:n+1
    for i = n+1:-1:k
        div_Diff(i) =(div_Diff(i)-div_Diff(i-1))/(X(i)-X(i-k+1));
    end
end

%Evaluation
interpol_value= div_Diff(n+1);
for k=n: -1:1
    interpol_value=div_Diff(k)+(x-X(k)).*interpol_value;
end
end

