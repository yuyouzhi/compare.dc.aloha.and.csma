
L=2;
d=2:10;
 
 pb=0.7;
 pc=0.6;
 
Theory =[ 2.0000    2.4118    2.7893    3.2009    3.6439    4.1076    4.5853    5.0727    5.5674];
Empirical =[ 2.0000    2.4085    2.7821    3.2013    3.6436    4.0984    4.6141    5.0922    5.5026];
figure;
font_size = 18;
line_width = 3;
marker_size = 11;
set(gca,'FontSize',font_size);
hold on;
plot(d,Empirical, '-rs', 'Markersize', marker_size, 'Linewidth', line_width); %ALOHA Theory
plot(d,Theory, '--b+', 'Markersize', marker_size-3, 'Linewidth', line_width-1); %ALOHA Empirical
 
hold off;
xlabel('$D$', 'Interpreter', 'latex');
ylabel('System Timely Throughput');
xlim([2,10]);
ylim([0,7]);
legend('Theory', 'Empirical', 'Location', 'southeast');
title('$pb=0.7,pc=0.6,L=2$','Interpreter', 'latex');
box on;
grid on;
%save as PDF use export_fig, see https://www.mathworks.com/matlabcentral/fileexchange/23629-export-fig
export_fig('csma_avg', '-pdf','-transparent','-nocrop'); 