function [fhat, Ahat, Bhat, fig, ft]= FT(f)
    x0 = 101.15520937701599;
    if ndims(f)>2 || size(f,2)~=1
        error('The input arguments F must be a column array');
    else
        N = size(f,1);
    end % if-else-flow

    co = 2*pi/N; % 2*pi/(b-a)*dt
    fhat = exp(-1j*co*((0:(N-1))'*(0:(N-1))))*f;
    disp('size fhat')
    disp(size(fhat))
    fhat = fhat/N;

    Nm1d2 = floor((N-1)/2);
    if mod(N,2)==1 % N is odd
        Ahat = zeros(1+Nm1d2,1);
    else % even
        Ahat = zeros(1+Nm1d2+1,1);
        Ahat(end) = real(fhat(N/2+1));
    end % if-else-flow

    Ahat(1) = real(fhat(1));
    Ahat(2:(Nm1d2+1)) = +2*real(fhat(2:(Nm1d2+1)));
    Bhat = -2*imag(fhat(2:(Nm1d2+1)));


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    N = 2^16;
    t = 2*x0*(0:(N-1))'/N;
    a = 0;
    b = 2*x0;

    ft = evalT(Ahat, Bhat, a, b, t);
    disp('t=1')
     disp(evalT(Ahat, Bhat, a, b, 1))

    fig = figure('visible','off');
    plot(t, ft);
    legend(['n = ',num2str(size(f,1))]);
    
end % function FT()


function Tt = evalT(Ahat, Bhat, a, b, t)

    if ~ismatrix(t) || size(t,2)~=1
        error('The input arguments T must be a column array');
    end % if-flow

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if (size(Ahat,1) - size(Bhat,1)) == 1 % N is odd
        N = 2*size(Bhat,1) + 1;
    elseif (size(Ahat,1) - size(Bhat,1)) == 2 % N is even
        N = 2*size(Bhat,1) + 1 + 1;
    else
        error(['The numbers of elements in the AHAT and BHAT ', ...
               'arrays mismatch.']);
    end % if-elseif-flow

    Nm1d2 = size(Bhat,1);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    co = 2*pi/(b-a)*(t*(1:Nm1d2));

    Tt = Ahat(1) + cos(co)*Ahat(2:(Nm1d2+1)) + sin(co)*Bhat;

    if mod(N,2)==0 % N is even
        Tt = Tt + Ahat(N/2+1)*cos(pi*N*t/(b-a));
    end % if-flow

end % function evalT()
