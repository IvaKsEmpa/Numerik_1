function [ y ] = pwquad( a,b,N,fi,x )
if length(fi) ~= 2*N+1
    disp('error: fi must be a vector of length 2N+1')
end
n = 2*N+1;
xi = linspace(a,b,n);
y = zeros(size(x));
for i=1:2:n-2
    
    %   Using Lagrange form
     index = (xi(i)<= x & x<= xi(i+2));
     L1 = (x(index)-xi(i+1))/(xi(i)-xi(i+1)).*(x(index)-xi(i+2))/(xi(i)-xi(i+2));
     L2 = (x(index)-xi(i))/(xi(i+1)-xi(i)).*(x(index)-xi(i+2))/(xi(i+1)-xi(i+2));
     L3 = (x(index)-xi(i))/(xi(i+2)-xi(i)).*(x(index)-xi(i+1))/(xi(i+2)-xi(i+1));
     y(index) = fi(i)*L1 + fi(i+1)*L2+fi(i+2)*L3;
    
%%   Using Newton form (With divided differences from Homework 2)
  %   index = (xi(i)<= x & x<= xi(i+2));
   %  y(index) = Newton_Interpol(xi(i:i+2),fi(i:i+2),x(index));
end

end