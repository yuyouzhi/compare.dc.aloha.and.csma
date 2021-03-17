function[avg_time]=aloha_avg_theoryL2(D,ps,L)
F=zeros(1,D);  %(B,K) 
%pb=0.2;
%pc=0.9;
for i=1:D   
        F(1,i)=L2_aloha(D,ps,i,L);
end
avg_time=0;
C=F/sum(F);  %C(k): P(X=k|X <= D)   
for k=1:D
avg_time=avg_time+C(k)*k;
end
end