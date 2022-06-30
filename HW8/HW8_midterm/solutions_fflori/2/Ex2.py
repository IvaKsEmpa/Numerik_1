import numpy
import matplotlib.pyplot, time

def solveLinSysQR(A,b):
    if len(A.shape)>2:
        raise TypeError("Not accepting tensors with more than two dimensions")
    size=len(b)
    if A.shape[0] != size:
        raise TypeError("Incompatible sizes in matrix and rhs")
    if A.shape[1] != size:
        raise TypeError("This function does not attempt to solve under- or over- determined systems")

    R=numpy.zeros((size,size))
    y=numpy.copy(b)
    for step in range (size-1):
        [u,beta]=ubeta(A)
        #beta=beta[0,0]
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
    u= numpy.asmatrix(numpy.copy(A[:,0]))
    beta = 1/(numpy.linalg.norm(u)*(abs(u[0,0])+numpy.linalg.norm(u)));
    if abs(u[0,0])> 1e-15: #u[0]
        u[0,0] = u[0,0] + u[0,0]/abs(u[0,0])*numpy.linalg.norm(u);
    else:
        u[0,0] = u[0,0] - numpy.linalg.norm(u);

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


def constructA(n):
    A = numpy.asmatrix(2.0*numpy.identity(n))
    for i in range(n-1):
        A[i,i+1] = -1.0
        A[i+1,i] = -1.0
    return A
    
def constructAt(n):
    A = numpy.asmatrix(4*numpy.identity(n))
    for i in range(n-1):
        A[i,i+1] = -1.0
        A[i+1,i] = -1.0
    return A

def constructb(n):
    b = numpy.asmatrix(numpy.zeros((n,1)))
    for i in range(1,n,2):
        b[i,0] = 1.0

    return b

def constructbdelta(n,delta):
    bd = numpy.asmatrix(numpy.zeros((n,1)))
    for i in range(1,n,2):
        bd[i,0] = 1.0
        bd[i-1,0] = delta

    return bd

#%%
############### EX2a ###############
nSet = numpy.array([500, 550, 600, 650, 700, 750, 800, 850, 900]) #
CPUTime4QR = numpy.zeros(nSet.shape)
k=0
for i in nSet:
    A = constructA(i)
    b = constructb(i)
    qrStart = time.time()
    x = solveLinSysQR(A,b)
    CPUTime4QR[k] = time.time() - qrStart
    k = k + 1

matplotlib.pyplot.loglog(nSet, CPUTime4QR, 'ro-', label='QR decomposition')
matplotlib.pyplot.loglog(nSet, nSet**3/nSet[0]**3*CPUTime4QR[0], '--', label='cubic reference')
matplotlib.pyplot.xlim([500,1000])
matplotlib.pyplot.legend()
matplotlib.pyplot.show()


#%%
############### EX2b ###############
dSet = numpy.array([0.1,0.05,0.025,0.01,0.005,0.001]) 
err = numpy.zeros(dSet.shape)
errt = numpy.zeros(dSet.shape)
n=100
A = constructA(n)
At = constructAt(n)
b = constructb(n)
x = solveLinSysQR(A,b)
xt = solveLinSysQR(At,b)
k=0
for i in dSet:
    bd = constructbdelta(n,i)
    xd = solveLinSysQR(A,bd)
    xtd = solveLinSysQR(At,bd)
    err[k] = numpy.linalg.norm(x-xd)
    errt[k] = numpy.linalg.norm(xt-xtd)
    k = k + 1

print(err)
print(errt)
matplotlib.pyplot.plot(dSet,err)
matplotlib.pyplot.show()
