
function[ success_pro]=L2_aloha(D,ps,k,L)
 %(L,T,K)
P=aloha_transimit_L2(D,L,ps);
pi = zeros(1,size(P,1)); %initial pi
matrix = zeros(1,3);
matrix(1,1)=0;
matrix(1,2)=1;
matrix(1,3)=k;
state0=aloha_input_matrix(matrix,D,L);
pi(state0)=1;
state_final = pi*(P^(k)); %%%%%×¢ÒâÊÇK
matrix11(1,1)=L;
matrix11(1,2)=k+1;
matrix11(1,3)=0;
i=aloha_input_matrix(matrix11,D,L);
success_pro=state_final(i); 
end