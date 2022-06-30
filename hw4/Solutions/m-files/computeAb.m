% Numerik I, HW 4, Exercise 2
% Copmuting the matrix A and vector b of dimension n
function [A,b] = computeAb(n)
b = mod((1:n)',2);

[I,J] = meshgrid(1:n,1:n);
A = exp(-abs(I-J)/100 )+ (J==I)*99;

end