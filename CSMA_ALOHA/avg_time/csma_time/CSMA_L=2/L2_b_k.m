%csma全概率公式
%求平均发送时间
%K=4;%在这里K代表时限D
%b=0~K-1
%F=zeros(K,K-1);  %f(b,1,k)
%P=1/K;    %P(B=b)
function[ success_pro]=L2_b_k(D,pb,pc,b,k,L)
 
%D=4;
%pb=0.1;
%pc=0.2;
P=L2_prob_csma(D,pb,pc,L);
pi = zeros(1,size(P,1)); %initial pi
matrix = zeros(1,4);
matrix(1,1)=0;
matrix(1,2)=b;
matrix(1,3)=k;
matrix(1,4)=1;
state0=L2_input_matrix(D,matrix,L);
pi(state0)=1;
state_final = pi*(P^(k)); %%%%%注意是K
matrix11(1,1)=L;
matrix11(1,2)=0;
matrix11(1,3)=0;
matrix11(1,4)=k+1;
i=L2_input_matrix(D,matrix11,L);
success_pro=state_final(i);
   
end