function [  P]=p_transmit_aloha_rough (D,L,pt,ps)
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%设重传概率是p,求ALOHA的转移矩阵
P=zeros((L+1)*(D+1),(L+1)*(D+1));  %定义转移矩阵
%给一个表示第几个状态的实数求出所有N时的状态（s,t）
%判断求出的矩阵（s,t）在的s是否等于L,如果等于L的个数为x，则竞争站数减少x个，或者D-t>=s
for s=1:(L+1)*(D+1) %表示第几个状态
   matrix=  input_state_output_matrix_aloha(s,L);   
   if  matrix(1,2)==0
       if s==1
            matrix1= matrix;
            matrix1(1,2)= matrix(1,2)+1;
            s1= input_matrix_output_state_aloha(matrix1,L);
            P(s,s1)=1-pt*ps;
             matrix1(1,1)= matrix(1,1)+1;
              s1= input_matrix_output_state_aloha(matrix1,L);
            P(s,s1)=pt*ps;
       else
           P(s,s)=1;
       end
   elseif  matrix(1,2)<D
         
         matrix2= matrix;
         matrix2(1,2)= matrix(1,2)+1;
          
             
         if  matrix(1,1)==L||  (D-matrix(1,2)<L-matrix(1,1)) 
             s2=input_matrix_output_state_aloha(matrix2,L);
             P(s,s2)=1;
         else
              s2=input_matrix_output_state_aloha(matrix2,L);
             P(s,s2)=1-pt*ps;
            matrix2(1,1)= matrix(1,1)+1;
             s2=input_matrix_output_state_aloha(matrix2,L);
             P(s,s2)=pt*ps;   
         end      
   else
       P(s,1)=1;
   end
end
end