 
%����ʵ���õ�����
%ʵ����ʾ����վ�����Ǹ�״̬�������Ǿ���������s��t��
function [matrix]=input_realnumber_output_matrix(realnumber,N,L)
matrix=zeros(N,2);
t=floor((realnumber-1)/(L+1)^N);
for i=1:N
matrix(i,:)=t; 
end
for i=1:N
    if i==1
        k=realnumber-t*(L+1)^N;
    else
    k=k-(L+1)^(N-(i-1))*s;
    end
s =floor((k-1)/(L+1)^(N-i));
matrix(i)=s;
end
 