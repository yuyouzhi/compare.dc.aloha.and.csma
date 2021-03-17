function [  P]=p_transmit_aloha_rough (D,L,pt,ps)
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���ش�������p,��ALOHA��ת�ƾ���
P=zeros((L+1)*(D+1),(L+1)*(D+1));  %����ת�ƾ���
%��һ����ʾ�ڼ���״̬��ʵ���������Nʱ��״̬��s,t��
%�ж�����ľ���s,t���ڵ�s�Ƿ����L,�������L�ĸ���Ϊx������վ������x��������D-t>=s
for s=1:(L+1)*(D+1) %��ʾ�ڼ���״̬
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