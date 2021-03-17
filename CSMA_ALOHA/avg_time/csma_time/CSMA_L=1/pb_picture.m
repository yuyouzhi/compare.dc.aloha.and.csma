%aloha 的simulation与精确模型的比较
%N=4;
L=1;
PB=0.1:0.1:1;
n_frame=10000;
 D=4;
 pc=0.9;
Rec_rate2=zeros(size(PB));
Rec_rate3=zeros(size(PB));
 
 
for d_idx=1:length(PB)
    pb=PB(d_idx);
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
 
plot(PB,Rec_rate2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
plot(PB,Rec_rate3, '-kd', 'Markersize', marker_size, 'Linewidth', line_width);
 
hold off;
 
legend('Exact','Simu');
xlabel('pb');
ylabel('R(N,D,L)');
title(sprintf('N=%d,L=%d',N,L));
legend('Empirical', 'Theory','Location', 'Northwest');