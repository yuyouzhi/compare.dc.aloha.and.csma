 

N=3;
L=2;
d_vec=2
n_frame=100000
Rec_rate1=zeros(size(d_vec));
 Rec_rate2=zeros(size(d_vec));
for d_inx=1:length(d_vec)
    D=d_vec(d_inx);
     Rec_rate1(d_inx)= L*csmaSlots_simulation(N,D,n_frame,L);
      Rec_rate2(d_inx)=L*return_R_csma_exact(N,D,L);
end
save csma.mat
figure;
font_size = 10;
line_width = 1;
marker_size = 5;
set(gca,'FontSize',font_size);
hold on; 
plot(d_vec,Rec_rate1, '-bo', 'Markersize', marker_size, 'Linewidth', line_width);
plot(d_vec,Rec_rate2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
hold off;
xlabel('D ');
ylabel('R(N,D,L)');
title(sprintf('N=%d,L=%d',N,L));
legend('Empirical', 'Theory','Location', 'Northeast');