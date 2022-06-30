import numpy, matplotlib.pyplot, time

##################################################

def FT(f):
    """Fourier transform"""

    if type(f).__module__ != numpy.__name__:
        print("The input argument F must be an instance of NUMPY.NDARRAY.")
        return
    elif f.ndim>1:
        print("The input argument F must be an array of rank 1.")
        return
    else:
        N = f.size
        x0 = 101.15520937701599
    ##############################

    co = 2*numpy.pi/N # 2*pi/(b-a)*dt
    fhat = numpy.dot(numpy.exp(-1j*co*\
                               numpy.outer(numpy.arange(N),numpy.arange(N))),\
                     f)
    fhat = fhat/N

    Nm1d2 = int(numpy.floor((N-1)/2))
    if N & 1: # odd
        Ahat = numpy.zeros(1+Nm1d2)
    else: # even
        Ahat = numpy.zeros(1+Nm1d2+1)
        Ahat[-1] = numpy.real(fhat[int(N/2)])
    Ahat[0] = numpy.real(fhat[0])
    Ahat[1:(Nm1d2+1)] = +2*numpy.real(fhat[1:(Nm1d2+1)])

    Bhat = -2*numpy.imag(fhat[1:(Nm1d2+1)])

    ##############################

    N = 2**16
    t = 2*x0*numpy.arange(N)/N
    a = 0
    b = 2*x0

    ft = evalT(Ahat, Bhat, a, b, t)

    fig = matplotlib.pyplot.plot(t, ft, label='n = ' + str(f.size))

    ##############################

    return fhat, Ahat, Bhat, fig, ft

##################################################

def evalT(Ahat, Bhat, a, b, t):
    """Evaluate the trigonometric polynomial T(t)"""

    if type(t).__module__ != numpy.__name__:
        print("The input argument T must be an instance of NUMPY.NDARRAY.")
        return
    elif t.ndim>1:
        print("The input argument T must be an array of rank 1.")
        return

    ##############################

    if (Ahat.size - Bhat.size) == 1: # N is odd
        N = 2*Bhat.size + 1
    elif (Ahat.size - Bhat.size) == 2: # N is even
        N = 2*Bhat.size + 1 + 1
    else:
        print("The numbers of elements in the AHAT and BHAT arrays mismatch.")
        return

    Nm1d2 = Bhat.size

    ##############################

    co = 2*numpy.pi/(b-a)*numpy.outer(t, numpy.arange(1,Nm1d2+1))
    Tt = numpy.squeeze(Ahat[0] + \
                       numpy.dot(numpy.cos(co), Ahat[1:(Nm1d2+1)]) + \
                       numpy.dot(numpy.sin(co), Bhat))

    if not(N & 1): # N is even
        Tt = Tt + Ahat[int(N/2)]*numpy.cos(numpy.pi*N*t/(b-a))

    ##############################

    return Tt
