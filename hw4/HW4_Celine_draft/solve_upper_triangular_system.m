function [ x ] = solve_upper_triangular_system( A, b )
%solve_ObereDreiecksmatrixLGS Numerik Serie 4, Aufgabe 2
%               Eingabe: nxn-Matrix A, Spaltenvektor b
%               Ausgabe: Loesung des LGS

n = length(A);
x = zeros(n,1);
    for k = n:-1:1
        s = b(k);
        for l = n:-1:k+1
            s = s - A(k,l)*x(l);
        end
        x(k) = s/A(k,k);
    end

end

