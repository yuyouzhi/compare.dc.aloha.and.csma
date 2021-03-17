function[P]=aloha_transimit_L2(D,L,ps)

P=zeros((D+1)*(D+1)*(L+1));  %¶¨Òå×ªÒÆ¾ØÕó
for s=1:(D+1)*(D+1)*(L+1)
    if s>(L+1)*(D+1)*D
        P(s,s)=1;
    else
        matrix=aloha_input_inter(s,D,L);
        if matrix(1,3)==0||matrix(1,1)==L
            P(s,s)=1;
        else
          matrix1=matrix;
          matrix1(1,2)=matrix1(1,2)+1;
          matrix1(1,3)=matrix1(1,3)-1;
          s1=aloha_input_matrix(matrix1,D,L);
          P(s,s1)=1-ps;
           matrix1(1,1)=matrix1(1,1)+1;
             s2=aloha_input_matrix(matrix1,D,L);
          P(s,s2)=ps; 
        end 
    end
end
sum(P,2)
end