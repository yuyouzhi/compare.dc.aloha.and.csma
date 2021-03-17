 N=3
 D=9;
 L=6;
 pt=1;
 ps=0.328







       P=p_transmit_aloha_rough (D,L,pt,ps);
        pi = zeros(1,size(P,1)); %initial pi
        matrix = zeros(1,2);
        state0=input_matrix_output_state_aloha(matrix,L);
        pi(state0)=1;
        state_final = pi*(P^D);
        R=0;%R系统的吞吐量
        for t=(L+1)*D+1 :(L+1)*(D+1)
            G= input_state_output_matrix_aloha(t,L);
                if G(1,1)==L
                    R=R+state_final(t);
                end
        end
    R=R/D;
    r=R*N*L