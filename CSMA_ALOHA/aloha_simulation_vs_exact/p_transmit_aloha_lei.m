%可用精确模型
function [  P]=p_transmit_aloha_lei(N,L,D,p)
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%设重传概率是p,求ALOHA的转移矩阵
P=zeros((L+1)^N*(D+1));  %定义转移矩阵
g=N;
s_t=0;
%给一个表示第几个状态的实数求出所有N时的状态（s,t）
%判断求出的矩阵（s,t）在的s是否等于L,如果等于L的个数为x，则竞争站数减少x个，或者D-t>=s
for s=1:(L+1)^N*(D+1) %表示第几个状态
    state_matrix=input_realnumber_output_matrix(s,N,L);
    state_matrix3=zeros(N,2);
    j=state_matrix(1,2);
    h1= state_matrix(:,1);
    h3=zeros(1,length(h1));
    for i=1:length(h1)
        if h1(i)<L
            h3(i)=h1(i);
        else
            h3(i)=0;
        end
    end
    n=0;%没有参加竞争站点数
    if s<=(L+1)^N*D       %在t=D后全部转移回去
        for i=1:N
            if state_matrix(i,1)==L||(D-state_matrix(i,2)<L-state_matrix(i,1))   %计算有多少个已经传输完成或者不可能传输成功
                n=n+1;
            end
        end
        g=N-n;   %还有多少个在传
        for q=1:N
            s_t=s_t+(state_matrix(q,1)) ;
        end
        if s_t<=state_matrix(1,2)
            if n<N-1
                for  s1 =(j+1)*(L+1)^N+1:(j+2)*(L+1)^N
                    state_matrix1=input_realnumber_output_matrix(s1,N,L);
                    h2= state_matrix1(:,1);
                    for q=1:N
                        s_t=s_t+(state_matrix1(q,1)) ;
                    end
                    if s_t<=state_matrix1(1,2)          %去掉不存在的状态
                        w_sum=0;
                        w1=0;
                        for i=1:N
                            if   h2(i)==h1(i)
                                w_sum=w_sum+1;
                            else
                                w=h2(i)-h1(i);
                            end
                            if h1(i)==L
                                w1=w1+1;
                            end
                        end
                        if  s1==s+(L+1)^N
                            if w1==N         %已经传完N个
                                P(s,s1)=1;
                            else
                                P(s,s1)=1-g*p*(1-p)^(g-1);
                            end
                        elseif  ( w_sum==N-1)&&(w==1)
                            P(s,s1)=p*(1-p)^(g-1);
                        end
                    end
                    s_t=0;
                end
            elseif n==N
                P(s,s+(L+1)^N)=1;
            else
                for i=1:N
                    if state_matrix(i,1)<L
                        if D-state_matrix(i,2)>=L-state_matrix(i,1)
                            index1=i;
                        end
                    end
                end
                state= max(index1);      %最大值的位置
                for  i=1:N
                    state_matrix3(:,2) =state_matrix(:,2)+1;
                    if i== state
                        state_matrix3(i,1) =state_matrix(i,1)+1;
                    else
                        state_matrix3(i,1) =state_matrix(i,1) ;
                    end
                end
                s6=input_matrix_output_realnumber( state_matrix3,N,L);
                P(s,s6)=1;
            end
        end
    else
        P(s,1)=1;
    end
    s_t=0;
end
  len1=length(P(1,:));
  add_len1=zeros((L+1)^N*(D+1),(L+1)^N*(D+1)-len1 );
  P=[P add_len1];
  toc
end

  % s1=s+(L+1)^N;           %s1表示s之后可能到达的状态 
 