%aloha 的simulation与精确模型的比较
%N=4;
L=2;
d=2:10;
n_frame=100000;
 pb=0.7;
 pc=0.6;
Empirical=zeros(size(d));
Theory=zeros(size(d));
for d_idx=1:length(d)
    D=d(d_idx);
    csma_theory=csma_avg_theory(D,pb,pc,L);
    csma_simulation=csma_avg_time( D,L,pb,pc,n_frame);
    Empirical(d_idx) = csma_simulation;
    Theory(d_idx) = csma_theory;
end
%save aloha_data_yu.mat
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
title(sprintf('pb=%1.1f,pc=%1.1f,L=%d',pb,pc,L));
box on;
grid on;
%save as PDF use export_fig, see https://www.mathworks.com/matlabcentral/fileexchange/23629-export-fig
export_fig('csma_avg', '-pdf','-transparent','-nocrop'); 

