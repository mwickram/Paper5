 
filename=['Am092111.dat'];

d=load(filename);
d=d(1:end,:); 
d(end,5)=mean(d(end,2:3));
d(end,4)=d(end,2)-d(end,3);

area=pi*0.05^2;% area in cm2
delta_f=d(:,2)-d(:,3);%Hz
rf=delta_f./d(:,4);
rc=1./(area*d(:,1).*d(:,4));% 1/cm2kohmHz

data=[d(:,1) rc rf]


subplot(2,2,1)

plot(1./d(1:end-1,1),d(1:end-1,2),'-o',1./d(1:end-1,1),d(1:end-1,3),'-o')
%xlim([-0.005 0.35]);
%ylim([0.215 0.25])
ylabel('\omega(Hz)')
xlabel('K (1/k\Omega)')
title(filename)

subplot(2,2,2)

plot(1./d(1:end-1,1),2*pi*d(1:end-1,2),'-o',1./d(1:end-1,1),2*pi*d(1:end-1,3),'-o')
%xlim([-0.005 0.35]);
%ylim(2*pi*[0.215 0.25])
ylabel('\omega(rad/s)')
xlabel('K (1/k\Omega)')


subplot(2,2,3)

plot(rc,rf,'-ok')
xlim([-50 800]);
ylim([-0.1 1.1])
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('K_r (s/cm^2k\Omega)')


subplot(2,2,4)

g=plot(rc,(d(:,2)-d(:,5))./d(:,4),'o-k',rc,(d(:,3)-d(:,5))./d(:,4),'^-k');
xlim([-50 800]);
ylim([-0.65 0.65])
xlabel('K_r (s/cm^2k\Omega)')
ylabel('\omega-\omega_o/\Delta\omega_o')


data_f=[rc (d(:,2)-d(:,5))./d(:,4),(d(:,3)-d(:,5))./d(:,4)]


print -r300 Am092111.dat.tiff


