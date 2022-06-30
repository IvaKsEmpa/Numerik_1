import numpy

def solveLinSysQR(A,b):
    if len(A.shape)>2:
        raise TypeError("Not accepting tensors with more than two dimensions")
    size=len(b)
    if A.shape[0] != size:
        raise TypeError("Incompatible sizes in matrix and rhs")
    if A.shape[1] != size:
        raise TypeError("This function does not attempt to solve under- or over- determined systems")

    R=numpy.copy(A)
    y=numpy.copy(b)
    for step in range (size-1):
        [u,beta]=ubeta(A)
        beta=beta[0,0]
        PA = A - u @ (beta * (u.transpose() @ A))
        Pb = b - u * (beta * numpy.dot(u.transpose(),b))
        R[step,step:] = PA[0,:]
        A = PA[1:,1:]
        y[step] = Pb[0]
        b= Pb[1:]
    R[-1,-1] = PA[-1,-1]
    y[-1] = Pb[-1]
        
    return solveUpperTriangularSystem(R,y)

def ubeta(A):
    u=numpy.asmatrix(numpy.copy(A[:,0]))
    beta = 1/(numpy.linalg.norm(u)*(abs(u[0])+numpy.linalg.norm(u)));
    if abs(u[0])> 1e-15:
        u[0] = u[0] + u[0]/abs(u[0])*numpy.linalg.norm(u);
    else:
        u[0] = u[0] -numpy.linalg.norm(u);

    return u,beta

def solveUpperTriangularSystem(R,y):
    if len(y)==1:
        return numpy.asmatrix(y[0]/R[0,0])

    x=solveUpperTriangularSystem(R[1:,1:],y[1:])
    x=numpy.insert(x,0,(y[0] - numpy.dot(R[0,1:],x)) / R[0,0],0)
    return x

def getrandom():
    a=numpy.asmatrix(numpy.random.rand(10,10))
    x=numpy.asmatrix(numpy.random.rand(10,1))
    b=a@x
    return a,b,x
