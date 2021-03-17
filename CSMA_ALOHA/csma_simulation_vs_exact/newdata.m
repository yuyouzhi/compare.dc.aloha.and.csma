n=2:4;
n_frame=100000;
exact_R=zeros(1000,1);
size_L_write=zeros(1000,1) ;
d_write=zeros(1000,1);
node_write=zeros(10000,1);
sum_d=0;

 
   for L=1:6
        for D=L+1:20
             for n=2:4
              sum_d=sum_d+1; 
               node_write( sum_d,1)=n;
               d_write( sum_d,1)=D;
               size_L_write( sum_d,1)=L; 
              one_R_system= csmaSlots_simulation(n,D,n_frame,L);      
              exact_R( sum_d,1)= one_R_system*L;              
             end
        end
   end

 xlswrite('D:\data_csma\new2_4.xlsx',node_write,'A2:A900');
  xlswrite('D:\data_csma\new2_4.xlsx', d_write,'B2:B900');
 xlswrite('D:\data_csma\new2_4.xlsx', size_L_write,'C2:C900');
xlswrite('D:\data_csma\new2_4.xlsx',exact_R,'D2:D900');