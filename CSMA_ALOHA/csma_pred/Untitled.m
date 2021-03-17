 %function [R]=return_csma_one(D,L,pb,pc) 
N=2;
D=2;
 L=1;
 pb=0.91




 pc=0.71




 tic;
        % P=csma_p_transmit_3D(L,D,pb,pc);       %%%%%%给出一个状态转移矩阵p  
      % P  =xlsread('D:\csma_data\rough_csma.xlsx');
       %  diff=P-P1 
       P=csma_p_transmit_3D_lei( L,D ,pb,pc );
        pi = zeros(1,size(P,1)); %initial pi
        matrix = zeros(1,3);
        state0=input_matrix_output_integer_3D(D,L,matrix);  
        pi(state0)=1;
        tic;
        state_final = pi*(P^(D+1));
        toc;
        R=0;%R系统的吞吐量
        for t=(L+1)*D*(D+1)+1 :(L+1)*D*(D+2)
            G= input_integer_output_matrix_3D(D,L,t);       
                if G(1,2)==L
                    R=R+state_final(t);
                end
        end
       R=R/D;
       R=R*N*L
   
 