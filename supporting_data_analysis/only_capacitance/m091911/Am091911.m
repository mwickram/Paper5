
filename=['Am091911.dat'];

d=load(filename);
d=d(2:end,:);

%set by definition
d(end,5)=mean(d(end,2:3));
d(end,4)=d(end,3)-d(end,2);

area=pi*0.05^2;% area in cm2
delta_f=d(:,3)-d(:,2);%Hz
rf=delta_f./d(:,4);
rc=10^-6*d(:,1)./(area*d(:,4));% F/cm2Hz

data=[d(:,1) rc rf];


subplot(2,2,1)

plot(d(1:end,1),d(1:end,2),'-o',d(1:end,1),d(1:end,3),'-o')
%xlim([-0.005 0.35]);
%ylim([0.215 0.25])
ylabel('\omega(Hz)')
xlabel('K (F)')
title(filename)

subplot(2,2,2)

plot(d(1:end,1),2*pi*d(1:end,2),'-o',d(1:end,1),2*pi*d(1:end,3),'-o')
%xlim([-0.005 0.35]);
%ylim(2*pi*[0.215 0.25])
ylabel('\omega(rad/s)')
xlabel('K (F)')



subplot(2,2,3)

plot(rc,rf,'-oK')
xlim([-0.1 2.7]);
ylim([-0.04 1.1])
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('K_r (sF/cm^2)')


subplot(2,2,4)

g=plot(rc,(d(:,2)-d(:,5))./d(:,4),'o-k',rc,(d(:,3)-d(:,5))./d(:,4),'^-k');
xlim([-0.1 2.7]);
ylim([-6.05 1])
xlabel('K_r (sF/cm^2)')
ylabel('\omega-\omega_o/\Delta\omega_o')


data_f=[rc (d(:,2)-d(:,5))./d(:,4),(d(:,3)-d(:,5))./d(:,4)];



print -r300 Am091911.tiff -f1

