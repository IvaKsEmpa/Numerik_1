clear all; close all
f=@(x) 1./(1+x.^2);
exact=pi/4;
j=1:22;
for n=j
    h=2^(-n);
    err(n)=abs(midpoint(0,1,f(h/2:h:1))-exact);
end

h = 2.^(-j);
loglog(h,err, h,h.^2)

%%
clear all;
f=@(x) x.^(2/3);
exact=3/5;
j=1:22;
idx1=1; idx2=length(j);
for n=j
    h=2^(-n);
    err(n)=abs(midpoint(0,1,f(h/2:h:1))-exact);
end
figure
h = 2.^(-j);
loglog(h,err, h,h.^1.6)

r=log2(err(idx2)/err(idx1))/(j(idx1)-j(idx2))