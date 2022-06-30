function [ x ] = solve_upper_triangular_system( R, b )
%solve_upper_triangular_system HW 4, Exercise 2
%   Input: nxn-upper triangular matrix R, nX1 vector b
% 	Output: solution of the system Rx=b

n = length(R);
x = zeros(n,1);
    for k = n:-1:1
        s = b(k);
        for l = n:-1:k+1
            s = s - R(k,l)*x(l);
        end
        x(k) = s/R(k,k);
    end

end

