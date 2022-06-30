close all
clear all

f=@(x) sin(x);
ft=@(x,delta) f(x)+delta*sin(1/x)/(x+1);
fp=@(x,delta,h) (ft(x+h,delta)-ft(x-h,delta))/2/h;
hs=10.^[-0.5:-0.5:-3];
deltas=10.^[-6:-2:-12];
err=zeros(length(hs),length(deltas));
for i=1:length(hs)
    h=hs(i);
    for j=1:length(deltas)
        delta=deltas(j);
        err(i,j)=abs(fp(0,delta,h)-1)   %errors
    end
end

colors=rand(length(deltas),3);
hopt=@(delta) (3*delta)^(1/3);        %h_opt
figure()

for j=1:length(deltas)
    loglog(hs,err(:,j),'color',colors(j,:));
    hold on
    ho=hopt(deltas(j))
    loglog([ho ho], get(gca,'Ylim'), 'color',colors(j,:))
    lege{j}=strcat('delta=',num2str(deltas(j)));

end
legend(lege)