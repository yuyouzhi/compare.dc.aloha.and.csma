 
    
for i=180:200
         eval(['N=xlsread(''D:\data_csma\csma_matlab9.xlsx'',''sheet1'',''A',num2str(i),''')']);
    eval(['D=xlsread(''D:\data_csma\csma_matlab9.xlsx'',''sheet1'',''B',num2str(i),''')']);
     eval(['L=xlsread(''D:\data_csma\csma_matlab9.xlsx'',''sheet1'',''C',num2str(i),''')']);
    eval(['simulation_R=xlsread(''D:\data_csma\csma_matlab9.xlsx'',''sheet1'',''D',num2str(i),''')']);  
    tic;
     pb_vec=0.01:0.01:1;
     pc_vec=0.01:0.01:1; 
Rec_R = zeros(length(pb_vec),length(pc_vec));
diff_r = zeros(length(pb_vec),length(pc_vec));

for pb_idx=1:length(pb_vec)
    pb=pb_vec(pb_idx); 
  for pc_idx=1:length(pc_vec)
    pc=pc_vec(pc_idx);
    csam_rough=return_csma_one(D,L,pb,pc); 
    Rec_R(pb_idx,pc_idx) = N*L*csam_rough;
    diff_r(pb_idx,pc_idx)= N*L*csam_rough-simulation_R;
  end
end
min_diff_r=min(min( abs(diff_r)));
 [optimal_pb_idx,optimal_pc_idx]=find(abs(diff_r)==min(min( abs(diff_r))));
 optimal_pb= pb_vec(optimal_pb_idx);
  optimal_pc= pc_vec(optimal_pc_idx);
  R_rough=  Rec_R(optimal_pb_idx,optimal_pc_idx);
 
     xlswrite('D:\data_csma\csma_matlab9.xlsx',R_rough,1,['G',num2str(i)])
      xlswrite('D:\data_csma\csma_matlab9.xlsx',min_diff_r,1,['H',num2str(i)])
       xlswrite('D:\data_csma\csma_matlab9.xlsx',optimal_pc,1,['F',num2str(i)])
        xlswrite('D:\data_csma\csma_matlab9.xlsx',optimal_pb,1,['E',num2str(i)])    
        toc;
end