function phase_difference(dat,dar,enum)

dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');
sdir=dat(1:7);
D=strcat(dn,sdir,'\',dat);
data1=load(D);


data1=sgolayfilt(data1,1,111);

for k=1:enum
    
data = data1(1:end,k);
data=hilbert(data-mean(data));


data=data(100:end-100);
data=sgolayfilt(data,2,11);
p(:,k)=unwrap(angle(data));
t=[0:length(p)-1]'/dar;


end


subplot(2,2,1)
plot(t,p(:,1)-p(:,2))
title([dat(1:7),'\',dat(8:end)]);
%ylim([0 12])

%fout=strcat(dat,'_','.tiff');
%print('-dtiff','-r300', fout);
%close;


 end


 
 
 
 
 


