function out=findfre(dat,dar,enum)

sdir=dat(1:7);
D=strcat(sdir,'/',dat);
data1=load(D);
    
data1=data1(1:end,:);

res_1=1; 
res_2=1; %kohms

data1=sgolayfilt(data1,2,21);
data1=[data1(:,1)/res_1 data1(:,2)/res_2];


for k=1:enum
    
data = data1(1:end,k);

subplot(2,2,1:2)
t=[0:length(data(1:end,:))-1]/dar;
g=plot(t,data(1:end,1),'-');
colr_order=get(gca,'colorOrder');
title([dat(1:7),'\',dat(8:end)]);
xlim([0 30])
hold all

data=(hilbert(data-mean(data)));
data=sgolayfilt(data,2,21);
data=data(100:end-100,:);

subplot(223)
plot(data,'color',colr_order(k,:))
grid on
axis square
axis tight
axes_handle=gca;
set(axes_handle,'LineWidth',2   )
hold all
title('E1 and E2')

data=unwrap(angle(data(100:end-100)));
t=[0:length(data)-1]'/dar;
p= polyfit(t,data,1);
fit=polyval(p,t);   

Frequency=p(1)/(2*pi); 
Fre(1,k)=Frequency;

subplot(224)
plot(t,data,'color',colr_order(k,:))
axis tight
hold all
title('E1 and E2')


end

Frequency=Fre
Fre_diff=1000*abs(diff(Fre))
Number_of_oscillations=round(t(end)*mean(Fre))

out=[Fre Number_of_oscillations];

fout=strcat(dat,'_','.tiff');
print('-dtiff','-r300', fout);
close;


 end


 
 
 
 
 


