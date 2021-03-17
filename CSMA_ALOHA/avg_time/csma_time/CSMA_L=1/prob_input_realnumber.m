%转移矩阵D为时限，K为还要多少个时隙才能传输成功
function[matrix]=prob_input_realnumber(D,realnumber)
matrix=zeros(1,3);  %
matrix(1,2)=floor((realnumber-1)/((D+1)*D))+1;
g=mod(realnumber,(D+1)*D);
if g~=0
    matrix(1,1)=floor((g-1)/(D+1));
       g1=mod(g,D+1);
       if g1~=0
        matrix(1,3)=g1-1;
       else
        matrix(1,3)=D;    
       end
    
else
    matrix(1,1)=D-1;
    matrix(1,3)=D;
end