


 

%%%%%%%%%%%%%%%%%%
%该函数输入一个矩阵可得到一个实数
%该矩阵是N个站点在第t个slot结束前已经成功发送完s个单位长度（s，t）的集合，实数表示在（N,S,T）构成的马尔可夫链中该集合是第几个状态state.
function [state]=input_matrix_output_realnumber(matrix,N,L)
%要将这三个参数设置成变量
%输入的矩阵
j=1;
state=(L+1)^N*matrix(1,2);
for i=1:N
state=state+(L+1)^(N-j)*matrix(i,1);
j=j+1;
end
state=state+1;
end