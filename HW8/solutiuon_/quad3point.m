function [ QS ] = quad3point( x, f )
%composed 3-point quadrature on [a,b]=[x_0,...,x_{2n}]
% INPUT: nodes x, values of f both of same odd length. 
% OUTPUT: QS quadrature.

m = length(x);

if m ~= length(f)
   error('input vectors should be of same length') 
end
if mod(m,2) ~= 1
    error('input vectors should be of odd length')
end

QS=0;
for i=1:2:m-2
    wa = (x(i+2)-x(i))/6*(2*x(i)+x(i+2)-3*x(i+1))/(x(i)-x(i+1));
    wm = (x(i+2)-x(i))/6*(x(i+2)-x(i))^2/((x(i+1)-x(i))*(x(i+2)-x(i+1)));
    wb = (x(i+2)-x(i))/6*(2*x(i+2)+x(i)-3*x(i+1))/(x(i+2)-x(i+1));
    QS=QS+(wa*f(i)+wm*f(i+1)+wb*f(i+2));
end

%%% same but avoiding for-loop
% i = 1:2:(m-2); ip1 = i+1; ip2 = i+2;
% wa = (x(ip2)-x(i))/6.*(2*x(i)+x(ip2)-3*x(ip1))./(x(i)-x(ip1));
% wm = (x(ip2)-x(i))/6.*(x(ip2)-x(i)).^2./((x(ip1)-x(i)).*(x(ip2)-x(ip1)));
% wb = (x(ip2)-x(i))/6.*(2*x(ip2)+x(i)-3*x(ip1))./(x(ip2)-x(ip1));
% f = reshape(f, m, 1);
% x = reshape(x, 1, m);
% QS=wa*f(i)+wm*f(ip1)+wb*f(ip2);

end

