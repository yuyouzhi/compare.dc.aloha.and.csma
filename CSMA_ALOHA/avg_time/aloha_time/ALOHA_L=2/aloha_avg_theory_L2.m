%ALOHA
%L=1;

function[avg_time]=aloha_avg_theory_L2(D,ps)
F=zeros(1,D);
for k=1:D
    F(1,k)=(1-ps)^(k-1)*ps;
end
avg_time=0;
C=F/sum(F);  %C(k): P(X=k|X <= D)   
for k=1:D
avg_time=avg_time+C(k)*k;
end
end