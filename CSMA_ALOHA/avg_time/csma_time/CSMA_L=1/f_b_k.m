%csma全概率公式
%求平均发送时间
%K=4;%在这里K代表时限D
%b=0~K-1
%F=zeros(K,K-1);  %f(b,1,k)
%P=1/K;    %P(B=b)
function[ success_pro]=f_b_k(D,pb,pc,b,k)
L=1;
%D=4;
%pb=0.1;
%pc=0.2;
P=f_prob_csma(D,pb,pc,L);
pi = zeros(1,size(P,1)); %initial pi
matrix = zeros(1,3);
matrix(1,1)=b;
matrix(1,2)=1;
matrix(1,3)=k;
state0=prob_input_matrix(D,matrix);
pi(state0)=1;
state_final = pi*(P^(k)); %%%%%注意是K
for i=1:D*(D+1):D*(D+1)*(D+1)
    G= prob_input_realnumber(D,i);
    if G(1,2)==(matrix(1,3)+1)   %
        success_pro=state_final(i);
    end
end