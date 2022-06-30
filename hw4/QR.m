function [U,Beta] = QR(A)
% QR - QR decomposition

    if ndims(A)~=2 || size(A,1)~=size(A,2)
        error('*** The input argument A must be a square matrix.')
    else
        n = size(A,1);
    end % if-else-flow

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    myNorm =@(x) sqrt(myDot(x,x));

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    U = zeros(n,n);
    Beta = zeros(n,1);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for k = 1:n
        Rkk = myNorm(A(k:end,k));
        U(k:end,k)=A(k:end,k);
        U(k,k)=mySign(U(k,k))*(Rkk+abs(U(k,k)));
        Beta(k)=1/(Rkk*(Rkk+abs(A(k,k))));
    end

end % function QR()

function uv = myDot(u,v)
% MYDOT - calculates the dot product of two vectors.
    n = length(u);

    uv = 0;
    for i = 1:n
        uv = uv + u(i)*v(i);
    end % for-loop

end % function myDot()

function sgn = mySign(x)

    if x<0
        sgn = -1;
    else
        sgn = +1;
    end % if-else-flow

end % function mySign()