function [eval,interp,feval,err]=computeNewton(n,f)
   nodes=-1:2/n:1;
   eval=linspace(-1,1,1001);
   interp=Newton_Interpol(nodes,f(nodes),eval);
   feval=f(eval);
   err=max(abs(interp-feval));
end