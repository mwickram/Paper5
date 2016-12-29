function figure2

%d1=load('m080111_9.dat');
%d2=load('m080111_11.dat');
dar=200;
fc=16;
sub_h=0.05;
sub_h1=0;


h=subplot(3,1,1);
set(h,'fontsize',fc)
d0=load('m091911_3.dat');%0F
d0=sgolayfilt(d0,2,21);
d0=[d0(1:end,1)/1 d0(1:end,2)/0.98];
t0=[0:length(d0)-1]/dar;

g=plot(t0,d0(:,1),'-k',t0,d0(:,2),'--k');
xlim([75 130])
ylim([0.05 0.23])
set(h,'Xticklabel','')
set(g(1),'linewidth',1)
set(g(2),'linewidth',2)
h_pos=get(h,'position');
h_pos(4)=h_pos(4)+sub_h;
h_pos(3)=h_pos(3)+sub_h1;
set(h,'position',[h_pos(1) h_pos(2) h_pos(3) h_pos(4)])

% omega_u=[0.3721 0.3655;0.3577 0.3487];
% omega_o=mean(omega_u);
% omega=0.3530;
% domega=[omega-omega_o]/abs(diff(omega_o))


h=subplot(3,1,2);
set(h,'fontsize',fc)

d1=load('m080111_16.dat');%c=99microF
d1=sgolayfilt(d1,2,21);
d1=d1/0.9;
t1=[0:length(d1)-1]/dar;

g=plot(t1,d1(:,1),'-k',t1,d1(:,2),'--k');
xlim([75 130])
ylim([0.05 0.24])
set(h,'Xticklabel','')
set(g(1),'linewidth',1)
set(g(2),'linewidth',2)
h_pos=get(h,'position');
h_pos(4)=h_pos(4)+sub_h;
h_pos(3)=h_pos(3)+sub_h1;
set(h,'position',[h_pos(1) h_pos(2) h_pos(3) h_pos(4)])



omega_u=[0.3578 0.3495;0.3577 0.3487];
omega_o=mean(omega_u);
omega=0.3530;
domega=[omega-omega_o]/abs(diff(omega_o))



h=subplot(3,1,3);
set(h,'fontsize',fc)

d2=load('m080111_20.dat');
d2=sgolayfilt(d2,2,21);
d2=d2/0.9;
t2=[0:length(d2)-1]/dar;


g=plot(t2,d2(:,1),'-k',t2,d2(:,2),'--k');
xlim([75 130])
ylim([0.05 0.24])

set(g(1),'linewidth',1)
set(g(2),'linewidth',2)
h_pos=get(h,'position');
h_pos(4)=h_pos(4)+sub_h;
h_pos(3)=h_pos(3)+sub_h1;
set(h,'position',[h_pos(1) h_pos(2) h_pos(3) h_pos(4)])


omega_u=[0.3574 0.3475;0.3564 0.3463];
omega_o=mean(omega_u)
omega=0.3023;
domega=[omega-omega_o]/abs(diff(omega_o))


print -r600 figure1a.tiff
