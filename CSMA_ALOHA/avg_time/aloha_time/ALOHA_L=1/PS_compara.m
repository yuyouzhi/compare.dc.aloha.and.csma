N=4;
L=1;
D=4;
n_frame=10000;
 
 PS=0.1:0.1:1;
Rec_rate2=zeros(size(PS));
Rec_rate3=zeros(size(PS));
for PS_idx=1:length(PS)
    ps=PS(PS_idx);
    aloha_theory=aloha_avg_theory(D,ps);
  aloha_simulation=aloha_avg_time_L( D,n_frame,ps,L);
    Rec_rate2(PS_idx) = aloha_simulation;
    Rec_rate3(PS_idx) = aloha_theory;
  
end
%save aloha_data_yu.mat
figure;
font_size = 10;
line_width = 1;
marker_size = 5;
set(gca,'FontSize',font_size);
hold on; 
 
plot(PS,Rec_rate2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
plot(PS,Rec_rate3, '-kd', 'Markersize', marker_size, 'Linewidth', line_width);
 
hold off;
legend('Empirical', 'Theory','Location', 'Northwest'); 
%legend('Exact','Simu');
xlabel('D');
ylabel('R(N,D,L)');
title(sprintf('N=%d,L=%d',N,L));