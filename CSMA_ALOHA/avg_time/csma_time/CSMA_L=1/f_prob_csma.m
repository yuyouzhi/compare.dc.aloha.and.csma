
function[ P]=f_prob_csma(D,pb,pc,L)
%b����ָ����f(b,1,k)
%L=1
P=zeros(D*(D+1)*(D+1));  %����ת�ƾ���
for s=1:D*(D+1)*(D+1)
    if s>D*(D+1)*D                  
        P(s,s)=1; %���һ��ʱ϶
    else
        matrix=prob_input_realnumber(D,s);
        if  matrix(1,3)> matrix(1,1)
            if matrix(1,3)==0
                P(s,s)=1;             %�Ѿ��ɹ�������
            else
                if matrix(1,1)==0
                    matrix3= matrix;
                    matrix3(1,2)= matrix(1,2)+1;
                    matrix3(1,3)=matrix(1,3)-1;
                    if matrix(1,3)==L
                        s3=prob_input_matrix(D,matrix3);
                        P(s,s3)=1-pc;
                        matrix3(1,1)=1;
                        s3=prob_input_matrix(D,matrix3);
                        P(s,s3)=pc;
                    else
                        for i=0:D-1
                            matrix3(1,1)=i;
                            s3=prob_input_matrix(D,matrix3);
                            P(s,s3)=pc*(1/D);
                        end
                        matrix3(1,1)=1;
                        matrix3(1,3)=0;
                        s3=prob_input_matrix(D,matrix3);
                        P(s,s3)=1-pc;
                    end
                else
                    matrix2= matrix;
                    matrix2(1,2)= matrix(1,2)+1;
                    matrix2(1,3)=matrix(1,3)-1;
                        s2= prob_input_matrix(D,matrix2);
                        P(s,s2)=pb;
                        matrix2(1,1)=matrix(1,1)-1;
                        s2= prob_input_matrix(D,matrix2);
                        P(s,s2)=1-pb;                           
                end
            end
        else
            P(s,s)=1;
        end
    end
end
%sum(P,2)
end
