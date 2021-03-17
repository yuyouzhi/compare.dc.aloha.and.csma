function [  P]=p_transmit_aloha_exact (N,D,L,p)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���ش�������p,��ALOHA��ת�ƾ���
P=zeros((L+1)^N*(D+1));  %����ת�ƾ���
%��һ����ʾ�ڼ���״̬��ʵ���������Nʱ��״̬��s,t��
%�ж�����ľ���s,t���ڵ�s�Ƿ����L,�������L�ĸ���Ϊx������վ������x��������D-t>=s
for s=1:(L+1)^N*(D+1) %��ʾ�ڼ���״̬
    have_packet=ones(N,1);
    state_matrix=input_realnumber_output_matrix(s,N,L);
    if  state_matrix(1,2)==0
    if s==1
         state_matrix1= state_matrix;
         state_matrix1(:,2)= state_matrix(:,2)+1;
         s1=input_matrix_output_realnumber( state_matrix1,N,L);
                P(s,s1)=1-N*p*(1-p)^(N-1);
        for i=1:N
            state_matrix1(i,1)= state_matrix1(i,1)+1;
            s1=input_matrix_output_realnumber( state_matrix1,N,L);
            P(s,s1)=p*(1-p)^(N-1);
             state_matrix1(i,1)= state_matrix1(i,1)-1;
        end
    else
        P(s,s)=1;
    end
    elseif   state_matrix(1,2)<D
        for i=1:N
            if state_matrix(i,1)==L||(D-state_matrix(i,2)<L-state_matrix(i,1))   %�����ж��ٸ��Ѿ�������ɻ��߲����ܴ�
                  have_packet(i,1)=0;
            end  
        end
        node=sum( have_packet);
         state_matrix1= state_matrix;
         state_matrix1(:,2)= state_matrix(:,2)+1;
         s1=input_matrix_output_realnumber( state_matrix1,N,L);
                P(s,s1)=1-node*p*(1-p)^(node-1);
                for i=1:N
                     state_matrix1(:,1)= state_matrix(:,1);
                    if   have_packet(i,1)==1
                         state_matrix1(i,1)= state_matrix1(i,1)+1; 
                       s1=input_matrix_output_realnumber( state_matrix1,N,L);
                       P(s,s1)=p*(1-p)^(node-1);
                    end        
                end
    else
        P(s,1)=1;      
    end
end
end