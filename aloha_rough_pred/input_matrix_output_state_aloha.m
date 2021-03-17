%%%%%%%%%%
%对于粗略模型，输入一个（s，t）输出一个实数，该实时表示第几个状态
%t=0:d
function [state]=input_matrix_output_state_aloha(matrix,L)
state=matrix(1,1)+1+matrix(1,2)*(L+1);