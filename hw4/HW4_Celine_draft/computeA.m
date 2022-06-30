% Numerik I, Serie 4, Aufgabe 2
% Berechnung der gegebenen Matrix in Aufgabe 3 mit der Dimension n

n=100;
b = mod((1:n)',2);

[I,J] = meshgrid(1:n,1:n);
A = exp(-abs(I-J)/100 )+ (J==I)*99;

x = solveLinSysQR(A,b);
disp(['Error of ||Ax-b|| is: ',num2str(max(A*x-b))])