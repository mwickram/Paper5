
function figure2

dar=200;

d1=load('m091911_3.dat');%0F
d1=sgolayfilt(d1,2,21);
d1=[d1(1:end,1)/1 d1(1:end,2)/0.98];
t1=[0:length(d1)-1]/dar;


d2=load('m091911_15.dat');%45microF
d2=sgolayfilt(d2,2,21);
d2=d2(1:end,:)/1;
t2=[0:length(d2)-1]/dar;


d3=load('m091911_17.dat');%66.7microF
d3=sgolayfilt(d3,2,21);
d3=d3(1:end,:)/1;
t3=[0:length(d3)-1]/dar;


fc=16;
sub_h=0.05;
sub_h1=0.2;

h=subplot(3,2,1);
set(h,'fontsize',fc,'FontName','arial')
g=plot(t1,d1(:,1),'-k',t1,d1(:,2),'--k');
set(g(1),'linewidth',1)
set(g(2),'linewidth',2)
xlim([80 130])
ylim([0.06 0.2])
set(h,'xticklabel','')
h_pos=get(h,'position');
h_pos(4)=h_pos(4)+sub_h;
h_pos(3)=h_pos(3)+sub_h1;
set(h,'position',[h_pos(1) h_pos(2) h_pos(3) h_pos(4)])


h=subplot(3,2,3);
set(h,'fontsize',fc,'FontName','arial')
g=plot(t2,d2(:,1),'-k',t2,d2(:,2),'--k');
set(g(1),'linewidth',1)
set(g(2),'linewidth',2)
ylim([0.06 0.2])
xlim([80 130])
set(h,'xticklabel','')
h_pos=get(h,'position');
h_pos(4)=h_pos(4)+sub_h;
h_pos(3)=h_pos(3)+sub_h1;
set(h,'position',[h_pos(1) h_pos(2) h_pos(3) h_pos(4)])
ylabel('Current (mA)')


h=subplot(3,2,5);
set(h,'fontsize',fc,'FontName','arial')
g=plot(t3,d3(:,1),'-k',t3,d3(:,2),'--k');
set(g(1),'linewidth',1)
set(g(2),'linewidth',2)
ylim([0.06 0.2])
xlim([80 130])
xlabel('time (s)')
h_pos=get(h,'position');
h_pos(4)=h_pos(4)+sub_h;
h_pos(3)=h_pos(3)+sub_h1;
set(h,'position',[h_pos(1) h_pos(2) h_pos(3) h_pos(4)])




print -r300 -dtiff figure2.tiff

