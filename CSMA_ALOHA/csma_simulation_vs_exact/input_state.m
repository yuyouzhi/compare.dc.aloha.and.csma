%总状态数是（D*(L+1))^N*(D+2) 精确模型的csma  
function [matrix]=input_state(N,D ,L,state)
matrix=zeros(N,3);
matrix(:,3)=floor((state-1)/(D*(L+1))^N);
k1=state-matrix(1,3)*(D*(L+1))^N;
kk1=0;
k=0;
for i=1:N
    if i==1
        matrix(i,2)=floor((k1-1)/(D^N*(L+1)^(N-i)));
        kk1=k1-matrix(i,2)*(D^N)*(L+1);
    else
        matrix(i,2)=floor((kk1-1)/(D^N));
        kk1=k1- matrix(i,2)*(D^N)*(L+1);
    end
end
 state2=0;
for i=1:N
 state2=state2+ matrix(i,2)*D^N*(L+1)^(N-i);
end
kk3=k1-state2;
 for i=1:N
   if i==1
        matrix(i,1)=floor((kk3-1)/(D^(N-i)));
        k=kk3-matrix(i,1)*D;
    else
        matrix(i,1)=floor((k-1)/(D^(N-i)));
        k=kk3- matrix(i,1)*D;
    end
 
end


