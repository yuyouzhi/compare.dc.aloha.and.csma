function [R_max]=return_R_max2(N,L,D,p)
%返回再大的系统吞吐量精确模型
%%%%%%%%%%%%%%%%%%%%%%%
%求解方程组
%为了求每个state的稳态分布，根据方程组XP=X,x1+x2+x3+..=1,将这两个公式构造成一个比p多一行的矩阵，A,求解AX=B;
 %P=zeros((L+1)^N*D,(L+1)^N*D);
 

%P=p_transmit_aloha(N,L,D);        %%%%%%给出一个状态转移矩阵p 
%P=p_transmit2(N,L,D )
P=p_transmit_aloha_exact (N,D,L,p);

for  i=1:(L+1)^N*(D+1)                         % i=1:(L+1)^(D+1) %i=0:
     eval(sprintf('syms x%i;x(i)=x%i;',i,i));      %定义状态   
end
x

A =x*P-x ;       %这个A是XP-X的矩阵，可求得系数矩阵

A=[A(1,1:end-1),sum(x)-1];
X=solve(A); 
R=0;%R系统的吞吐量
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

