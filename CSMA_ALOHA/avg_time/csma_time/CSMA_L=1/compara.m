%aloha 的simulation与精确模型的比较
 
L=1;
d=2:5;
n_frame=100000;
 pb=0.4;
 pc=0.7;
Rec_rate2=zeros(size(d));
Rec_rate3=zeros(size(d));
for d_idx=1:length(d)
    D=d(d_idx);
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
 
plot(d,Rec_rate2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
plot(d,Rec_rate3, '-kd', 'Markersize', marker_size, 'Linewidth', line_width);
 
hold off;
legend('Empirical', 'Theory','Location', 'Northwest'); 
%legend('Exact','Simu');
xlabel('D');
ylabel('avgTime');
title(sprintf('pb=%1.1f,pc=%1.1f',pb,pc));
