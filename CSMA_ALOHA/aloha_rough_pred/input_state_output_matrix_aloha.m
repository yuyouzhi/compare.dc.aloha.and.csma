%%%%%%%%%%
%输入一个实数输出一个矩阵（s，t）
%t=0:d
function [matrix]=input_state_output_matrix_aloha(state,L)
matrix(1,2)=floor((state-1)/(L+1));
matrix(1,1)=state-(L+1)*matrix(1,2)-1;
end