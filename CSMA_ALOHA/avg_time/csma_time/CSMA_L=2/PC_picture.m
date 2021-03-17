%aloha 的simulation与精确模型的比较
%N=4;
L=1;
PC=0.1:0.1:1;
n_frame=100000;
 D=4;
 pb=0.9;
Rec_rate2=zeros(size(PC));
Rec_rate3=zeros(size(PC));
 
 
for d_idx=1:length(PC)
    pc=PC(d_idx);
    csma_theory=csma_avg_theory(D,pb,pc);
    csma_simulation=csma_avg_time( D,L,pb,pc,n_frame);
    Rec_rate2(d_idx) = csma_simulation;
    Rec_rate3(d_idx) = csma_theory;
  
end
%save aloha_data_yu.mat
figure;
font_size = 10;
line_width = 1;
marker_size = 5;
set(gca,'FontSize',font_size);
hold on; 
 
plot(PC,Rec_rate2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
plot(PC,Rec_rate3, '-kd', 'Markersize', marker_size, 'Linewidth', line_width);
 
hold off;
 
legend('Exact','Simu');
xlabel('pc');
ylabel('R(N,D,L)');
title(sprintf('N=%d,L=%d',N,L));
legend('Empirical', 'Theory','Location', 'Northwest');