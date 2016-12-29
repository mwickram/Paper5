function figure3

% in files fast and slow oscillators --think in this way is important

filename=['Am092111.dat'];

d=load(filename);
d(end,5)=mean(d(end,2:3));
d(end,4)=d(end,2)-d(end,3);

area=pi*0.05^2;% area in cm2
omega_o=d(:,5);
delta_omega_o=d(:,4);

omega1=(d(:,2)-omega_o)./delta_omega_o;
omega2=(d(:,3)-omega_o)./delta_omega_o;


K=d(:,1)*1000;% in ohm
rc=1./(area*K.*delta_omega_o);% 1/cm2ohmHz

np=3;
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

h=subplot(2,2,1);

set(h,'fontsize',fc)

g=plot(rc,omega1,'o-k',rc,omega2,'^-k');
%g=plot(rc,omega1,'o-k',qrc,lq1,'-g',rc,omega2,'^-k',qrc,lq2,'-r');
set(g,'linewidth',1.1)
set(g,'markersize',10)
xlim([-0.05 0.8]);
ylim([-0.68 0.65])
%xlabel('\itK\rm_r (s/ \Omegacm^2)')
ylabel('(\omega_1_,_2 -  \omega_o) / \Delta\omega_o')


h=subplot(2,2,2);
set(h,'fontsize',fc)
g=plot(rc,omega1-omega2,'-ok','markersize',10,'linewidth',1.1);
ylabel('\Delta\omega/\Delta\omega_o')
%xlabel('\itK\rm_r (s/ \Omegacm^2)')
ylim([-0.1 1.2])
xlim([-0.05 0.8])


intfR=load('hm100311_11.dat');
%intfR=sgolayfilt(intfR,1,551);

fc=16;


h=subplot(2,2,3);

set(h,'fontsize',fc)

omega=[0.345 0.327;0.342 0.323];
omega_o=mean(omega);

hf=intfR(:,3)-omega_o(2);
delta=intfR(:,1);
hfn=intfR(:,5)-omega_o(2);
hshift=1;
g1=plot(delta(1:100:end),2*pi*hf(1:100:end),'ok',delta,2*pi*hfn,'-r');
hpos=get(h,'position');
hpos(hshift)=hpos(hshift)+0.22;
set(h,'position',hpos)
set(g1(2),'linewidth',2)
xlim([-0.25 6.4])
ylim([-0.22 0.15])
%ylabel('\Gamma\it\phi')


print -r600 figure3.tiff -f1


