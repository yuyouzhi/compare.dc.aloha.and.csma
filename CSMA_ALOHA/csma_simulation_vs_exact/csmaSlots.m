 function  [R_system] =csmaSlots(n,d,n_frame,L)
 
 
%注意是否有问题


%当包可以传输时，会成功占据和包大小相同的时隙个数，一次性传完


packet_end=0;
%L=3;  %包长
one_transmit_idx = 1;
n_delivery = zeros(n, n_frame); %n_delivery(i,f)=1 if station i deliver a packet in frame/peroid f
backoff_time=zeros(n,1);
for f=1:n_frame
    has_packet = ones(n,1);
    transmit_packet=0;
    %设置退避时间
    for i=1:n
        backoff_time(i)=setBackoffTime(d);
    end
    for t=1:d
        if t== packet_end
             has_packet(linear_idx11) = 0;%0代表传输该帧
                   linear_idx2=linear_idx11+n*(f-1);
                  n_delivery(linear_idx2) = 1;
            transmit_packet=0;
        end
        if transmit_packet==0
            if sum(has_packet, 1) ==1
                %  %每一列相加等于1，列为传输概率  未体现两种碰撞
                [idx, ~] = find(has_packet(:,one_transmit_idx));%第几行/哪一个站传输
                linear_idx11=find(has_packet);
                if backoff_time (linear_idx11)  == 0
                     transmit_packet=1;  %还在传输中   t要执行到包场L之后
                     packet_end=t+L;
                  %  has_packet(linear_idx11) = 0;%0代表传输该帧
                  %  linear_idx2=linear_idx11+n*(f-1);
                  %  n_delivery(linear_idx2) = 1;                   
                  else
                    backoff_time(linear_idx11 )=backoff_time(linear_idx11 )-1;
                end
            end           
            %出现多个帧同时发，有碰撞
            if  sum(has_packet, 1) >1
                linear_idx11 =  find(has_packet(:,1));
                if  sum(backoff_time(linear_idx11)==0)==0              %所有有包的节点的退避数都不是0，各个节点减一
                    backoff_time(linear_idx11)=backoff_time(linear_idx11 )-1;
                elseif  sum(backoff_time(linear_idx11)==0)==1
                    %退避数为0的个数是一个，对应节点发送，其余冻结，不执行减一就可表示为退避冻结
                    %%注意此时要有包存在且退避为0
                    %注意每一包的退避应该是不一样的
                    for i=1:n
                        if  has_packet(i)==1 &&  backoff_time(i)==0
                            linear_idx11=i;
                            %has_packet(i)=0;
                           % linear_idx2 =i+n*(f-1);
                          %  n_delivery(linear_idx2) = 1;
                             transmit_packet=1;  %还在传输中   t要执行到包场L之后
                             packet_end=t+L;
                        end   %传输帧在整个传输矩阵中的索引
                    end
                else %退避数为0的个数大于一个
                    linear_idx_1 =  find(backoff_time(:,one_transmit_idx)~=0);
                    %退避为0的个数有两个及以上,找出对应的帧，重新置数，其余节点减1          注意此时要是退避为0和有包同时存在
                    for i=1:n
                        %注意每一包的退避应该是不一样的
                        if    has_packet(i)==1&& backoff_time(i)==0
                            backoff_time(i)=setBackoffTime(d);
                        end
                    end
                    backoff_time(linear_idx_1 )=backoff_time(linear_idx_1 )-1;
                end
            end
        end
    end
end
R_station= mean( n_delivery,2)/d;
R_system = sum(R_station,1);
 