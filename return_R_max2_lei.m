function [R ]=return_R_max2_lei(N,L,D)
%返回再大的系统吞吐量精确模型
%%%%%%%%%%%%%%%%%%%%%%%
%求解方程组
%为了求每个state的稳态分布，根据方程组XP=X,x1+x2+x3+..=1,将这两个公式构造成一个比p多一行的矩阵，A,求解AX=B;
%P=zeros((L+1)^N*D,(L+1)^N*D);

p_vec=[0.001:0.001:1];
Rec_R = zeros(1,length(p_vec));

for p_idx=1:length(p_vec)
    p=p_vec(p_idx);
   % P=p_transmit_aloha_lei(N,L,D,p);        %%%%%%给出一个状态转移矩阵p
    %P=p_transmit2(N,L,D )
    P=p_transmit_aloha_exact (N,D,L,p);
    pi = zeros(1,size(P,1)); %initial pi
    matrix = [zeros(N,1), zeros(N,1)];
    state0=input_matrix_output_realnumber(matrix,N,L);
    pi(state0)=1;
    state_final = pi*P^D;
   
    R=0;%R系统的吞吐量
    for i=(L+1)^N*D+1 :(L+1)^N*(D+1)
        G= input_realnumber_output_matrix(i,N,L);
        for f=1:N
            if G(f,1)==L
                R=R+state_final(i);      
                
            end
        end
    end
    Rec_R(p_idx) = R;
end
v=max(Rec_R/D)
[R_max, p_opt_idx]=max(Rec_R/D);
p_opt = p_vec(p_opt_idx);
R=R_max/N;
