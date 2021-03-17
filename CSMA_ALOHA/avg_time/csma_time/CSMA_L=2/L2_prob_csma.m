
function[ P]=L2_prob_csma(D,pb,pc,L)
%b代表指定的f(b,1,k)
 
P=zeros(D*(D+1)*(D+1)*(L+1));  %定义转移矩阵
for s=1:D*(D+1)*(D+1)*(L+1)
    if s>D*D*(D+1)*(L+1)
        P(s,s)=1; %最后一个时隙
    else
        matrix=L2_input_realnumber(D,s,L);
        if   matrix(1,3)>=( matrix(1,2)+L-matrix(1,1)) 
            if (matrix(1,3)>= L- matrix(1,1))
                if matrix(1,2)==0
                    matrix3= matrix;
                    matrix3(1,3)= matrix(1,3)-1;
                    matrix3(1,4)=matrix(1,4)+1;
                    if matrix(1,3)==(L-matrix(1,1))
                        s3=L2_input_matrix(D,matrix3,L);
                        P(s,s3)=pc;
                        matrix3(1,1)=matrix3(1,1)+1;
                        s3=L2_input_matrix(D,matrix3,L);
                        P(s,s3)=1-pc;
                    else
                        if  matrix(1,1)==L
                            P(s,s)=1;
                        else
                        
                        for i=0:D-1
                            matrix3(1,2)=i;
                            s3=L2_input_matrix(D,matrix3,L);
                            P(s,s3)=pc*(1/D);
                        end
                        matrix3(1,1)=matrix3(1,1)+1;
                        matrix3(1,2)=0;
                        s3=L2_input_matrix(D,matrix3,L);
                        P(s,s3)=1-pc;
                        
                        end
                        
                    end
                else
                    matrix2= matrix;
                    matrix2(1,3)= matrix(1,3)-1;
                    matrix2(1,4)=matrix(1,4)+1;
                    s2= L2_input_matrix(D,matrix2,L);
                    P(s,s2)=pb;
                    matrix2(1,2)=matrix(1,2)-1;
                    s2= L2_input_matrix(D,matrix2,L);
                    P(s,s2)=1-pb;                    
                end
            else
                P(s,s)=1;
            end
            
        else
            P(s,s)=1;
        end
    end
end
sum(P,2)
end
