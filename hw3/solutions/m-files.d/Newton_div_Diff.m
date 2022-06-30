function [b_j,B]=Newton_div_Diff(X, F)
% X nodes
% F values at nodes

n=length(X)-1; %polynomial degree

%matrix of divided differences
B=zeros(n+1,n+1);
B(:,1)=F;

for i=2:n+1
    for j=i:n+1
        B(j,i)=(B(j,i-1)-B(j-1,i-1))/(X(j)-X(j-i+1)); %formula (2.7) from lecture notes
    end
end

b_j=diag(B);        % divided differences
end