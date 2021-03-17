 



     %eval(['N=xlsread(''D:\data\ps.xlsx'',''page_1'',''B',num2str(i),''')']);
   % eval(['D=xlsread(''D:\data\ps.xlsx'',''page_1'',''C',num2str(i),''')']);
   % eval(['L=xlsread(''D:\data\ps.xlsx'',''page_1'',''D',num2str(i),''')']);
   %eval(['ps=xlsread(''D:\data\ps.xlsx'',''page_1'',''E',num2str(i),''')']); 
   
   N=xlsread('D:\data\ALOHA_data.xlsx','Sheet1','A2:A901' );
   D=xlsread('D:\data\ALOHA_data.xlsx','Sheet1','B2:B901' );
    L=xlsread('D:\data\ALOHA_data.xlsx','Sheet1','C2:C901' );
     ps=xlsread('D:\data\ALOHA_data.xlsx','Sheet1','I2:I901' );
   R_pred=zeros(length(ps),1);
for i=1:length(ps)
      
      pt=1; 
      R_pred(i,1)= L(i)*N(i)*return_aloha_rough(D(i),L(i),pt,ps(i)); 
end
  
      xlswrite('D:\data\ALOHA_R_pred.xlsx',R_pred);