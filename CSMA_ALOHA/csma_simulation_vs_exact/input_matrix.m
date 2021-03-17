
%总状态数是（D*(L+1))^N*(D+2) 精确模型的csma
function [state]=input_matrix(N, D,L ,matrix)
state2=0;
state3=0;
state1 =matrix(1,3)*(D*(L+1))^N;
for i=1:N
    state2=state2+ matrix(i,2)*D^N*(L+1)^(N-i);
end
for i=1:N
    state3=state3+matrix(i,1)*D^(N-i);
end
state=state2+state3+state1+1;
end







