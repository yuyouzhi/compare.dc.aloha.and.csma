%总状态数是（D*(L+1))^N*(D+2) 精确模型的csma  
function [matrix]=input_state0(N,D ,L,state)
matrix=zeros(N,3);
matrix(:,3)=floor((state-1)/(D*(L+1))^N);
k1=state-matrix(1,3)*(D*(L+1))^N; 
k2= floor( (k1-1)/D^N );
for i=1:N-1
   if i==1 
     matrix(i,2)=floor((k2-1)/(L+1)^(N-i) );
     k3=k2-matrix(i,2)*(L+1)^(N-i);
   else
       matrix(i,2)=floor(k3/(L+1)^(N-i)); 
       k3=k3-matrix(i,2)*(L+1)^(N-i);
   end  
end
   matrix(N,2)=matrix(N,2)+k3;  
 SA=k1-k2*D^N;
 for i=1:N-1
     if i==1
     matrix(i,1)=floor((SA-1)/D^(N-i));
     r= SA-  matrix(i,1)*D^(N-i);
     else
      matrix(i,1)=floor((r-1)/D^(N-i) );   
       r= r-matrix(i,1)*D^(N-i);
     end     
 end
   matrix(N,1)=r-1;   
end
     
     
     
  


