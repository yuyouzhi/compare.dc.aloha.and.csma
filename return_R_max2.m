function [R_max]=return_R_max2(N,L,D,p)
%�����ٴ��ϵͳ��������ȷģ��
%%%%%%%%%%%%%%%%%%%%%%%
%��ⷽ����
%Ϊ����ÿ��state����̬�ֲ������ݷ�����XP=X,x1+x2+x3+..=1,����������ʽ�����һ����p��һ�еľ���A,���AX=B;
 %P=zeros((L+1)^N*D,(L+1)^N*D);
 

%P=p_transmit_aloha(N,L,D);        %%%%%%����һ��״̬ת�ƾ���p 
%P=p_transmit2(N,L,D )
P=p_transmit_aloha_exact (N,D,L,p);

for  i=1:(L+1)^N*(D+1)                         % i=1:(L+1)^(D+1) %i=0:
     eval(sprintf('syms x%i;x(i)=x%i;',i,i));      %����״̬   
end
x

A =x*P-x ;       %���A��XP-X�ľ��󣬿����ϵ������

A=[A(1,1:end-1),sum(x)-1];
X=solve(A); 
R=0;%Rϵͳ��������
for i=(L+1)^N*D+1 :(L+1)^N*(D+1)  
    G= input_realnumber_output_matrix(i,N,L);
    for f=1:N
        if G(f,1)==L
       R=R+eval(sprintf('X.x%d',i));  
        end
    end
end
 v=double(solve(diff(R),p));    
  y=zeros(1,length(v));  
for i=1:length(v)
    if    0<abs(v(i)) &&abs(v(i))<1
    y(i)=subs(R,p,abs(v(i)));
    end
end
R_max=double(max(y));

