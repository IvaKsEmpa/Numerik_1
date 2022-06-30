% Numerik I, HW 4, Exercise 2
% Copmuting the matrix A and vector b of dimension n
function [A,b] = computeAb(n)
b = mod(((1:n)+1 )',2);
A = 0;
[I,J] = meshgrid(1:n,1:n);
A = (abs(I-J)==1)*(-1)+ (J==I)*2;

end