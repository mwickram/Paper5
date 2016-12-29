
filename=['Dm080111.dat'];

d=load(filename);

area=pi*0.05^2;
delta_f=abs(d(:,2)-d(:,3));
rf=delta_f./d(:,4);
rc=d(:,1)./d(:,4)/area;

data=[d(:,1) rc rf]     
    
subplot(2,2,1)
plot(rc,rf,'-o')
%xlim([0 1200]);ylim([-0.03 1.2])
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('K_r')
title(filename)

subplot(2,2,2)
rc1=rc(3:end).^2;
rf1=rf(3:end).^2;
p=polyfit(rc1,rf1,1);
y=polyval(p,rc1);

plot(rc1/1000,rf1,'-o',rc1/1000,y,'k-')
slope=p(1);
title(['slope =', ' ', num2str(p(1))])
%xlim([0 250]);ylim([-0.1 1.2])
ylabel('[\Delta\omega/\Delta\omega_o]^2')
xlabel('K_r^2 (\times10^3)')

subplot(2,2,3)
plot(rc,1000*delta_f,'-o')
%xlim([0 250]);ylim([-1 40])
ylabel('\Delta\omega (mHz)')
xlabel('K_r')


subplot(2,2,4)
plot(rc,(d(:,2)-d(:,5))./d(:,4),'o-',rc,(d(:,3)-d(:,5))./d(:,4),'^-')
%xlim([0 1200]);
%ylim([-0.8 0.6]);
xlabel('K_r')
ylabel('\omega-\Omega/\Delta\omega_o')
