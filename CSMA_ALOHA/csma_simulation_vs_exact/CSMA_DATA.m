node=11;
n_frame=100000;
exact_R=zeros(60*length(node),1);
size_L_write=zeros(60*length(node ),1) ;
d_write=zeros(60*length(node ),1);
node_write=zeros(60*length(node ),1);
sum_d=0;
for node_index=1:length(node)
    for L=1:6
        for D=L+1:L*node(node_index)+2
            if D>L
                sum_d=sum_d+1;
                N= node(node_index);               
                 node_write( sum_d,1)=node(node_index);
                one_R_system= csmaSlots_simulation(N,D,n_frame,L);                        
                d_write( sum_d,1)=D;
                exact_R( sum_d,1)= one_R_system*L;
                size_L_write( sum_d,1)=L;
            end
        end
    end 
end
 xlswrite('D:\data_csma\csma_matlab11.xlsx',node_write,'A3:A300');
 xlswrite('D:\data_csma\csma_matlab11.xlsx', size_L_write,'C3:C300');
 xlswrite('D:\data_csma\csma_matlab11.xlsx', d_write,'B3:B300');
xlswrite('D:\data_csma\csma_matlab11.xlsx',exact_R,'D3:D300');