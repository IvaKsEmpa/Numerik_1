from pylab import *
import math

h=10**linspace(-.5,-4.5,9)
delta=10**linspace(-12,-6,4)
print(h)
print(delta)
def E(h,d):
    e=h**2/6+d/h
    return e
    
#def E(h,d):
#    e=1-(sin(h)-h**2*sin(h)+d*sin(1/h))/h
#    return e
 
error0=[]
error1=[]
error2=[]
error3=[]
hopt=[]
   
for i in range(len(h)):
    error0.append(E(h[i],delta[0]))
    error1.append(E(h[i],delta[1]))
    error2.append(E(h[i],delta[2]))
    error3.append(E(h[i],delta[3]))
    
for i in range(len(delta)):
    hopt.append((3*delta[i])**(1/3.))

plot(log(h),log(error0),'r')
plot(log([hopt[0], hopt[0]]),log([min(error0)/2,max(error0)]),'r')
plot(log(h),log(error1),'b')
plot(log([hopt[1], hopt[1]]),log([min(error1)/2,max(error1)]),'b')
plot(log(h),log(error2),'g')
plot(log([hopt[2], hopt[2]]),log([min(error2)/2,max(error2)]),'g')
plot(log(h),log(error3),'c')
plot(log([hopt[3], hopt[3]]),log([min(error3)/2,max(error3)]),'c')
#axis([0,0.02,0,0.01])
print(hopt)
show()
