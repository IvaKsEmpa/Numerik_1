def NewtonDD(x,f):
    """Calculate the Newton Divided Difference"""
    n = len(x)
    if n!=len(f):
        print("The lengths of input arguments XI and FI mismatch.")
    else:
        n = n-1
    
    ndd = f
    for i in range(0,n):
        for j in range(n,i,-1):
            ndd[j] = (ndd[j] - ndd[j-1])/(x[j]-x[j-1-i])

    return ndd

def pdn(xi,fi,xj):
    """Evalute the polynomial at xj"""
    ndd = NewtonDD(xi,fi)
    n = len(xi)-1
    yj = []
    for x in xj:
        yjj = ndd[0]
        w = 1
        for i in range(0,n):
            w = w*(x-xi[i])
            yjj = yjj + ndd[i+1]*w 
        yj.append(yjj) 
    return yj
