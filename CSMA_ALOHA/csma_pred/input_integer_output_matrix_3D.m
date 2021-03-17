
%对于csma粗略模型，输入一个实数，输出一个矩阵  matrix=（b,l,t）  b=0,D-1  l=0,L  t=0，D-1
%总状态（L+1）*D*(D+2)
function [matrix]=input_integer_output_matrix_3D(D,L,integer) 
matrix=zeros(1,3);
matrix(1,3)=floor((integer-1)/((L+1)*D));
k=((L+1)*D)*matrix(1,3);
 matrix(1,1) = floor((integer-k-1)/(L+1)); 
 k1=(matrix(1,1)+1)*(L+1);
matrix(1,2)= integer-k- k1+L;
end