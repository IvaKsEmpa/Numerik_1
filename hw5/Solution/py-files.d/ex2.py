import numpy, matplotlib.pyplot
import FunHW5

f = numpy.loadtxt('f.dat')
N = f.size
x0 = 101.15520937701599

lSet = numpy.arange(2,16,2)
ft = numpy.zeros((N, lSet.size))
err = numpy.zeros(lSet.shape)

for i in range(lSet.size):

    l = lSet[i]
    idx = numpy.arange(2**l)*2**(16-l)

    fhat, Ahat, Bhat, figi, ft[:,i] = FunHW5.FT(f[idx])

    err[i] = max(abs(ft[:,i] - f))
    
matplotlib.pyplot.show()
print('\n')
print('error:\n' + str(err))
