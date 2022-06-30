def ex1(a,b,f,xj):
    """"Piecewise quadratic interpolation"""
    N = len(f)
    if (N-1)%2 != 0:
        print("The length of the input list F cannot be represented by 2*N+1.")
        return
    else:
        h = (b-a)/(N-1)

    # Newton divided difference
    ndf0 = f[0:-2:2]
    ndf1 = (f[1:N:2]-f[0:-2:2])/h
    ndf2 = (f[0:-2:2]-2*f[1:N:2]+f[2:N:2])/(2*h**2)

    yj = []
    for x in xj:
        if x<a:
            print("The elements in the input argument xj cannot be smaller than " + str(a))
            return
        elif x>b:
            print("The elements in the input argument xj cannot be larger than " + str(b))
            return
        else:
            j = min((x-a)//(2*h), -1+(N-1)/2) # floor division
            j = int(j)
            x0 = a+j*(2*h)
            x1 = x0+h
            yj.append(ndf0[j] + ndf1[j]*(x-x0) + ndf2[j]*(x-x0)*(x-x1))

    return yj
