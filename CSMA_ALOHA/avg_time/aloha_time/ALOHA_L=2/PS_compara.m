%N=4;
L=2;
D=10;
n_frame=100000; 
 PS=0.1:0.1:1;
Empirical=zeros(size(PS));
Theory=zeros(size(PS));
for PS_idx=1:length(PS)
    ps=PS(PS_idx);
    aloha_theory=aloha_avg_theoryL2(D,ps,L);
    aloha_simulation=aloha_avg_time_L2( D,n_frame,ps,L);
    Empirical(PS_idx) = aloha_simulation;
   Theory(PS_idx) = aloha_theory;
end
%save aloha_data_yu.mat
figure;
font_size = 22.4;
line_width = 3;
marker_size = 11;
set(gca,'FontSize',font_size);
hold on;
plot(PS,Theory, '-kd', 'Markersize', marker_size, 'Linewidth', line_width);
plot(PS,Empirical, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
hold off;
xlabel('$ps$', 'Interpreter', 'latex');
ylabel('Avg Time');
xlim([0,1]);
ylim([1,10]);
legend('Theory','Empirical','Location', 'Northwest'); 
title(sprintf('D=%d,L=%d',D,L));
box on;
grid on;
%save as PDF use export_fig, see https://www.mathworks.com/matlabcentral/fileexchange/23629-export-fig
export_fig('aloha_ps_avg', '-pdf','-transparent','-nocrop'); 
