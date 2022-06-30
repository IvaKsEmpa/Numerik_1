import FunHW3
import numpy, matplotlib.pyplot

d = 1.0
a = -d
b = +d
f = lambda x: (1+4*x**2)**(-1/2)

xj = numpy.linspace(a,b,1e3+1)
fj = f(xj)

err= []

Nset = numpy.arange(1.,6)#numpy.arange(1.,51)
for N in Nset:
    fi = f(numpy.linspace(a,b,2*N+1))
    pj = FunHW3.ex1(a, b, fi, xj)
    err.append(max(abs(fj - pj)))
    
print('ERROR TABLE')
for i in range(0,len(err)):
    print('%-12i%-1.10f' % (Nset[i], err[i]))
    
matplotlib.pyplot.loglog(Nset, err,'-*',Nset,Nset**-3)
matplotlib.pyplot.xlabel(r'number of subintervals $N$ ')
matplotlib.pyplot.ylabel(r'error $|f(x)-p_N(x)|_\infty$')
matplotlib.pyplot.grid(True)
matplotlib.pyplot.show()
