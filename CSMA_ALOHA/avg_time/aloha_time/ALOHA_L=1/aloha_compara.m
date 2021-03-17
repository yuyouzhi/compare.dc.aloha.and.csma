 
L=1;
d=2:5;
n_frame=100000;
 ps=0.6;
Rec_rate2=zeros(size(d));
Rec_rate3=zeros(size(d));
for d_idx=1:length(d)
    D=d(d_idx);
    aloha_theory=aloha_avg_theory(D,ps);
  aloha_simulation=aloha_avg_time_L( D,n_frame,ps,L);
    Rec_rate2(d_idx) = aloha_simulation;
    Rec_rate3(d_idx) = aloha_theory;
  
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
title(sprintf('ps=%1.1f,L=%d',ps,L));
export_fig('delay_perc', '-pdf','-transparent','-nocrop'); 
