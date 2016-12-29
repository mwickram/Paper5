function [data_out]=batchrun200(base)


number=[5 7];
R=[10 10.526];



for k=1:length(number)
   
    n=number(k);
    numbern=[n-1 n n+1];
    
    
    for m=1:length(numbern)
        
    filename=strcat(base,'_',num2str(numbern(m)),'.dat');
    fname(k,m)={filename}; 
    %First row and third row have natural fre of 2 oscillators, 
    %2nd row has coupled fre:of 2 oscillators
       
    c=findfre200(filename,200,2); %findfre(d,rate,enum)
    

    data(m,1:2)=c(1:2);
    num_osc(m,:)=c(3);
    
    end
    
    datan(k,1)=n;
    data1(k,1)=R(k);
    data1(k,2:3)=data(2,1:2);
    %data1(k,4)=mean([data(1,2)-data(1,1), data(3,2)- data(3,1)]);
    %This should be positive the fast oscillator-slow oscillator. (1st row:
    %before coupling, 3rd row: after coupling). same as 
    data1(k,4)=mean([abs(diff(data(1,:))),abs(diff(data(3,:)))]);% Used for easy of coding. 
    data1(k,5)=mean([data(1,1:2) data(3,1:2)]);%mean of natural frequencies
    data1(k,6)=num_osc(2);%number of oscillations of coupled case
    filename=strcat(base,'_',num2str(number(k)),'.dat');
    fname1(k,1)={filename};
         
end


data_out=[datan data1];

filename=fname
filename1=char(fname1)

end

  

