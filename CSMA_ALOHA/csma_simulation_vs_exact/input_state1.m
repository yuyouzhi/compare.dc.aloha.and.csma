%��״̬���ǣ�D*(L+1))^N*(D+2) ��ȷģ�͵�csma  
function [matrix]=input_state1(N,D ,L,state)
matrix=zeros(N,3);
matrix(:,3)=floor((state-1)/(D*(L+1))^N);
k1=state-matrix(1,3)*(D*(L+1))^N; 
k2= floor( (k1-1)/D^N );
 
for i=1:N-1      
    if i==1
        matrix(i,2)=floor((k1-1)/(D^N*(L+1)^(N-i)));  
        f=k1- matrix(i,2)*(D^N*(L+1)^(N-i));
    else
         matrix(i,2)=floor((f-1)/(D^N*(L+1)^(N-i)));
         f=f-matrix(i,2)*(D^N*(L+1)^(N-i));
    end
end 
 matrix(N,2)=floor((f-1)/D^N);  
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
     
     