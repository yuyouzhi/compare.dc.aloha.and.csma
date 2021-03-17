%N=2;
L=2;
d=2:10;
n_frame=100000;
 
ps=0.4;
Empirical=zeros(size(d));
Theory=zeros(size(d));
for d_idx=1:length(d)
    D=d(d_idx);
    aloha_theory=aloha_avg_theoryL2(D,ps,L);
    aloha_simulation=aloha_avg_time_L2( D,n_frame,ps,L);
    Empirical(d_idx) = aloha_simulation;
    Theory(d_idx) = aloha_theory;
  
end
%save aloha_data_yu.mat
%figure;
%font_size = 10;
%line_width = 1;
%marker_size = 5;
%set(gca,'FontSize',font_size);
%hold on;  
%plot(d,Rec_rate2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
%plot(d,Rec_rate3, '-kd', 'Markersize', marker_size, 'Linewidth', line_width);
%hold off;
%legend('Empirical', 'Theory','Location', 'Northwest'); 
 %xlabel('D');
%ylabel('R(N,D,L)');
%title(sprintf('N=%d,L=%d',N,L));

figure;
font_size = 22.4;
line_width = 3;
marker_size = 11;
set(gca,'FontSize',font_size);
hold on;
plot(d,Theory, '-kd', 'Markersize', marker_size, 'Linewidth', line_width);
plot(d,Empirical, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
hold off;
xlabel('$D$', 'Interpreter', 'latex');
ylabel('Avg Time');
xlim([2,10]);
ylim([1,10]);
legend('Theory','Empirical','Location', 'Northwest'); 
title(sprintf('ps=%1.1f,L=%d',ps,L));
box on;
grid on;
%save as PDF use export_fig, see https://www.mathworks.com/matlabcentral/fileexchange/23629-export-fig
export_fig('aloha_avg', '-pdf','-transparent','-nocrop'); 
