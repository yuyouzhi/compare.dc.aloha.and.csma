


 

%%%%%%%%%%%%%%%%%%
%�ú�������һ������ɵõ�һ��ʵ��
%�þ�����N��վ���ڵ�t��slot����ǰ�Ѿ��ɹ�������s����λ���ȣ�s��t���ļ��ϣ�ʵ����ʾ�ڣ�N,S,T�����ɵ�����ɷ����иü����ǵڼ���״̬state.
function [state]=input_matrix_output_realnumber(matrix,N,L)
%Ҫ���������������óɱ���
%����ľ���
j=1;
state=(L+1)^N*matrix(1,2);
for i=1:N
state=state+(L+1)^(N-j)*matrix(i,1);
j=j+1;
end
state=state+1;
end