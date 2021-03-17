%csma精确模型的概率转移矩阵
function [ P]=csma_p_transmit_exact1(N,D,L)               
P=zeros(((L+1)*D)^N*(D+2),((L+1)*D)^N*(D+2));
for s=1:((L+1)*D)^N*(D+2)
    backofftime0=0;
    have_packet=ones(N,1);
    matrix = input_state1(N,D,L,s);
    tt = matrix(1,3);
    back0=zeros(N,1);
    if(tt==0)
        if s==1
            for s2=(D*(L+1))^N+1:((D*(L+1))^N)*2
                matrix2=input_state1(N,D,L,s2);
                if matrix2(:,2)==0
                    P(s,s2)=1/(D^N);
                end
            end
        else                                                      %invalid state
            P(s,s)=1;
        end
    elseif (tt<D+1) %tt=1,2,...,D
        for i=1:N
            if (  matrix(i,2)==L || ( L-matrix(i,2)> D - mod(matrix(i,3)-1,D)))  % the packet has been successfully deliveredy or cannot complete the delivery even it transmits in the rest of slots before the end of the period.
                have_packet(i,1)=0;                                        %判断还可以传输包的节点
            end
            if have_packet(i,1)==1
                if matrix(i,1)==0                                         %判断正在传输的包的退避数为0的个数
                    backofftime0=backofftime0+1;
                    back0(i,1)=1;
                end
            end
        end
        if  backofftime0==0
            lin=find(have_packet);
            matrix1=matrix;
            matrix1(lin,1)=matrix(lin,1)-1;
             matrix1(:,3)=matrix1(:,3)+1;
            s2=input_matrix(N,D,L,matrix1);
            P(s,s2)=1;
        elseif backofftime0==1
            transmit=find(back0);
            matrix1=matrix;
            matrix1(transmit,2)=matrix1(transmit,2)+1;
             matrix1(:,3)=matrix1(:,3)+1;
            s2=input_matrix(N,D,L,matrix1);
            P(s,s2)=1;
        else
            for s1=(tt+1)*(D*(L+1))^N+1:(tt+2)*(D*(L+1))^N
                matrix1=input_state1(N,D,L,s1);               
               for i=1:N
                    if  matrix1(i,2)~=matrix(i,2)
                        break;
                    end
                    if  back0(i,1)==0
                        if matrix1(i,1)~=matrix(i,1)
                            break;
                        end
                    end
                    if i==N
                        P(s,s1)=1/(D^sum(back0));
                    end
                end
                
            end
        end
    else
        P(s,1)=1;
    end
end
end
