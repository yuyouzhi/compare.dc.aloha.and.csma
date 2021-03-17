function[matrix]=aloha_input_inter(number,D,L)
matrix=zeros(1,3);
matrix(1,2)=floor((number-1)/((L+1)*(D+1)))+1;
k1=mod(number,(L+1)*(D+1));
if k1==0
    matrix(1,1)=L;
    matrix(1,3)=D;
else    
    matrix(1,1)=floor((k1-1)/(D+1));
    k2= mod(k1,(D+1));
    if k2==0
        matrix(1,3)=D;
    else
        matrix(1,3) =k2-1;
    end
end
end