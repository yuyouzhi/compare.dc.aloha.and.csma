function[avg_time]=csma_avg_theory(D,pb,pc)
F=zeros(D,D);  %(B,K) 
%pb=0.2;
%pc=0.9;
for i=1:D   
    for k=1:D
      b=i-1;
        F(i,k)=f_b_k(D,pb,pc,b,k);
    end
end
avg_time=0;
B=sum(F)/D;  %B(k):  P(X=k)
C=B/sum(B);  %C(k): P(X=k|X <= D)   
for k=1:D
avg_time=avg_time+C(k)*k;
end
end