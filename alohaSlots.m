function[  R  ] =alohaSlots(n,d,n_frame,L)
% 包的大小为3，每一个时隙以概率p发送，只有当整个包累计传完，该包才传输成功，
p_vec=0.1:0.1:1;
n_delivery = zeros(n, length(p_vec), n_frame); %n_delivery(i,f, j)=1 if station i deliver a packet in frame/peroid f under re-transmission probability p_vec(j)
%L=3;

     for f=1:n_frame
         idx_packet_succed=zeros(n,length(p_vec));
         has_packet1 = ones(n,length(p_vec));
         for t=1:d
             for i=1:n 
                 for j=1:length(p_vec)
                     if  idx_packet_succed(i,j)==L||(d-t+1<L- idx_packet_succed(i,j))   %计算有多少个已经传输完成或者不可能传
                         has_packet1(i,j)=0;
                     end  
                 end
             end            
             %transmit if rand < p and has a packet, do_transmit is of size (N,length(p_vec)
             do_transmit = has_packet1.*(rand(n,length(p_vec)) <= repmat(p_vec,n,1));
             %find those prob-systems with exactly one transmit
             one_transmit_idx = find(sum(do_transmit, 1) == 1);                  %每一列相加等于1，列为传输概率  未体现两种碰撞
             [idx, ~] = find(do_transmit(:,one_transmit_idx));                   %第几行/哪一个站传输
             linear_idx = sub2ind(size(has_packet1), idx', one_transmit_idx);   %传输帧在整个传输矩阵中的索引
             %sanity check
             if(has_packet1(linear_idx) ~= 1)
                 error('something wrong!');     %没有判断是否还能进行传输
             end
             idx_packet_succed(linear_idx)= idx_packet_succed( linear_idx)+1;                           %对应的位传输成功，只有三位都成功了，这个包才算成功             
             linear_idx1= find(idx_packet_succed==L );
             if  any(linear_idx1)==1
                 has_packet1(linear_idx1 ) = 0;                                                                   %0代表传输该帧
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
