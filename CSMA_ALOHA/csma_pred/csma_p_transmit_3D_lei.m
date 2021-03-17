%csma粗略模型的概率转移矩阵
function [ P]=csma_p_transmit_3D_lei( L,D ,pb,pc )              %在 csma_p_transmit2上改
P=zeros((L+1)*D*(D+2),(L+1)*D*(D+2));
for s=1:(L+1)*D*(D+2)
  matrix = input_integer_output_matrix_3D(D,L,s);
  bb = matrix(1,1);
  ll = matrix(1,2);
  tt = matrix(1,3);
  if(tt==0)
      if(bb==0 && ll==0)
          for b2=0:D-1
              s2 = input_matrix_output_integer_3D(D,L,[b2,ll,tt+1]);
              P(s,s2)=1/D;
          end
      else %invalid state
          P(s,s)=1;
      end
  elseif (tt<D+1) %tt=1,2,...,D
      if( ll==L || ( L-ll > D - mod(tt-1,D))) % the packet has been successfully deliveredy or cannot complete the delivery even it transmits in the rest of slots before the end of the period.
        s2=input_matrix_output_integer_3D(D,L,[bb,ll,tt+1]);
        P(s,s2)=1;
      else  % it is possible to transmit a unit
        if(bb==0) %the backoff time is 0
            s2=input_matrix_output_integer_3D(D,L,[bb,ll+1,tt+1]); % no collision
            P(s,s2)=1-pc;
            
            for b2=0:D-1 % a collision happens
                s2=input_matrix_output_integer_3D(D,L,[b2,ll,tt+1]);
                P(s,s2)=pc/D;
            end
        else % bb > 0, perform carrier-sensing
            s2=input_matrix_output_integer_3D(D,L,[bb,ll,tt+1]); % channel is busy
            P(s,s2)=pb;
            
            s2=input_matrix_output_integer_3D(D,L,[bb-1,ll,tt+1]); % channel is idle
            P(s,s2)=1-pb;
        end
      end
  else %t==D+1
      s2 = input_matrix_output_integer_3D(D,L,[0,0,0]);
      P(s,s2)=1;
  end
    
end
end