%aloha 的simulation与精确模型的比较
N=3;
L=2;
D=2:10;
n_frame=10000 ;
 Rec_rate1=zeros(size(D));
 Rec_rate2=zeros(size(D));
for d_idx=1:length(D)
    d=D(d_idx);
    aloha_excat=return_R_max2(N,L,d);
    aloha_simulation=alohaSlots(N,d,n_frame,L);  
     Rec_rate1(d_idx) = aloha_excat;
     Rec_rate2(d_idx) = aloha_simulation;
end
save aloha_data.mat
figure;
font_size = 10;
line_width = 1;
marker_size = 5;
set(gca,'FontSize',font_size);
hold on; 
plot(D,Rec_rate1, '-bo', 'Markersize', marker_size, 'Linewidth', line_width);
plot(D,Rec_rate2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width)
hold off;
xlabel('时限D');
ylabel(' sub_R(N,D,L)');
legend('N=3,L=2','Location', 'Northeast');
