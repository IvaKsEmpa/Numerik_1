function [b_j,B]=Newton_div_Diff(X, F)
% X nodes
% F values at nodes

n=length(X)-1; %polynomial degree

%matrix of divided differences
B=zeros(n+1,n+1);
B(:,1)=F;

for i=2:n+1
        B(i:n+1,i)=(B(i:n+1,i-1)-B(i-1:n,i-1))./(X(i:n+1)-X((i:n+1)-i+1))'; %formula (2.7) from lecture notes
end

b_j=diag(B);        % divided differences
end