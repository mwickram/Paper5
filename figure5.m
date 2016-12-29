function figure5

filename=['Am080411.dat'];

d=load(filename);
a1=pi*0.05^2;%cm2
a2=pi*0.1^2;%cm2
r_area=(a1*a2)/(a1+a2);
delta_f=d(:,3)-d(:,2);
rf=delta_f./d(:,4);
rc=1./(2*r_area*10^3*d(:,1).*d(:,4));
rc
data=[d(:,1) rc rf]  

fc=16;

h=subplot(3,3,2);

set(h,'fontsize',fc)
g=plot(rc,rf,'-ok');
set(g,'linewidth',1.1)
set(g,'markersize',5)
xlim([-0.02 0.27]);ylim([-0.2 1.6])
ylabel('\Delta\omega/\Delta\omega_o','Fontsize',fc)
%xlabel('\itK_r \rm(s/cm^2\Omega)')



h=subplot(3,3,1);

set(h,'fontsize',fc)
g=plot(rc,(d(:,2)-d(:,5))./d(:,4),'^k-',rc,(d(:,3)-d(:,5))./d(:,4),'o-k');
set(g,'linewidth',1.1)
set(g,'markersize',5)
xlim([-0.02 0.27])
ylim([-1.2 0.7]);
%xlabel('\itK_r \rm(s/cm^2\Omega)')
ylabel('\omega_1_,_2- \omega_o/\Delta\omega_o','Fontsize',fc)

d=load('m080411_15.dat');
d=sgolayfilt(d,2,101);
t=[0:length(d)-1]/1000;



a2=pi*0.1^2;
r2=225;
a1=pi*0.05^2;
r1=1000;

h=subplot(3,3,4:5);

set(h,'fontsize',fc)
g=plot(t,d(:,1)/r1/a1,'-k',t,d(:,2)/a2/r2,'--k');
set(g,'linewidth',2)
xlim([50 100])
ylim([0.008 0.035])
set(h,'xticklabel','')

d=load('m080411_5.dat');
d=sgolayfilt(d,2,21);
t=[0:length(d)-1]/200;



h=subplot(3,3,7:8);

set(h,'fontsize',fc)
g=plot(t,d(:,1)/r1/a1,'-k',t,d(:,2)/a2/r2,'--k');
set(g,'linewidth',2)
xlim([50 100])
ylim([0.008 0.035])
hpos=get(h,'position');
hpos(2)=hpos(2)+0.07;
set(h,'position',hpos)



print -r600 figure5.tiff