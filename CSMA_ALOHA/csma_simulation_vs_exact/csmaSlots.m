 function  [R_system] =csmaSlots(n,d,n_frame,L)
 
 
%ע���Ƿ�������


%�������Դ���ʱ����ɹ�ռ�ݺͰ���С��ͬ��ʱ϶������һ���Դ���


packet_end=0;
%L=3;  %����
one_transmit_idx = 1;
n_delivery = zeros(n, n_frame); %n_delivery(i,f)=1 if station i deliver a packet in frame/peroid f
backoff_time=zeros(n,1);
for f=1:n_frame
    has_packet = ones(n,1);
    transmit_packet=0;
    %�����˱�ʱ��
    for i=1:n
        backoff_time(i)=setBackoffTime(d);
    end
    for t=1:d
        if t== packet_end
             has_packet(linear_idx11) = 0;%0�������֡
                   linear_idx2=linear_idx11+n*(f-1);
                  n_delivery(linear_idx2) = 1;
            transmit_packet=0;
        end
        if transmit_packet==0
            if sum(has_packet, 1) ==1
                %  %ÿһ����ӵ���1����Ϊ�������  δ����������ײ
                [idx, ~] = find(has_packet(:,one_transmit_idx));%�ڼ���/��һ��վ����
                linear_idx11=find(has_packet);
                if backoff_time (linear_idx11)  == 0
                     transmit_packet=1;  %���ڴ�����   tҪִ�е�����L֮��
                     packet_end=t+L;
                  %  has_packet(linear_idx11) = 0;%0�������֡
                  %  linear_idx2=linear_idx11+n*(f-1);
                  %  n_delivery(linear_idx2) = 1;                   
                  else
                    backoff_time(linear_idx11 )=backoff_time(linear_idx11 )-1;
                end
            end           
            %���ֶ��֡ͬʱ��������ײ
            if  sum(has_packet, 1) >1
                linear_idx11 =  find(has_packet(:,1));
                if  sum(backoff_time(linear_idx11)==0)==0              %�����а��Ľڵ���˱���������0�������ڵ��һ
                    backoff_time(linear_idx11)=backoff_time(linear_idx11 )-1;
                elseif  sum(backoff_time(linear_idx11)==0)==1
                    %�˱���Ϊ0�ĸ�����һ������Ӧ�ڵ㷢�ͣ����ඳ�ᣬ��ִ�м�һ�Ϳɱ�ʾΪ�˱ܶ���
                    %%ע���ʱҪ�а��������˱�Ϊ0
                    %ע��ÿһ�����˱�Ӧ���ǲ�һ����
                    for i=1:n
                        if  has_packet(i)==1 &&  backoff_time(i)==0
                            linear_idx11=i;
                            %has_packet(i)=0;
                           % linear_idx2 =i+n*(f-1);
                          %  n_delivery(linear_idx2) = 1;
                             transmit_packet=1;  %���ڴ�����   tҪִ�е�����L֮��
                             packet_end=t+L;
                        end   %����֡��������������е�����
                    end
                else %�˱���Ϊ0�ĸ�������һ��
                    linear_idx_1 =  find(backoff_time(:,one_transmit_idx)~=0);
                    %�˱�Ϊ0�ĸ���������������,�ҳ���Ӧ��֡����������������ڵ��1          ע���ʱҪ���˱�Ϊ0���а�ͬʱ����
                    for i=1:n
                        %ע��ÿһ�����˱�Ӧ���ǲ�һ����
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
 