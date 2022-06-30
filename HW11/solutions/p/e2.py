import numpy
import scipy.linalg
from math import sin,cos,pi,log
import matplotlib.pyplot
from mpl_toolkits.mplot3d import Axes3D

# compute M and r
def getmr(n,f,g):
    [points,h]=numpy.linspace(0,1,n+2,True,True)
    r=numpy.asmatrix([[f(points[i],points[j]) for j in range(1,n+1)] for i in range(1,n+1)])
    r[0,0]+=numpy.asmatrix(g(points[0],points[1])/(h**2)+g(points[1],points[0])/(h**2))
    r[-1,0]+=numpy.asmatrix(g(points[-1],points[1])/(h**2)+g(points[-2],points[0])/(h**2))
    r[0,-1]+=numpy.asmatrix(g(points[0],points[-2])/(h**2)+g(points[1],points[-1])/(h**2))
    r[-1,-1]+=numpy.asmatrix(g(points[-1],points[-2])/(h**2)+g(points[-2],points[-2])/(h**2))
    r[range(1,n-1),[[0],[-1]]]+=numpy.asmatrix([[g(points[i],points[j])/(h**2) for j in [0,-1]] for i in range(2,n)]).transpose()
    r[[[0],[-1]],range(1,n-1)]+=numpy.asmatrix([[g(points[i],points[j])/(h**2) for j in range(2,n)] for i in [0,-1]])
    r=r.flatten().transpose()
    m=numpy.diag(4*numpy.ones(n))
    m-=numpy.diag(numpy.ones(n-1),1)
    m-=numpy.diag(numpy.ones(n-1),-1)
    m=numpy.asmatrix(scipy.linalg.block_diag(*([m] *n)))
    m-=numpy.diag(numpy.ones(n**2-n),-n)
    m-=numpy.diag(numpy.ones(n**2-n),n)
    m/=h**2
    # print(m[0:4,:])
    # print(n)
    # print(numpy.diag(m,n))
    return m,r
    # return m,r,points,h

# main
if __name__=="__main__":
    begin=8
    end=21
    error=numpy.zeros(end-begin)
    for n in range(begin,end):
        g=lambda x,y: sin(pi*x)*cos(pi*y)
        m,r=getmr(n, lambda x,y: 2*pi**2*g(x,y),g)
        u=numpy.linalg.solve(m,r)
        [points,h]=numpy.linspace(0,1,n+2,True,True)
        u0=numpy.asmatrix([[g(points[i+1],points[j+1]) for j in range(n)] for i in range(n)]).flatten().transpose()
        error[n-begin]=(max(abs(u-u0)))

    matplotlib.pyplot.title("Error")
    matplotlib.pyplot.xlabel("1-D gridpoints") 
    matplotlib.pyplot.ylabel("Maximum error") 
    matplotlib.pyplot.plot(range(begin,end),error,label="error");
    matplotlib.pyplot.plot(range(begin,end),[error[0]*begin**2/x**2 for x in range(begin,end)],label="order 1")
    matplotlib.pyplot.xscale('log')
    matplotlib.pyplot.yscale('log')
    matplotlib.pyplot.legend()
    matplotlib.pyplot.show()

    fig = matplotlib.pyplot.figure()
    axes = fig.add_subplot(111, projection='3d')
    X,Y=numpy.meshgrid(points[1:-1],points[1:-1])
    axes.plot_surface(X,Y,u.reshape(end-1,end-1), cmap=matplotlib.cm.coolwarm,linewidth=0, antialiased=False)
    matplotlib.pyplot.show()

    convratio=[log(error[j+1]/error[j])/log((j+begin+1)/(j+begin)) for j in range(len(error)-1)]
    print(error)
    print(convratio)
