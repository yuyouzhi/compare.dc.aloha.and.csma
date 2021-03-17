%转移矩阵D为时限，K为还要多少个时隙才能传输成功 L=2
function[matrix]=L2_input_realnumber(D,realnumber,L)
matrix=zeros(1,4);  %
matrix(1,4)=floor((realnumber-1)/((L+1)*(D+1)*D))+1;
k1=mod(realnumber,(L+1)*D*(D+1));
if k1~=0
    matrix(1,1)=floor((k1-1)/(D*(D+1)));
    k2=mod(k1,D*(D+1));
    if k2~=0
        matrix(1,2)=floor((k2-1)/(D+1));
        k3=mod(k2-1,D+1);
        matrix(1,3)=k3;
    else
        matrix(1,2)=D-1;
        matrix(1,3)=D;
    end
else
    matrix(1,1)=L;
    matrix(1,2)=D-1;
    matrix(1,3)=D;
end
end