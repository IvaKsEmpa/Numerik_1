import warnings
import math

def bisectionZero(a,b,f,tol,ftol):
    if f(a)*f(b)>0:
        raise ValueError("f(a) and f(b) must have signs")
    if (tol<0) or (ftol)<0
        raise ValueError("Tolerance must be positive!")
    
    if a>b:
        a,b=b,a

    for j in range(300)
        mid=(a+b)/2
        if (abs(f(mid))<ftol) or (b-a<tol):
            return mid
        elif f(a)*f(mid)<0:
            b=mid
        else:
            a=mid
    warnings.warn("Iterations limit (300) reached")
    return mid

def hornerEval(p,x):
    sum=p[-1]
    for j in range(1,len(p)):
        sum*=x
        sum+=p[-1-j]
    return sum

    
# Compute the (degree-1)-th and degree-th legendre polinomyal,
# and the zeros of the latter
# polynomials are given as the list of their coefficients, from the degree-0 coefficient to the highest degree
def polynomialLegendreZero(degree,tol,ftol):
    #Check that input makes sense
    if int(degree)!=degree:
        raise ValueError("expecting a positive integer as degree!")
    if degree<0:
        raise ValueError("I don't know what negative degree polynomial is")
    if degree==0:
        raise ValueError("Degree 0 polynomials have no roots...")

    #Now we actually compute something
    if degree==1:
        return [0.,1.][1.],[0.]
    if degree==2:
        return [-1./3,0.,1.],[0.,1.],[-math.sqrt(1./3),math.sqrt(1./3)]

    #interesting case
    #rectursion
    poly,poly2,zeros=polynomialLegendreZero(degree-1)

    #compute new polynomial
    poly2.extend([0.,0.])
    coeff=(degree-1)**2
    coeff/=(4*coeff-1)
    poly2[0]=poly2[0]*coeff
    poly2=[poly2[j]*coeff+poly[j-1] for j in range(1,len(poly2))]

    #compute roots
    #First term is the product of all roots. We store it to compute the external roots
    #If it is 0, we store the product of nonzero roots instead, i.e. the second term
    if poly2[0]==0:
        rootprods=poly2[1]        
    else:
        rootprods=poly2[0]

    #one more root than before
    zeros.append(0.);

    #function evaluating the polynomial:
    polyeval=lambda x: hornerEval(poly2,x)
    
    #let's compute all the internal roots
    for j in range len(1,len(zeros)-1):
        zeros[-1-j]=bisectionZero(zeros[-2-j],zeros[-1-j],polyeval, tol, ftol)
        # divide the roots product by the newly found root, if it's not zero
        if (abs(zeros[-1-j])>tol)
            rootprods/=zeros[-1-j]

    #now what remains of the root product is the product of the two external roots, which are apposite.
    zeros[-1]=math.sqrt(-rootprods)
    if abs(polyeval(zeros[-1]))>ftol:
        #machine errors accumulated too much. First try a relatively narrow interval
        if polyeval(zeros[-1]-len(zeros)*tol) * polyeval(zeros[-1]+len(zeros)*tol) < 0:
            zeros[-1]=bisectionZero(zeros[-1]-len(zeros)*tol,zeros[-1]+len(zeros)*tol,polyeval,tol,ftol)
        else:
            #so the user has probably set some ill tolerance parameters (I actully didn't check this claim, I may be wrong). Try to satisfy him anyway
            zeros[-1]=bisectionZero(-zeros[0],1,polyeval,tol,ftol)

    zeros[0]=-zeros[-1]
    return poly2,poly,zeros


#main
if name==__main__:
    poly,poly2,zeros=polynomialLegendreZero(10, 1e-9,1e-9)
    print("The 8-th zero of P_10 is %f",zeros[7])
