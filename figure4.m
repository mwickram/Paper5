function figure4


filename=['Am091911.dat'];

d=load(filename);
d=d(2:end,:);
d(end,5)=mean(d(end,2:3));
d(end,4)=d(end,3)-d(end,2);

area=pi*0.05^2;% area in cm2
omega_o=d(:,5);
delta_omega_o=d(:,4);

omega1=(d(:,2)-omega_o)./delta_omega_o;
omega2=(d(:,3)-omega_o)./delta_omega_o;
K=d(:,1);
Kc=10^-6*K./(area*delta_omega_o);% F/cm2Hz

np=2;
qomega1=omega1(end-np:end,1);
qomega2=omega2(end-np:end,1);
qkc=Kc(end-np:end,1);

p1=polyfit(qkc,qomega1,1);
p2=polyfit(qkc,qomega2,1);

lq1=polyval(p1,qkc);
lq2=polyval(p2,qkc);

%isochornicity
qc_fast=p2(1)%fast oscillator
qc_slow=p1(1)%slow oscillator

fc=16;

h=subplot(2,2,1);

set(h,'fontsize',fc)

g=plot(Kc,omega1,'^-k',Kc,omega2,'o-k');
%g=plot(Kc,omega1,'^-k',qkc,lq1,'-r',Kc,omega2,'o-k',qkc,lq2,'-g');
set(g,'linewidth',1.1)
set(g,'markersize',10)
xlim([-0.2 2.7]);
ylim([-6.5 1.2])
hpos=get(h,'position');
hpos(3)=hpos(3)+0.00;
set(h,'position',hpos)
ylabel('(\omega_1_,_2 -  \omega_o) / \Delta\omega_o')


%xlabel('\itK\rm_c (sF/cm^2)')


%h_pos=get(h,'position');
%h_pos(1)=h_pos(1)-0.05;
%set(h,'position',[h_pos(1) h_pos(2) h_pos(3) h_pos(4)])

%---------------------------------------



filename=['Am080311.dat'];

d=load(filename);
d(end,5)=mean(d(end,2:3));
d(end,4)=d(end,2)-d(end,3);

area=pi*0.05^2;% area in cm2
omega_o=d(:,5);
delta_omega_o=d(:,4);

omega1=(d(:,2)-omega_o)./delta_omega_o;
omega2=(d(:,3)-omega_o)./delta_omega_o;
K=d(:,1)*1000% in ohm
rc=1./(area*K.*delta_omega_o);% 1/cm2ohmHz

np=2;
qomega1=omega1(end-np:end,1);
qomega2=omega2(end-np:end,1);
qrc=rc(end-np:end,1);

p1=polyfit(qrc,qomega1,1);
p2=polyfit(qrc,qomega2,1);

lq1=polyval(p1,qrc);
lq2=polyval(p2,qrc);

%isochornicity %negative of slopes
qr_fast_os=p1(1)%fast oscillator
qr_slow_os=p2(1)%slow oscillator

fc=16;

h=subplot(2,2,2);

set(h,'fontsize',fc)

g=plot(rc,omega1,'o-k',rc,omega2,'^-k');
%g=plot(rc,omega1,'o-k',qrc,lq1,'-g',rc,omega2,'^-k',qrc,lq2,'-r');
set(g,'linewidth',1.1)
set(g,'markersize',10)
xlim([-0.05 0.55]);
ylim([-1.4 0.8])
hpos=get(h,'position');
hpos(3)=hpos(3)+0.00;
set(h,'position',hpos)
%xlabel('\itK\rm_r (s/cm^2\Omega)')
%ylabel('\omega-\omega_o/\Delta\omega_o')




intfC=load('hm100411_6.dat');

intfRC=load('hm102511_15.dat');



h=subplot(2,2,3);

set(h,'fontsize',fc)

omega=[0.344 0.328;0.343 0.328];
omega_o=mean(omega);

hf=intfC(:,3)-omega_o(2);
delta=intfC(:,1);
hfn=intfC(:,5)-omega_o(2);

g1=plot(delta(1:100:end),2*pi*hf(1:100:end),'ok',delta,2*pi*hfn,'-r');
set(g1(2),'linewidth',2)
xlim([-0.25 6.4])
ylim([-0.22 0.15])
%ylim(2*pi*[-0.032 0.032])

%ylabel('\omega-\omega_o (Hz)','fontsize',20,'fontname','times new roman')
%xlabel('\Delta\phi  (rad)','fontsize',20)
hpos=get(h,'position');
hpos(3)=hpos(3)+0.00;
set(h,'position',hpos)



h=subplot(2,2,4);

set(h,'fontsize',fc)

omega=[0.349 0.362;0.344 0.360];
omega_o=mean(omega)


hf=intfRC(:,3)-omega_o(2);
delta=intfRC(:,1);
hfn=intfRC(:,5)-omega_o(2);

g1=plot(delta(1:100:end),2*pi*hf(1:100:end),'ok',delta,2*pi*hfn,'-r');
set(g1(2),'linewidth',2)

xlim([-0.25 6.4])
ylim([-0.22 0.15])
%ylim(2*pi*[-0.032 0.032])
%set(h,'yticklabel','');
hpos=get(h,'position');
hpos(3)=hpos(3)+0.00;
set(h,'position',hpos)





print -r600 figure4.tiff


