lambda = 0:10;
cost1 = lambda.^2;
cost2 = lambda.^2+10;

figure;
font_size = 22.4;
line_width = 3;
marker_size = 11;
set(gca,'FontSize',font_size);
hold on;
plot(lambda, cost1, '-bo', 'Markersize', marker_size, 'Linewidth', line_width);
plot(lambda, cost2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
hold off;
xlabel('$\lambda$', 'Interpreter', 'latex');
ylabel('Cost');
xlim([0,10]);
ylim([0,120]);
legend('Cost1', 'Cost2', 'Location', 'Northwest');
box on;
grid on;
%save as PDF use export_fig, see https://www.mathworks.com/matlabcentral/fileexchange/23629-export-fig
export_fig('delay_perc', '-pdf','-transparent','-nocrop'); 
