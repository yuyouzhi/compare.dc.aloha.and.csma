 
       N=xlsread('D:\data\CSMA_data.xlsx','sheet1','A2:A399');
        D=xlsread('D:\data\CSMA_data.xlsx','sheet1','B2:B399');
       L=xlsread('D:\data\CSMA_data.xlsx','sheet1','C2:C399');
       PB=xlsread('D:\data\CSMA_data.xlsx','sheet1','J2:J399');
      PC=xlsread('D:\data\CSMA_data.xlsx','sheet1','L2:L399');
      
       R_pred=zeros(length(PC),1);
 for i=1:length(PC)  
      R_pred(i,1)=N(i)*L(i)* return_csma_one(D(i),L(i),PB(i),PC(i));
 end    
        xlswrite('D:\data\CSMA_R_pred.xlsx', R_pred);
         