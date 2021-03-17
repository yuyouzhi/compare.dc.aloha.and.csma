%aloha 的simulation与精确模型的比较
N=3;
L=2;
D=3:10;
n_frame=100000;
%Rec_rate1=zeros(size(D));
Rec_rate2=zeros(size(D));
Rec_rate3=zeros(size(D));
%Rec_rate4=zeros(size(D));
syms p;
for d_idx=1:length(D)
    d=D(d_idx);
   % aloha_excat=return_R_max2(N,L,d,p);
    aloha_excat_lei=L*return_R_max2_lei(N,L,d);
    aloha_simulation=L*alohaSlots(N,d,n_frame,L);  
   % Rec_rate1(d_idx) = ((d+1)*aloha_excat)/d;
    Rec_rate2(d_idx) = aloha_simulation;
    Rec_rate3(d_idx) = aloha_excat_lei;
    %p-constant slotted ALOHA
   % p_vec = 0:0.01:1;
   % R_system_p_constant_emp1 = aloha_L_1_lei(d,N,p_vec, n_frame);
  %  Rec_rate4(d_idx)=max(R_system_p_constant_emp1);

end
save aloha_data_yu.mat
figure;
font_size = 10;
line_width = 1;
marker_size = 5;
set(gca,'FontSize',font_size);
hold on; 
%plot(D,Rec_rate1, '-bo', 'Markersize', marker_size, 'Linewidth', line_width);
plot(D,Rec_rate2, '-rs', 'Markersize', marker_size, 'Linewidth', line_width);
plot(D,Rec_rate3, '-kd', 'Markersize', marker_size, 'Linewidth', line_width);
%plot(D,Rec_rate4, '-gx', 'Markersize', marker_size, 'Linewidth', line_width);
hold off;
%legend('Exact','Simu','Exact-lei','L=1-lei');
legend('Exact','Simu');
xlabel('D');
ylabel('R(N,D,L)');
title(sprintf('N=%d,L=%d',N,L));
legend('Empirical', 'Theory','Location', 'Northwest');
