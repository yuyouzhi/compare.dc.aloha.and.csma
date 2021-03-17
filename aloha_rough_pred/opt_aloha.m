 
    
for i=3:400
         eval(['N=xlsread(''D:\data_aloha\aloha_matlab2_4.xlsx'',''sheet1'',''A',num2str(i),''')']);
    eval(['D=xlsread(''D:\data_aloha\aloha_matlab2_4.xlsx'',''sheet1'',''B',num2str(i),''')']);
     eval(['L=xlsread(''D:\data_aloha\aloha_matlab2_4.xlsx'',''sheet1'',''C',num2str(i),''')']);
    eval(['simulation_R=xlsread(''D:\data_aloha\aloha_matlab2_4.xlsx'',''sheet1'',''E',num2str(i),''')']);%“—æ≠≥À“‘L  
    tic;
    pt=1;
     ps_vec=0:0.005:1; 
Rec_R = zeros(1,length(ps_vec));
diff_r = zeros(1,length(ps_vec));

 
  for ps_idx=1:length(ps_vec)
    ps=ps_vec(ps_idx);
    aloha_rough=return_aloha_rough(D,L,pt,ps);
    Rec_R(1,ps_idx) = L*aloha_rough;
    diff_r(1,ps_idx)= L*aloha_rough-simulation_R;
  end
 
 
 [min_diff_r,optimal_ps_idx]=min( abs(diff_r));
 
  optimal_ps= ps_vec(optimal_ps_idx);
  R_rough=  Rec_R(1,optimal_ps_idx);
 
     xlswrite('D:\data_aloha\aloha_matlab2_4.xlsx',R_rough,1,['G',num2str(i)])
      xlswrite('D:\data_aloha\aloha_matlab2_4.xlsx',min_diff_r,1,['H',num2str(i)])
       xlswrite('D:\data_aloha\aloha_matlab2_4.xlsx',optimal_ps,1,['F',num2str(i)])
     
        toc;
end