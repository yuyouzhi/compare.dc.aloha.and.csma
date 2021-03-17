function[  R  ] =alohaSlots(n,d,n_frame,L)
% ���Ĵ�СΪ3��ÿһ��ʱ϶�Ը���p���ͣ�ֻ�е��������ۼƴ��꣬�ð��Ŵ���ɹ���
p_vec=0.1:0.1:1;
n_delivery = zeros(n, length(p_vec), n_frame); %n_delivery(i,f, j)=1 if station i deliver a packet in frame/peroid f under re-transmission probability p_vec(j)
%L=3;

     for f=1:n_frame
         idx_packet_succed=zeros(n,length(p_vec));
         has_packet1 = ones(n,length(p_vec));
         for t=1:d
             for i=1:n 
                 for j=1:length(p_vec)
                     if  idx_packet_succed(i,j)==L||(d-t+1<L- idx_packet_succed(i,j))   %�����ж��ٸ��Ѿ�������ɻ��߲����ܴ�
                         has_packet1(i,j)=0;
                     end  
                 end
             end            
             %transmit if rand < p and has a packet, do_transmit is of size (N,length(p_vec)
             do_transmit = has_packet1.*(rand(n,length(p_vec)) <= repmat(p_vec,n,1));
             %find those prob-systems with exactly one transmit
             one_transmit_idx = find(sum(do_transmit, 1) == 1);                  %ÿһ����ӵ���1����Ϊ�������  δ����������ײ
             [idx, ~] = find(do_transmit(:,one_transmit_idx));                   %�ڼ���/��һ��վ����
             linear_idx = sub2ind(size(has_packet1), idx', one_transmit_idx);   %����֡��������������е�����
             %sanity check
             if(has_packet1(linear_idx) ~= 1)
                 error('something wrong!');     %û���ж��Ƿ��ܽ��д���
             end
             idx_packet_succed(linear_idx)= idx_packet_succed( linear_idx)+1;                           %��Ӧ��λ����ɹ���ֻ����λ���ɹ��ˣ����������ɹ�             
             linear_idx1= find(idx_packet_succed==L );
             if  any(linear_idx1)==1
                 has_packet1(linear_idx1 ) = 0;                                                                   %0�������֡
                 linear_idx2 = linear_idx1+n*length(p_vec)*(f-1);                                                      
                 n_delivery(linear_idx2) = 1;
                 idx_packet_succed(linear_idx1)=0;
             end             
         end
       %  idx_packet_succed=zeros(n,length(p_vec));
     end
     r_station = mean(n_delivery,3)/d; %R_station(i, j) is the empirical (per-slot) timely throughput of station i under re-transmission probability p_vec(j)
     r_system = sum(r_station,1); %R_system(j) is the empirical system (per-slot) timely throughput, which is also equal to sum(R_station) under re-transmission probability p_vec(j)
     R_max_system = max(r_system);
     R=R_max_system/n;
end
