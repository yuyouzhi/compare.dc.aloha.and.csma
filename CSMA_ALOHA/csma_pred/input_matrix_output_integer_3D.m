
%����csma����ģ�ͣ�����һ���������һ��ʵ��      ��״̬����L+1��*D*(D+2)    
 
function [integer]=input_matrix_output_integer_3D(D,L,matrix)   
    k3=matrix(1,3)*(L+1)*D;
    k1=matrix(1,1)*(L+1);
integer= matrix(1,2)+k1+k3+1;
end