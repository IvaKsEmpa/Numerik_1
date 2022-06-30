import numpy
import scipy.linalg
from math import sin,cos,pi,log
import matplotlib.pyplot

# compute M and r
def getMrBasic(n,f,g):
    [points,h]=numpy.linspace(0,1,n+2,True,True)
    r=numpy.asmatrix([[f(points[i],points[j]) for j in range(1,n+1)] for i in range(1,n+1)])
    # r[0,0]+=numpy.asmatrix(g(points[0],points[1])/(h**2)+g(points[1],points[0])/(h**2))
    # r[-1,0]+=numpy.asmatrix(g(points[-1],points[1])/(h**2)+g(points[-2],points[0])/(h**2))
    # r[0,-1]+=numpy.asmatrix(g(points[0],points[-2])/(h**2)+g(points[1],points[-1])/(h**2))
    # r[-1,-1]+=numpy.asmatrix(g(points[-1],points[-2])/(h**2)+g(points[-2],points[-1])/(h**2))
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

def getMr(n):
    g=lambda x,y: sin(pi*x)*cos(pi*y)
    m,r=getMrBasic(n, lambda x,y: 2*pi**2*g(x,y),g)
    return m,r

if __name__=="__main__":
    m,r=getMr(4)
    print(r)
    print(m)
