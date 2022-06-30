import numpy
import scipy.linalg
from math import sin,cos,pi,log
import matplotlib.pyplot

# compute M and r
def getmr(n,f,g):
    [points,h]=numpy.linspace(0,1,n+2,True,True)
    r=numpy.asmatrix([[f(points[i],points[j]) for j in range(1,n+1)] for i in range(1,n+1)])
    r[range(0,n),[[0],[-1]]]+=numpy.asmatrix([[g(points[i],points[j])/(h**2) for j in [0,-1]] for i in range(1,n+1)]).transpose()
    r[[[0],[-1]],range(0,n)]+=numpy.asmatrix([[g(points[i],points[j])/(h**2) for j in range(1,n+1)] for i in [0,-1]])
    r=r.flatten().transpose()
    m=numpy.diag(4*numpy.ones(n))
    m-=numpy.diag(numpy.ones(n-1),1)
    m-=numpy.diag(numpy.ones(n-1),-1)
    m=numpy.asmatrix(scipy.linalg.block_diag(*([m] *n)))
    m-=numpy.diag(numpy.ones(n**2-n),-n)
    m-=numpy.diag(numpy.ones(n**2-n),n)
    m/=h**2
    return m,r

def richardson(A,b,omega,start,tol):
    for j in range(300):
        next=start-omega*(A@start-b)
        if numpy.linalg.norm(start-next,numpy.inf)<tol:
            return next,j
        start=next

    print("iteration limit reached")
    return next,300

def sor(A,b,omega,start,tol):
    d=numpy.diag(numpy.diag(A));
    up=numpy.triu(A)
    do=numpy.tril(A)-d
    m2=numpy.linalg.inv(d+omega*do)
    m1=m2@(d-omega*up);
    m2*=omega
    for j in range(300):
        next=(m1@start+m2@b)
        if numpy.linalg.norm(A@next-b,numpy.inf)<tol:
            return next,j
        start=next
        
    print("iteration limit reached")
    return next,300
            
if __name__=="__main__":
    n=10
    tol=1e-6
    omega=1
    start=numpy.zeros(n**2)

    h=1./(n+1)
    lmin=8/h**2 * (sin(numpy.pi * h/2))**2
    lmax=8/h**2 * (cos(numpy.pi * h/2))**2
    oopt=2./(lmax+lmin)

    g=lambda x,y: sin(pi*x)*cos(pi*y)
    m,r=getmr(n, lambda x,y: 2*pi**2*g(x,y),g)
    sol=numpy.linalg.solve(m,r)
    
    print("Richardson with optimal parameter, error and iteration number")
    gls,itnum=richardson(m,r,oopt,start,tol)
    print(numpy.linalg.norm(gls-sol,numpy.inf))
    print(itnum)

    print("Gauss-Seidel, error and iteration number")
    gls,itnum=sor(m,r,1,start,tol)
    print(numpy.linalg.norm(gls-sol,numpy.inf))
    print(itnum)

    print("sor: finding optimal omega")
    omegamin=0
    omegamax=31
    step=1
    curmin=200
    iterations=[sor(m,r,1+omega/30,start,tol)[1] for omega in range(omegamin,omegamax)]
    print(iterations)
    matplotlib.pyplot.plot(range(omegamin,omegamax),iterations)
    matplotlib.pyplot.show()
