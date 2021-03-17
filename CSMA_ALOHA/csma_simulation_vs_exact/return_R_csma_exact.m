function [R]=return_R_csma_exact(N,D,L)
%返回系统吞吐量精确模型

    P=csma_p_transmit_exact1(N,D,L);         %%%%%%给出一个状态转移矩阵p 
    pi = zeros(1,size(P,1)); %initial pi
    matrix = zeros(N,3);
    state0=input_matrix(N,D,L,matrix);
    pi(state0)=1;
    state_final = pi*(P^(D+1)); 
    R=0;%R系统的吞吐量
    for i=(D*(L+1))^N*(D+1)+1:(D*(L+1))^N*(D+2)
        G= input_state1(N,D,L,i);
        for f=1:N
            if G(f,2)==L
                R=R+state_final(i);
            end
        end
    end
   R=R/D;
   R=R/N;
end

 