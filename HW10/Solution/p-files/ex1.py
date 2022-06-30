from pylab import *

def bisec(x,y,f,df,ddf):
	delta=(y-x)/2.
	a = (x+y)/2.
	s=linspace(a-3.*delta,a+3.*delta)
	t= 2*delta*max(abs(ddf(s)))/min(abs(df(s)))
	while t>=1:
		m=(x+y)/2
		if f(x) == 0:
			print('%f is a zero' %x)
			break
		if sign(f(x)*f(a))<0:
			y = m
		else:
			x=m
		delta=(y-x)/2.
		a = (x+y)/2.
		s=linspace(a-3*delta,a+3*delta)
		t= 2*delta*max(abs(ddf(s)))/min(abs(df(s)))
	return x,y
        
def Newton(x,f,df):
    for i in range(20):
        x = x-f(x)/df(x)
    return x
    
    

h = lambda x: x-cos(x)+sin(x)
    
dh = lambda x: 1+sin(x)+cos(x)
    
ddh = lambda x: cos(x)-sin(x)
    
[x,y]=bisec(-5,5,h,dh,ddh)
print('a = ',(x+y)/2,', delta =',(y-x)/2)

print("Zero fo f: %.20f" %Newton((x+y)/2,h,dh))
