%%%%%%%%%%
%���ڴ���ģ�ͣ�����һ����s��t�����һ��ʵ������ʵʱ��ʾ�ڼ���״̬
%t=0:d
function [state]=input_matrix_output_state_aloha(matrix,L)
state=matrix(1,1)+1+matrix(1,2)*(L+1);