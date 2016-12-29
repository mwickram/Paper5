function figure6

number=[6 15 12 9 7];
%n=[2 4 6 8];


for k=1:length(number)

filename=strcat('m102212/','m102212_',num2str(number(k)),'.dat');
d=load(filename);    
d=sgolayfilt(d,2,7);
    
h=subplot(5,1,k);
set(h,'fontsize',16)

t=[0:length(d)-1]'/200;

g=plot(t,d(:,1),'-k',t,d(:,2),'--k');
set(g(1),'linewidth',1.1)
set(g(2),'linewidth',2)
ylim([0.1 0.55])
xlim([0 50])
  

end



figinx=[1:5];

for m=1:length(figinx)-1 
h=subplot(5,1,figinx(m));
set(h,'XTickLabel','')
end


for m=1:length(figinx) 
 h=subplot(5,1,figinx(m));
 hpos=get(h,'position');
 hpos(4)=hpos(4)+0.047;
 set(h,'position',hpos)

end



print -r600 figure6.tiff

end